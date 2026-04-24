---
name: beautiful-ui
description: Use when users ask to design, redesign, or improve the interface for a product, app, site, screen, flow, or dashboard and the main goal is a beautiful, intentional UI before implementation.
---

# Beautiful UI

## Overview

Use this skill when the primary job is UI design quality. Do not jump straight into code. Inspect the product and repo, choose a visual direction, define a design-system core, design the key screens and states, adapt for the target platform, then verify the handoff.

## Workflow

1. Inspect the repo, product context, audience, and existing UI signals.
2. Define the visual direction before implementation.
3. Build the design-system core: color, type, spacing, surfaces, corners, borders, shadows, and motion.
4. Design the key screens and the important states.
5. Load the right platform adapter.
6. Produce implementation-facing handoff.
7. Run `ui-verification` before calling the design complete.

## Output Contract

- Visual direction
- Design-system core
- Prioritized screen plan
- Screen-by-screen UI spec
- Component guidance
- State coverage
- Platform-specific handoff
- Verification checklist

## Adapter Selection

- Use `platform-web-ui` for responsive browser products.
- Use `platform-ios-ui` for iPhone or iPad-first native apps.
- Use `platform-android-ui` for Android-first native apps.
- Use multiple adapters only when the product must span platforms.
- If platform is unclear after repo inspection, ask one short question.

## Read These References

- `references/design-principles.md`
- `references/default-workflow.md`
- `references/output-templates.md`
- `references/anti-patterns.md`
- `references/platform-selection.md`
- `references/repo-first-design.md`

## Guardrails

- Do not start with implementation.
- Do not produce generic card piles, arbitrary gradients, or default-font layouts.
- Do not design only the happy path.
- Do not force pixel parity across platforms.
- Do not invent components before checking the repo.
- Do not skip accessibility, localization pressure, reduced motion, focus behavior, or state coverage.

