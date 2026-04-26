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
  'framework-shadcn-tailwind-ui/SKILL.md',
  'framework-shadcn-tailwind-ui/references/component-patterns.md',
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
  'docs/claude-quickstart.md',
  'docs/s-tier-quality-bar.md',
  'docs/rubrics/ui-quality-rubric.md',
  'docs/framework-guides/shadcn-tailwind.md',
  'docs/gallery.md',
  'docs/gallery-cases.json',
  'docs/rendered-gallery.html',
  'docs/assets/rendered-gallery-desktop.png',
  'docs/assets/rendered-gallery-mobile.png',
  'scripts/install-claude-skills.ps1',
  'scripts/install-codex-skills.ps1',
  'scripts/validate-eval-artifacts.ps1',
  'scripts/score-ui-rubric.ps1',
  'scripts/verify-rendered-gallery.ps1',
  'evals/cinematic-prompts.md',
  'evals/before-after/README.md',
  'evals/before-after/manifest.json',
  'evals/before-after/cases/saas-dashboard.json',
  'evals/before-after/cases/mobile-finance.json',
  'evals/before-after/cases/admin-table.json',
  'evals/before-after/cases/landing-page.json',
  'evals/before-after/cases/cinematic-web.json',
  'evals/before-after/cases/settings-forms.json',
  'evals/rubrics/ui-quality-rubric.json',
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
  'framework-shadcn-tailwind-ui',
  'cinematic-web-experience',
  'platform-ios-ui',
  'platform-android-ui',
  'ui-verification',
  'examples',
  'docs',
  'docs/rubrics',
  'docs/framework-guides',
  'recipes',
  'evals',
  'evals/before-after',
  'evals/before-after/cases',
  'evals/rubrics',
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
Assert-Contains 'README.md' 'Claude users' 'Claude positioning'
Assert-Contains 'README.md' 'S-tier' 'S-tier positioning'
Assert-Contains 'README.md' 'shadcn \+ Tailwind guide' 'framework guide positioning'
Assert-Contains 'README.md' 'Start in 60 seconds' 'fast-start section'
Assert-Contains 'README.md' '10-second value demo' 'demo section'
Assert-Contains 'README.md' 'Compatibility matrix' 'compatibility section'
Assert-Contains 'README.md' 'Born from a component-driven UI framework, rebuilt for AI agents' 'Material heritage note'
Assert-Contains 'README.md' 'https://github.com/Kainiko943/beautiful-ui' 'public repository URL'
Assert-Contains 'docs/install.md' 'https://github.com/Kainiko943/beautiful-ui' 'install repository URL'
Assert-Contains 'beautiful-ui/SKILL.md' '^name: beautiful-ui$' 'core skill metadata'
Assert-Contains 'platform-web-ui/SKILL.md' '^name: platform-web-ui$' 'web adapter metadata'
Assert-Contains 'framework-shadcn-tailwind-ui/SKILL.md' '^name: framework-shadcn-tailwind-ui$' 'shadcn Tailwind adapter metadata'
Assert-Contains 'framework-shadcn-tailwind-ui/SKILL.md' 'shadcn/create|shadcn@latest' 'current shadcn setup guidance'
Assert-Contains 'cinematic-web-experience/SKILL.md' '^name: cinematic-web-experience$' 'cinematic web skill metadata'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Three.js|WebGL' 'cinematic web technology guidance'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Cinematic Technology Ladder' 'cinematic technology ladder'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Lottie|Rive|Spline' 'pre-rendered cinematic media options'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Playwright' 'cinematic web verification guidance'
Assert-Contains 'cinematic-web-experience/SKILL.md' 'Recreate A Reference Experience' 'reference recreation workflow'
Assert-Contains 'recipes/claude-cinematic-web.md' 'WORK.*CONTACT' 'minimal nav requirement'
Assert-Contains 'recipes/claude-cinematic-web.md' 'nonblank canvas' 'canvas verification requirement'
Assert-Contains 'recipes/claude-cinematic-web.md' 'Cinematic Technology Ladder' 'recipe technology ladder'
Assert-Contains 'evals/cinematic-prompts.md' 'do not use custom WebGL unless' 'eval technology restraint'
Assert-Contains 'recipes/claude-cinematic-web.md' 'recreate the style' 'recreation prompt'
Assert-Contains 'docs/claude-quickstart.md' 'Claude Code' 'Claude quickstart'
Assert-Contains 'docs/s-tier-quality-bar.md' 'S-tier' 'S-tier quality bar'
Assert-Contains 'docs/rubrics/ui-quality-rubric.md' 'Critical failures' 'UI rubric critical failures'
Assert-Contains 'docs/framework-guides/shadcn-tailwind.md' 'framework-shadcn-tailwind-ui' 'framework guide adapter name'
Assert-Contains 'docs/gallery.md' 'rendered-gallery.html' 'rendered gallery link'
Assert-Contains 'docs/gallery.md' 'gallery-cases.json' 'gallery case metadata link'
Assert-Contains 'docs/rendered-gallery.html' 'Rendered before/after evidence' 'rendered gallery title'
Assert-Contains 'docs/rendered-gallery.html' 'Rubric score' 'rendered gallery rubric score'
Assert-Contains 'scripts/install-claude-skills.ps1' 'cinematic-web-experience' 'Claude installer copies cinematic skill'
Assert-Contains 'scripts/install-claude-skills.ps1' 'framework-shadcn-tailwind-ui' 'Claude installer copies framework skill'
Assert-Contains 'scripts/install-codex-skills.ps1' 'CODEX_HOME' 'Codex installer respects CODEX_HOME'
Assert-Contains 'scripts/install-codex-skills.ps1' 'beautiful-ui skills installed' 'Codex installer success message'
Assert-Contains 'scripts/install-claude-skills.ps1' 'beautiful-ui skills installed' 'Claude installer success message'
Assert-Contains 'scripts/validate-eval-artifacts.ps1' 'Eval artifact validation passed' 'eval artifact validator success message'
Assert-Contains 'scripts/score-ui-rubric.ps1' 'UI rubric score passed' 'rubric scorer success message'
Assert-Contains 'scripts/verify-rendered-gallery.ps1' 'nonblank|under-rendered' 'rendered screenshot nonblank check'
Assert-Contains 'scripts/verify-rendered-gallery.ps1' 'horizontal overflow' 'rendered gallery overflow check'
Assert-Contains 'scripts/verify-rendered-gallery.ps1' 'RegenerateScreenshots' 'rendered screenshot regeneration option'
Assert-Contains 'evals/cinematic-prompts.md' 'Pass criteria' 'cinematic eval pass criteria'
Assert-Contains 'evals/cinematic-prompts.md' 'Claude should' 'Claude eval expectation'
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
  Assert-Contains $relative '## Rendered Evidence' 'rendered evidence links'
}

if ($failures.Count -gt 0) {
  Write-Host "Validation failed:" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Validation passed: beautiful-ui launch package is complete." -ForegroundColor Green
