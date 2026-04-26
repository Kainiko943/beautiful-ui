param(
  [Parameter(Mandatory = $true)]
  [string]$ScoreFile,
  [string]$RubricFile = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'evals/rubrics/ui-quality-rubric.json')
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $ScoreFile -PathType Leaf)) {
  throw "Missing score file: $ScoreFile"
}
if (-not (Test-Path $RubricFile -PathType Leaf)) {
  throw "Missing rubric file: $RubricFile"
}

$score = Get-Content -Raw -LiteralPath $ScoreFile | ConvertFrom-Json
$rubric = Get-Content -Raw -LiteralPath $RubricFile | ConvertFrom-Json
$scoreNames = @($score.scores.PSObject.Properties.Name)
$failures = New-Object System.Collections.Generic.List[string]
$total = 0
$count = 0

foreach ($dimension in $rubric.dimensions) {
  if ($scoreNames -notcontains $dimension.id) {
    $failures.Add("Missing score for $($dimension.id)") | Out-Null
    continue
  }

  $value = [int]$score.scores.$($dimension.id)
  if ($value -lt $rubric.scale.min -or $value -gt $rubric.scale.max) {
    $failures.Add("Score for $($dimension.id) must be between $($rubric.scale.min) and $($rubric.scale.max)") | Out-Null
  }
  if ($value -lt $rubric.passThreshold.minimumPerDimension) {
    $failures.Add("Score for $($dimension.id) is below minimum per-dimension threshold") | Out-Null
  }
  $total += $value
  $count += 1
}

foreach ($dimension in $rubric.passThreshold.requiredDimensions) {
  if ($scoreNames -contains $dimension -and [int]$score.scores.$dimension -lt 3) {
    $failures.Add("Required dimension $dimension must score at least 3") | Out-Null
  }
}

if (@($score.criticalFailures).Count -gt 0) {
  $failures.Add("Critical failures present: $(@($score.criticalFailures) -join '; ')") | Out-Null
}

$average = if ($count -gt 0) { [math]::Round($total / $count, 2) } else { 0 }
if ($average -lt $rubric.passThreshold.minimumAverage) {
  $failures.Add("Average score $average is below threshold $($rubric.passThreshold.minimumAverage)") | Out-Null
}

if ($failures.Count -gt 0) {
  Write-Host "UI rubric score failed: average $average" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "UI rubric score passed: average $average" -ForegroundColor Green
