# Install

## Local Codex install

```powershell
git clone https://github.com/Kainiko943/beautiful-ui.git
Copy-Item -Recurse beautiful-ui\beautiful-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-web-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-ios-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\platform-android-ui $env:USERPROFILE\.codex\skills\
Copy-Item -Recurse beautiful-ui\ui-verification $env:USERPROFILE\.codex\skills\
```

## Claude Code install

Copy the same skill folders into your Claude skills directory, preserving folder names and each `SKILL.md` file.

## Cursor-style usage

Add these files as project rules or agent context:

- `beautiful-ui/SKILL.md`
- the relevant platform adapter
- `ui-verification/SKILL.md`

## Smoke-test prompt

```text
Use beautiful-ui to redesign this app screen. Start with visual direction, define the design-system core, select the platform adapter, cover states, and run ui-verification before handoff.
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

## Troubleshooting

- If a skill does not trigger, confirm the folder contains `SKILL.md` at its root.
- If platform guidance is missing, copy the adapter folder next to `beautiful-ui`.
- If output jumps straight into code, explicitly say: "Use beautiful-ui before implementation."
