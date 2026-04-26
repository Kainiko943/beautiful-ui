# Before/After Eval Artifacts

These are Seeded proof artifacts for running fair Beautiful UI comparisons. They are not claimed as live model transcripts until a run folder includes the model, date, prompts, raw output, screenshots, and scores.

## Fair Run Rules

- Run the weak baseline and Beautiful UI prompt through the same model, date, repo state, and agent surface.
- Keep raw outputs unchanged in the run folder.
- Score both outputs with the same UI quality rubric.
- Capture desktop and mobile evidence when an implementation exists.
- Mark generated screenshots, model names, and missing evidence explicitly.

## Artifact Layout

- `manifest.json` lists the comparison cases.
- `cases/*.json` defines prompts, expected deltas, rubric targets, and evidence requirements.
- `../rubrics/ui-quality-rubric.json` provides machine-readable scoring dimensions.

## Seeded Run Status

The current case files are seeded comparison contracts. A future real run should add `runs/YYYY-MM-DD-agent-name/<case>/baseline.md`, `beautiful-ui.md`, `scores.json`, and optional screenshots.
