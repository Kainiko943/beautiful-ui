param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
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

  $content = Get-Content -Raw -LiteralPath $path
  if (-not [regex]::IsMatch($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)) {
    Add-Failure "Missing ${label} in ${relativePath}: $pattern"
  }
}

function Read-Json([string]$relativePath) {
  $path = Join-Path $Root $relativePath
  if (-not (Test-Path $path -PathType Leaf)) {
    Add-Failure "Missing JSON file: $relativePath"
    return $null
  }

  try {
    return Get-Content -Raw -LiteralPath $path | ConvertFrom-Json
  } catch {
    Add-Failure "Invalid JSON in ${relativePath}: $($_.Exception.Message)"
    return $null
  }
}

$caseIds = @(
  'saas-dashboard',
  'mobile-finance',
  'admin-table',
  'landing-page',
  'cinematic-web',
  'settings-forms'
)

Assert-File 'evals/before-after/README.md'
Assert-File 'evals/before-after/manifest.json'
Assert-File 'evals/rubrics/ui-quality-rubric.json'
Assert-Contains 'evals/before-after/README.md' 'Seeded proof artifacts' 'seeded artifact disclosure'
Assert-Contains 'evals/before-after/README.md' 'same model' 'fair comparison guidance'
Assert-Contains 'docs/rubrics/ui-quality-rubric.md' 'Critical failures' 'critical failure section'

$manifest = Read-Json 'evals/before-after/manifest.json'
if ($null -ne $manifest) {
  if ($manifest.schemaVersion -ne 1) {
    Add-Failure 'manifest schemaVersion must be 1'
  }
  $manifestCases = @($manifest.cases | ForEach-Object { $_.id })
  foreach ($caseId in $caseIds) {
    if ($manifestCases -notcontains $caseId) {
      Add-Failure "manifest missing case: $caseId"
    }
  }
}

foreach ($caseId in $caseIds) {
  $relative = "evals/before-after/cases/$caseId.json"
  $case = Read-Json $relative
  if ($null -eq $case) {
    continue
  }

  foreach ($field in @('id', 'title', 'baselinePrompt', 'beautifulUiPrompt', 'expectedDelta', 'rubricTargets', 'evidenceToCapture')) {
    if (-not $case.PSObject.Properties.Name.Contains($field)) {
      Add-Failure "${relative} missing field: $field"
    }
  }

  if ($case.id -ne $caseId) {
    Add-Failure "${relative} id '$($case.id)' does not match filename '$caseId'"
  }
  if (@($case.rubricTargets).Count -lt 4) {
    Add-Failure "${relative} must include at least four rubric targets"
  }
  if (@($case.evidenceToCapture).Count -lt 3) {
    Add-Failure "${relative} must include at least three evidence items"
  }
}

$rubric = Read-Json 'evals/rubrics/ui-quality-rubric.json'
if ($null -ne $rubric) {
  if ($rubric.scale.min -ne 0 -or $rubric.scale.max -ne 4) {
    Add-Failure 'rubric scale must be 0-4'
  }
  if (@($rubric.dimensions).Count -lt 8) {
    Add-Failure 'rubric must include at least eight dimensions'
  }
  foreach ($dimension in @('visual-direction', 'hierarchy', 'state-coverage', 'accessibility', 'platform-fit', 'verification-evidence')) {
    if (@($rubric.dimensions | ForEach-Object { $_.id }) -notcontains $dimension) {
      Add-Failure "rubric missing dimension: $dimension"
    }
  }
}

if ($failures.Count -gt 0) {
  Write-Host "Eval artifact validation failed:" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Eval artifact validation passed." -ForegroundColor Green
