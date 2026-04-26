# Install

## Local Codex install

```powershell
git clone https://github.com/Kainiko943/beautiful-ui.git
cd beautiful-ui
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1
```

The Codex installer writes to `$env:CODEX_HOME\skills` when `CODEX_HOME` is set. Otherwise it installs to `%USERPROFILE%\.codex\skills`. To install somewhere else:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1 -CodexSkillsDir "C:\path\to\codex\skills"
```

## Claude Code install

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-claude-skills.ps1
```

The installer copies the same skill folders into `%USERPROFILE%\.claude\skills`, preserving folder names and each `SKILL.md` file. To install somewhere else:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-claude-skills.ps1 -ClaudeSkillsDir "C:\path\to\claude\skills"
```

## Cursor-style usage

Add these files as project rules or agent context:

- `beautiful-ui/SKILL.md`
- `cinematic-web-experience/SKILL.md` for immersive, demo-worthy web experiences
- `framework-shadcn-tailwind-ui/SKILL.md` for shadcn/ui and Tailwind web apps
- the relevant platform adapter
- `ui-verification/SKILL.md`

## Smoke-test prompt

```text
Use beautiful-ui to redesign this app screen. Start with visual direction, define the design-system core, select the platform adapter, cover states, and run ui-verification before handoff.
```

Claude cinematic smoke test:

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification to build a demo-worthy dark cinematic landing page with WORK / CONTACT nav, one cinematic focal scene, particles, bloom, glass panels, scroll reveal, mobile fallback, reduced-motion fallback, Playwright screenshots, nonblank canvas/media verification, and a justified Cinematic Technology Ladder choice.
```

Expected response shape:

- Visual direction
- Design-system core
- Screen plan
- State coverage
- Platform-specific handoff
- Verification checklist

## Validate the package

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-package.ps1
```

The validator checks the required skill folders, public README positioning, install script presence, rendered gallery assets, and each example's `## Before Prompt`, `## Beautiful UI Prompt`, `## Expected Handoff`, `## Rendered Evidence`, Visual direction, State coverage, and Accessibility evidence.

Validate before/after eval artifacts:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-eval-artifacts.ps1
```

## Verify rendered UI evidence

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-rendered-gallery.ps1
```

The rendered-gallery verifier checks screenshot existence, image dimensions, nonblank pixel samples, rendered evidence links, required case anchors, package validation, and Playwright desktop/mobile overflow checks. To refresh the PNG evidence before checking it:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/verify-rendered-gallery.ps1 -RegenerateScreenshots
```

## Troubleshooting

- If a skill does not trigger, confirm the folder contains `SKILL.md` at its root.
- If platform guidance is missing, copy the adapter folder next to `beautiful-ui`.
- If output jumps straight into code, explicitly say: "Use beautiful-ui before implementation."
