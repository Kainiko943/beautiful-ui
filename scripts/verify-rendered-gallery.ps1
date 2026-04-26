param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [switch]$RegenerateScreenshots,
  [switch]$SkipPackageValidation
)

$ErrorActionPreference = 'Stop'
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure([string]$message) {
  $script:failures.Add($message) | Out-Null
}

function Assert-File([string]$relativePath) {
  $path = Join-Path $Root $relativePath
  if (-not (Test-Path $path -PathType Leaf)) {
    Add-Failure "Missing file: $relativePath"
  }
}

function Assert-Contains([string]$relativePath, [string]$pattern, [string]$label) {
  $path = Join-Path $Root $relativePath
  if (-not (Test-Path $path -PathType Leaf)) {
    Add-Failure "Cannot inspect missing file for ${label}: $relativePath"
    return
  }

  $content = Get-Content -Raw $path
  if (-not [regex]::IsMatch($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)) {
    Add-Failure "Missing ${label} in ${relativePath}: $pattern"
  }
}

function Invoke-Step([scriptblock]$step, [string]$label) {
  try {
    & $step
  } catch {
    Add-Failure "${label}: $($_.Exception.Message)"
  }
}

function Get-FileUri([string]$path) {
  return ([System.Uri](Resolve-Path $path).Path).AbsoluteUri
}

function Assert-PngQuality([string]$relativePath, [int]$expectedWidth, [int]$minHeight, [int]$minKb) {
  $path = Join-Path $Root $relativePath
  if (-not (Test-Path $path -PathType Leaf)) {
    Add-Failure "Missing PNG: $relativePath"
    return
  }

  $sizeKb = [math]::Round((Get-Item $path).Length / 1KB, 1)
  if ($sizeKb -lt $minKb) {
    Add-Failure "${relativePath} is unexpectedly small: ${sizeKb}KB"
  }

  Add-Type -AssemblyName System.Drawing
  $image = [System.Drawing.Image]::FromFile((Resolve-Path $path))
  try {
    if ($image.Width -ne $expectedWidth) {
      Add-Failure "${relativePath} width is $($image.Width), expected $expectedWidth"
    }
    if ($image.Height -lt $minHeight) {
      Add-Failure "${relativePath} height is $($image.Height), expected at least $minHeight"
    }

    $bitmap = New-Object System.Drawing.Bitmap $image
    try {
      $colors = New-Object 'System.Collections.Generic.HashSet[int]'
      $samples = 0
      $nonWhiteSamples = 0
      $stepX = [Math]::Max(1, [Math]::Floor($bitmap.Width / 24))
      $stepY = [Math]::Max(1, [Math]::Floor($bitmap.Height / 32))
      for ($y = 0; $y -lt $bitmap.Height; $y += $stepY) {
        for ($x = 0; $x -lt $bitmap.Width; $x += $stepX) {
          $pixel = $bitmap.GetPixel($x, $y)
          $colors.Add($pixel.ToArgb()) | Out-Null
          $samples += 1
          if ($pixel.R -lt 245 -or $pixel.G -lt 245 -or $pixel.B -lt 245) {
            $nonWhiteSamples += 1
          }
        }
      }

      if ($colors.Count -lt 50) {
        Add-Failure "${relativePath} appears blank or visually under-rendered; sampled only $($colors.Count) colors"
      }
      $nonWhiteRatio = $nonWhiteSamples / [Math]::Max(1, $samples)
      if ($nonWhiteRatio -lt 0.1) {
        Add-Failure "${relativePath} appears too empty; sampled nonwhite pixel ratio was $([math]::Round($nonWhiteRatio * 100, 1))%"
      }
    } finally {
      $bitmap.Dispose()
    }
  } finally {
    $image.Dispose()
  }
}

function Invoke-Playwright([string[]]$arguments, [string]$label) {
  & npx --yes playwright @arguments
  if ($LASTEXITCODE -ne 0) {
    Add-Failure "${label} failed with exit code $LASTEXITCODE"
  }
}

$galleryHtml = 'docs/rendered-gallery.html'
$galleryCases = 'docs/gallery-cases.json'
$desktopPng = 'docs/assets/rendered-gallery-desktop.png'
$mobilePng = 'docs/assets/rendered-gallery-mobile.png'
$requiredCases = @(
  'saas-dashboard',
  'mobile-finance',
  'admin-table',
  'landing-page',
  'cinematic-web',
  'settings-forms'
)

Assert-File $galleryHtml
Assert-File $galleryCases
Assert-File $desktopPng
Assert-File $mobilePng

foreach ($case in $requiredCases) {
  Assert-Contains $galleryHtml "id=`"$case`"" "rendered gallery case $case"
}

Assert-Contains 'docs/gallery.md' 'assets/rendered-gallery-desktop\.png' 'desktop rendered screenshot reference'
Assert-Contains 'docs/gallery.md' 'rendered-gallery\.html' 'rendered gallery HTML reference'
Assert-Contains 'docs/gallery.md' 'gallery-cases\.json' 'gallery case metadata reference'
Assert-Contains $galleryHtml 'Rubric score' 'rubric score proof strip'
Assert-Contains $galleryHtml 'Average target: 3\.6 / 4' 'average rubric target'

if (-not $RegenerateScreenshots) {
  $galleryWriteTime = (Get-Item (Join-Path $Root $galleryHtml)).LastWriteTimeUtc
  foreach ($screenshot in @($desktopPng, $mobilePng)) {
    $screenshotPath = Join-Path $Root $screenshot
    if ((Test-Path $screenshotPath -PathType Leaf) -and (Get-Item $screenshotPath).LastWriteTimeUtc -lt $galleryWriteTime) {
      Add-Failure "$screenshot is older than $galleryHtml; run verify-rendered-gallery.ps1 -RegenerateScreenshots"
    }
  }
}

$exampleFiles = Get-ChildItem (Join-Path $Root 'examples') -Filter '*.md' -ErrorAction SilentlyContinue
foreach ($example in $exampleFiles) {
  $relative = "examples/$($example.Name)"
  Assert-Contains $relative '## Rendered Evidence' 'rendered evidence section'
  Assert-Contains $relative 'rendered-gallery\.html#[a-z0-9-]+' 'rendered gallery anchor link'
  Assert-Contains $relative 'rendered-gallery-desktop\.png' 'desktop screenshot link'
  Assert-Contains $relative 'rendered-gallery-mobile\.png' 'mobile screenshot link'
}

if ($RegenerateScreenshots) {
  Invoke-Step {
    $url = Get-FileUri (Join-Path $Root $galleryHtml)
    Invoke-Playwright @('screenshot', '--viewport-size=1440,1800', '--full-page', $url, (Join-Path $Root $desktopPng)) 'desktop screenshot capture'
    Invoke-Playwright @('screenshot', '--viewport-size=390,1800', '--full-page', $url, (Join-Path $Root $mobilePng)) 'mobile screenshot capture'
  } 'Regenerate screenshots'
}

Invoke-Step {
  Assert-PngQuality $desktopPng 1440 2400 100
  Assert-PngQuality $mobilePng 390 3200 80
} 'PNG quality checks'

Invoke-Step {
  $tempDir = Join-Path $Root ".tmp-rendered-gallery-$([Guid]::NewGuid().ToString('N'))"
  New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
  $harness = Join-Path $tempDir 'overflow-check.html'
  $desktopCheck = Join-Path $tempDir 'desktop-check.png'
  $mobileCheck = Join-Path $tempDir 'mobile-check.png'
  $galleryPath = Join-Path $Root $galleryHtml
  $galleryContent = Get-Content -Raw -LiteralPath $galleryPath
  $caseList = ($requiredCases | ForEach-Object { "'$_'" }) -join ', '

  $checkScript = @'
  <style>
    #status { position: fixed; inset: 0 auto auto 0; z-index: 2; padding: 8px; font: 12px sans-serif; background: white; }
  </style>
  <div id="status">checking</div>
  <script>
    const cases = [__CASES__];
    window.addEventListener('load', () => {
      const status = document.getElementById('status');
      try {
        const root = document.documentElement;
        const missingCases = cases.filter((id) => !document.getElementById(id));
        const offenders = Array.from(document.querySelectorAll('body *'))
          .filter((el) => {
            if (el.id === 'status') return false;
            const rect = el.getBoundingClientRect();
            return rect.width > 1 && rect.right > root.clientWidth + 1;
          })
          .slice(0, 10)
          .map((el) => {
            const rect = el.getBoundingClientRect();
            return el.tagName.toLowerCase() + (el.id ? '#' + el.id : '') + '.' + Array.from(el.classList).join('.') + ' right=' + Math.round(rect.right);
          });
        const overflow = root.scrollWidth > root.clientWidth + 1;
        if (missingCases.length || offenders.length || overflow) {
          status.id = 'fail';
          status.textContent = JSON.stringify({ scrollWidth: root.scrollWidth, clientWidth: root.clientWidth, missingCases, offenders });
          return;
        }
        status.id = 'pass';
        status.textContent = 'pass';
      } catch (error) {
        status.id = 'fail';
        status.textContent = error.message;
      }
    });
  </script>
'@.Replace('__CASES__', $caseList)

  $harnessContent = $galleryContent -replace '</body>', "$checkScript`n</body>"
  $harnessContent | Set-Content -LiteralPath $harness -Encoding UTF8

  try {
    $harnessUrl = Get-FileUri $harness
    # The temporary browser harness checks required anchors and horizontal overflow.
    Invoke-Playwright @('screenshot', '--timeout=15000', '--viewport-size=1440,900', '--wait-for-selector=#pass', $harnessUrl, $desktopCheck) 'desktop overflow check'
    Invoke-Playwright @('screenshot', '--timeout=15000', '--viewport-size=390,900', '--wait-for-selector=#pass', $harnessUrl, $mobileCheck) 'mobile overflow check'
  } finally {
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
  }
} 'Playwright DOM checks'

if (-not $SkipPackageValidation) {
  Invoke-Step {
    & powershell -ExecutionPolicy Bypass -File (Join-Path $Root 'scripts/validate-package.ps1') -Root $Root
    if ($LASTEXITCODE -ne 0) {
      Add-Failure "Package validation failed with exit code $LASTEXITCODE"
    }
  } 'Package validation'
}

if ($failures.Count -gt 0) {
  Write-Host "Rendered gallery verification failed:" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Rendered gallery verification passed." -ForegroundColor Green
