# beautiful-ui

Make AI coding agents design beautiful, accessible, platform-native UI.

Beautiful UI is an agent skill package for Codex, Claude Code, Cursor-style agents, and other coding assistants. It teaches agents to choose a visual direction, reuse the repo's design system, cover states, adapt to the target platform, and verify the handoff before writing UI code. It now includes a cinematic web path for demo-worthy cinematic web experiences with WebGL/Three.js direction, motion systems, responsive fallbacks, and visual verification.

![Beautiful UI comparison: without beautiful-ui vs with beautiful-ui](docs/assets/beautiful-ui-comparison.png)

Born from a component-driven UI framework, rebuilt for AI agents.

## 10-second value demo

Without this skill:

```text
Make a dashboard UI.
```

Most agents jump straight to generic cards, gradients, and placeholder charts.

With this skill:

```text
Use beautiful-ui to redesign this dashboard. Inspect the repo, choose a visual direction, define tokens, cover empty/loading/error states, adapt for web, and return implementation-ready handoff.
```

The agent must produce a visual direction, design-system core, screen plan, component guidance, state coverage, platform handoff, and verification checklist before treating the design as complete.

## Install

See [docs/install.md](docs/install.md) for copy-paste setup.

Manual install:

```bash
git clone https://github.com/Kainiko943/beautiful-ui.git
cp -R beautiful-ui/beautiful-ui ~/.codex/skills/
cp -R beautiful-ui/platform-web-ui ~/.codex/skills/
cp -R beautiful-ui/cinematic-web-experience ~/.codex/skills/
cp -R beautiful-ui/platform-ios-ui ~/.codex/skills/
cp -R beautiful-ui/platform-android-ui ~/.codex/skills/
cp -R beautiful-ui/ui-verification ~/.codex/skills/
```

## Repository status

This is a v0.1 launch package. The skill interface is intentionally small and stable enough to try, while the examples and platform adapters will grow through community contributions.

## Compatibility matrix

| Agent surface | Status | Install style |
| --- | --- | --- |
| Codex CLI | First-class | Copy skill folders into `~/.codex/skills` |
| Claude Code | First-class | Copy skill folders into Claude skills directory |
| Cursor-style agents | Prompt-compatible | Reference `beautiful-ui/SKILL.md` and adapters as project rules |
| Cline / Roo-style agents | Prompt-compatible | Add skill files as workspace instructions |
| Manual human handoff | Supported | Use examples and output templates directly |

## Pasteable prompts

```text
Use beautiful-ui to design the primary UI for this product. Inspect the repo first, choose a visual direction, define the design-system core, design key screens and states, select the right platform adapter, and run ui-verification before handoff.
```

```text
Use beautiful-ui to rescue this interface from generic AI UI. Keep what fits the product, replace weak hierarchy, cover loading/empty/error states, and produce implementation-ready notes.
```

```text
Use beautiful-ui with the web adapter. Design responsive desktop and mobile layouts, including hover, focus, disabled, validation, empty, and error states.
```

```text
Use beautiful-ui and cinematic-web-experience to build a premium dark WebGL landing page with a full-screen hero, particles, bloom, glass panels, scroll reveals, reduced-motion fallback, and Playwright screenshot verification.
```

## Before/after examples

- [SaaS dashboard](examples/saas-dashboard.md)
- [Mobile finance app](examples/mobile-finance-app.md)
- [Admin table](examples/admin-table.md)
- [Landing page](examples/landing-page.md)
- [Cinematic web experience](examples/cinematic-web-experience.md)
- [Settings and forms flow](examples/settings-forms-flow.md)

Each example includes the weak prompt, the stronger beautiful-ui prompt, and the expected handoff shape.

## What this is not

- Not a full UI code generator.
- Not a single visual theme.
- Not a screenshot cloning workflow.
- Not a replacement for platform design judgment.

Beautiful UI improves agent design behavior before implementation so generated interfaces have stronger hierarchy, better states, clearer accessibility, better platform fit, and a path to cinematic demo-quality web experiences when the product calls for it.

## Roadmap

See [ROADMAP.md](ROADMAP.md) and [docs/launch-plan.md](docs/launch-plan.md).
