param(
  [string]$SourceRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [string]$ClaudeSkillsDir = (Join-Path $env:USERPROFILE '.claude\skills')
)

$ErrorActionPreference = 'Stop'

$skillFolders = @(
  'beautiful-ui',
  'platform-web-ui',
  'cinematic-web-experience',
  'platform-ios-ui',
  'platform-android-ui',
  'ui-verification'
)

New-Item -ItemType Directory -Force -Path $ClaudeSkillsDir | Out-Null

foreach ($folder in $skillFolders) {
  $source = Join-Path $SourceRoot $folder
  $destination = Join-Path $ClaudeSkillsDir $folder

  if (-not (Test-Path $source -PathType Container)) {
    throw "Missing skill folder: $source"
  }

  if (Test-Path $destination) {
    Remove-Item -LiteralPath $destination -Recurse -Force
  }

  Copy-Item -LiteralPath $source -Destination $destination -Recurse
}

Write-Host "beautiful-ui skills installed to $ClaudeSkillsDir"
