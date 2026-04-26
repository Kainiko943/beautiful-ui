param(
  [string]$SourceRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [string]$CodexSkillsDir = $(if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'skills' } else { Join-Path $env:USERPROFILE '.codex\skills' })
)

$ErrorActionPreference = 'Stop'

$skillFolders = @(
  'beautiful-ui',
  'platform-web-ui',
  'framework-shadcn-tailwind-ui',
  'cinematic-web-experience',
  'platform-ios-ui',
  'platform-android-ui',
  'ui-verification'
)

New-Item -ItemType Directory -Force -Path $CodexSkillsDir | Out-Null

foreach ($folder in $skillFolders) {
  $source = Join-Path $SourceRoot $folder
  $destination = Join-Path $CodexSkillsDir $folder

  if (-not (Test-Path $source -PathType Container)) {
    throw "Missing skill folder: $source"
  }

  if (Test-Path $destination) {
    Remove-Item -LiteralPath $destination -Recurse -Force
  }

  Copy-Item -LiteralPath $source -Destination $destination -Recurse
}

Write-Host "beautiful-ui skills installed to $CodexSkillsDir"
