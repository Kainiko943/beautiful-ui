# Contributing

Beautiful UI grows through concrete examples, focused adapters, and practical verification guidance.

## Good first contributions

- Add a before/after example for a real product category.
- Improve an adapter with platform-native guidance.
- Add accessibility or state coverage checks.
- Test install steps on an agent surface and report the result.

## Contribution rules

- Keep skills concise and searchable.
- Put platform-specific detail in adapters, not the core skill.
- Include states: empty, loading, error, success, disabled, focus, and selection when relevant.
- Prefer examples with exact prompts and expected handoff.
- Do not promise full code generation.

## Validation

Run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-package.ps1
powershell -ExecutionPolicy Bypass -File scripts/verify-rendered-gallery.ps1
```

Run the rendered-gallery verifier when you change examples, rendered evidence, gallery HTML, screenshot assets, cinematic guidance, or validation scripts. Use `-RegenerateScreenshots` when the rendered gallery changed.
