---
name: framework-shadcn-tailwind-ui
description: Use with beautiful-ui and platform-web-ui when the target web app uses shadcn/ui components, Tailwind CSS utilities, or a React component system built from copied component source.
---

# Framework Shadcn Tailwind UI

## Overview

Use this adapter after `beautiful-ui` and `platform-web-ui` when implementation should land in a shadcn/ui + Tailwind codebase. Preserve the product-specific visual direction, then express it through local components, tokens, variants, and stateful composition.

## Current Setup Notes

As of April 26, 2026, shadcn/ui recommends `shadcn/create` or `shadcn@latest init -t [framework]` for supported frameworks, with existing-project setup handled through the official framework guide. Tailwind CSS v4 uses CSS-first configuration and `@import "tailwindcss"` in new installs. Verify official docs before giving exact setup commands in generated project work.

Official references:

- https://ui.shadcn.com/docs/installation
- https://ui.shadcn.com/docs/installation/next
- https://tailwindcss.com/docs/installation

## Rules

- Treat shadcn/ui as editable source, not a black-box component library.
- Use existing local components before adding new shadcn components.
- Define theme tokens in CSS variables or the repo's established Tailwind setup before adding one-off utility piles.
- Prefer component variants for repeated states such as intent, density, size, loading, invalid, and selected.
- Use `data-*` attributes, `aria-*` attributes, and visible focus styles for stateful controls.
- Keep class strings readable; extract variants or local wrappers when repeated class combinations carry product meaning.
- Do not turn every surface into a `Card`; reserve cards for repeated objects, tools, modals, and framed content.

## Handoff Must Include

- Components to add or reuse.
- Token changes and where they belong.
- Variant names for recurring states.
- Tailwind layout constraints for desktop and mobile.
- Accessibility attributes and focus behavior.
- Verification commands and screenshot targets.

## Read These References

- `references/component-patterns.md`
