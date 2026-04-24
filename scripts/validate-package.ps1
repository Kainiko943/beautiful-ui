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

function Assert-Directory([string]$relativePath) {
  $path = Join-Path $Root $relativePath
  if (-not (Test-Path $path -PathType Container)) {
    Add-Failure "Missing directory: $relativePath"
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

$requiredFiles = @(
  'README.md',
  'LICENSE.md',
  'CODE_OF_CONDUCT.md',
  'CONTRIBUTING.md',
  'ROADMAP.md',
  'SECURITY.md',
  'SUPPORT.md',
  'beautiful-ui/SKILL.md',
  'beautiful-ui/agents/openai.yaml',
  'beautiful-ui/references/design-principles.md',
  'beautiful-ui/references/default-workflow.md',
  'beautiful-ui/references/output-templates.md',
  'beautiful-ui/references/anti-patterns.md',
  'beautiful-ui/references/platform-selection.md',
  'beautiful-ui/references/repo-first-design.md',
  'platform-web-ui/SKILL.md',
  'cinematic-web-experience/SKILL.md',
  'cinematic-web-experience/references/cinematic-web-guidelines.md',
  'platform-ios-ui/SKILL.md',
  'platform-android-ui/SKILL.md',
  'ui-verification/SKILL.md',
  'examples/saas-dashboard.md',
  'examples/mobile-finance-app.md',
  'examples/admin-table.md',
  'examples/landing-page.md',
  'examples/cinematic-web-experience.md',
  'examples/settings-forms-flow.md',
  'recipes/claude-cinematic-web.md',
  'docs/launch-plan.md',
  'docs/install.md',
  '.github/ISSUE_TEMPLATE/example.yml',
  '.github/ISSUE_TEMPLATE/adapter.yml',
  '.github/ISSUE_TEMPLATE/docs.yml',
  '.github/ISSUE_TEMPLATE/config.yml'
)

$requiredDirectories = @(
  'beautiful-ui',
  'platform-web-ui',
  'cinematic-web-experience',
  'platform-ios-ui',
  'platform-android-ui',
  'ui-verification',
  'examples',
  'docs',
  'recipes',
  '.github/ISSUE_TEMPLATE'
)

foreach ($directory in $requiredDirectories) {
  Assert-Directory $directory
}

foreach ($file in $requiredFiles) {
  Assert-File $file
}

Assert-Contains 'README.md' 'Make AI coding agents design beautiful, accessible, platform-native UI' 'public tagline'
Assert-Contains 'README.md' 'demo-worthy cinematic web experiences' 'cinematic positioning'
Assert-Contains 'README.md' '10-second value demo' 'demo section'
Assert-Contains 'README.md' 'Compatibility matrix' 'compatibility section'
Assert-Contains 'README.md' 'Born from a component-driven UI framework, rebuilt for AI agents' 'Material heritage note'
Assert-Contains 'README.md' 'https://github.com/Kainiko943/beautiful-ui' 'public repository URL'
Assert-Contains 'docs/install.md' 'https://github.com/Kainiko943/beautiful-ui' 'install repository URL'
Assert-Contains 'beautiful-ui/SKILL.md' '^name: beautiful-ui$' 'core skill metadata'
Assert-Contains 'platform-web-ui/SKILL.md' '^name: platform-web-ui$' 'web adapter metadata'
Assert-Contains 'cinematic-web-experience/SKILL.md' '^name: cinematic-web-experience$' 'cinematic web skill metadata'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Three.js|WebGL' 'cinematic web technology guidance'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Playwright' 'cinematic web verification guidance'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Recreate A Reference Experience' 'reference recreation workflow'
Assert-Contains 'recipes/claude-cinematic-web.md' 'WORK.*CONTACT' 'minimal nav requirement'
Assert-Contains 'recipes/claude-cinematic-web.md' 'nonblank canvas' 'canvas verification requirement'
Assert-Contains 'recipes/claude-cinematic-web.md' 'recreate the style' 'recreation prompt'
Assert-Contains 'platform-ios-ui/SKILL.md' '^name: platform-ios-ui$' 'iOS adapter metadata'
Assert-Contains 'platform-android-ui/SKILL.md' '^name: platform-android-ui$' 'Android adapter metadata'
Assert-Contains 'ui-verification/SKILL.md' '^name: ui-verification$' 'verification metadata'

$examples = Get-ChildItem (Join-Path $Root 'examples') -Filter '*.md' -ErrorAction SilentlyContinue
foreach ($example in $examples) {
  $relative = "examples/$($example.Name)"
  Assert-Contains $relative '## Before Prompt' 'before prompt'
  Assert-Contains $relative '## Beautiful UI Prompt' 'beautiful-ui prompt'
  Assert-Contains $relative '## Expected Handoff' 'expected handoff'
  Assert-Contains $relative 'Visual direction' 'visual direction evidence'
  Assert-Contains $relative 'State coverage' 'state coverage evidence'
  Assert-Contains $relative 'Accessibility' 'accessibility evidence'
}

if ($failures.Count -gt 0) {
  Write-Host "Validation failed:" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Validation passed: beautiful-ui launch package is complete." -ForegroundColor Green
