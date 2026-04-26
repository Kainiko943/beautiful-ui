# beautiful-ui

Make AI coding agents design beautiful, accessible, platform-native UI.

Beautiful UI is the taste layer Claude users install when they want S-tier UI instead of generic AI screens. It teaches Codex, Claude Code, Cursor-style agents, and other coding assistants to choose a visual direction, reuse the repo's design system, cover states, adapt to the target platform, and verify the handoff before writing UI code. It includes a cinematic web path for demo-worthy cinematic web experiences with a technology ladder for video, Lottie, Rive, Spline, canvas, Three.js/WebGL, shaders, motion systems, responsive fallbacks, and visual verification.

![Beautiful UI comparison: without beautiful-ui vs with beautiful-ui](docs/assets/beautiful-ui-comparison.png)

Born from a component-driven UI framework, rebuilt for AI agents.

See the [rendered before/after gallery](docs/gallery.md) for browser-captured evidence examples across dashboards, mobile finance, admin tables, landing pages, cinematic web, and settings flows. The gallery now pairs each example with seeded before/after eval contracts and a [UI quality rubric](docs/rubrics/ui-quality-rubric.md).

Run `powershell -ExecutionPolicy Bypass -File scripts/verify-rendered-gallery.ps1` to enforce the rendered evidence gate: screenshot dimensions, nonblank pixels, example links, package validation, and Playwright desktop/mobile overflow checks.

## Why Claude users install it

- Claude stops jumping straight to generic layouts.
- It gets a repeatable design workflow before implementation.
- Cinematic builds get a strict recipe: choose the right media/3D technology, add particles, bloom, glass, scroll reveals, fallbacks, and Playwright screenshots.
- Every output is judged against an S-tier quality bar before it is treated as complete.

Start here: [Claude quickstart](docs/claude-quickstart.md), [S-tier quality bar](docs/s-tier-quality-bar.md), and [cinematic eval prompts](evals/cinematic-prompts.md). For React teams, use the [shadcn + Tailwind guide](docs/framework-guides/shadcn-tailwind.md).

## Start in 60 seconds

```powershell
git clone https://github.com/Kainiko943/beautiful-ui.git
cd beautiful-ui
powershell -ExecutionPolicy Bypass -File scripts/install-claude-skills.ps1
```

For Codex:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1
```

Then ask your agent:

```text
Use beautiful-ui to redesign this app screen. Start with visual direction, define the design-system core, select the platform adapter, cover states, and run ui-verification before handoff.
```

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
cp -R beautiful-ui/framework-shadcn-tailwind-ui ~/.codex/skills/
cp -R beautiful-ui/cinematic-web-experience ~/.codex/skills/
cp -R beautiful-ui/platform-ios-ui ~/.codex/skills/
cp -R beautiful-ui/platform-android-ui ~/.codex/skills/
cp -R beautiful-ui/ui-verification ~/.codex/skills/
```

## Repository status

This is a v0.1 launch package. The skill interface is intentionally small and stable enough to try, while the examples and platform adapters will grow through community contributions.

## Relationship to Material

Beautiful UI was born from the neighboring `Material` UIKit framework as a seed reference for component vocabulary, theming, layout primitives, motion, navigation, cards, forms, and stateful controls. That relationship is historical and inspirational.

This package is not a dependency on `Material`, not a fork or release of that Swift framework, and not a requirement to use Material Design as the product's visual style. Treat `Material` as legacy/reference context only. The current package is a set of Markdown skills, platform adapters, examples, and verification guidance for AI coding agents.

The Android adapter may mention Material expectations because Android users often expect those interaction patterns, but Beautiful UI still prioritizes the product, platform, repo, and brand over any single visual language.

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
Use beautiful-ui and cinematic-web-experience to build a premium dark cinematic landing page with a full-screen focal scene, particles, bloom, glass panels, scroll reveals, reduced-motion fallback, Playwright screenshot verification, and a justified Cinematic Technology Ladder choice.
```

For a stricter Claude-ready workflow, use [the cinematic web recipe](recipes/claude-cinematic-web.md).

## Before/after examples

- [SaaS dashboard](examples/saas-dashboard.md)
- [Mobile finance app](examples/mobile-finance-app.md)
- [Admin table](examples/admin-table.md)
- [Landing page](examples/landing-page.md)
- [Cinematic web experience](examples/cinematic-web-experience.md)
- [Settings and forms flow](examples/settings-forms-flow.md)

Each example includes the weak prompt, the stronger beautiful-ui prompt, and the expected handoff shape.

The examples are prompt-led before/after evidence, not rendered screenshot case studies yet. For each one, compare the weak prompt's likely failure mode with the Beautiful UI handoff, then capture concrete evidence: visual direction, state coverage, accessibility notes, platform adapter choice, and screenshots or browser checks when an implementation exists.

## What this is not

- Not a full UI code generator.
- Not a single visual theme.
- Not the legacy `Material` Swift framework.
- Not a screenshot cloning workflow.
- Not a replacement for platform design judgment.

Beautiful UI improves agent design behavior before implementation so generated interfaces have stronger hierarchy, better states, clearer accessibility, better platform fit, and a path to cinematic demo-quality web experiences when the product calls for it.

## Roadmap

See [ROADMAP.md](ROADMAP.md) and [docs/launch-plan.md](docs/launch-plan.md).
