# Install

## Local Codex install

```powershell
git clone https://github.com/Kainiko943/beautiful-ui.git
Copy-Item -Recurse beautiful-ui\beautiful-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-web-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\cinematic-web-experience $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-ios-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-android-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\ui-verification $env:USERPROFILE\.codex\skills\
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
- the relevant platform adapter
- `ui-verification/SKILL.md`

## Smoke-test prompt

```text
Use beautiful-ui to redesign this app screen. Start with visual direction, define the design-system core, select the platform adapter, cover states, and run ui-verification before handoff.
```

Claude cinematic smoke test:

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification to build a demo-worthy dark cinematic landing page with WORK / CONTACT nav, WebGL-style focal scene, particles, bloom, glass panels, scroll reveal, mobile fallback, reduced-motion fallback, Playwright screenshots, and nonblank canvas/media verification.
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

The validator checks the required skill folders, public README positioning, install script presence, and each example's `## Before Prompt`, `## Beautiful UI Prompt`, `## Expected Handoff`, Visual direction, State coverage, and Accessibility evidence.

## Troubleshooting

- If a skill does not trigger, confirm the folder contains `SKILL.md` at its root.
- If platform guidance is missing, copy the adapter folder next to `beautiful-ui`.
- If output jumps straight into code, explicitly say: "Use beautiful-ui before implementation."
