# Shadcn + Tailwind Guide

Use `framework-shadcn-tailwind-ui` with `beautiful-ui` and `platform-web-ui` when the target is a React web app using shadcn/ui and Tailwind CSS.

## When To Use It

- The repo has `components.json`, `components/ui/*`, shadcn imports, or Tailwind utility-heavy React components.
- The design needs implementation-ready component guidance, not just visual direction.
- The work includes forms, dashboards, tables, settings, or landing pages that should reuse local components.

## Current Install Direction

As of April 26, 2026, the official shadcn/ui install docs recommend `shadcn/create` for new projects, or the CLI template path such as `shadcn@latest init -t [framework]`. For existing projects, use the relevant official framework guide. Tailwind CSS v4 uses CSS-first setup, including `@import "tailwindcss"` for new installs.

Check the official docs before locking project-specific commands:

- https://ui.shadcn.com/docs/installation
- https://ui.shadcn.com/docs/installation/next
- https://tailwindcss.com/docs/installation

## Beautiful UI Workflow

1. Inspect local `components/ui`, tokens, CSS variables, Tailwind config or CSS-first theme setup, and existing page patterns.
2. Choose the visual direction with product-specific constraints.
3. Map the design to local components before adding new shadcn components.
4. Define token changes before page-level class work.
5. Specify variants for recurring intent, density, loading, invalid, selected, and destructive states.
6. Cover responsive behavior, focus, validation, empty, loading, error, success, and disabled states.
7. Run `ui-verification` and score the result with the UI quality rubric.

## Handoff Template

```text
Use beautiful-ui, platform-web-ui, framework-shadcn-tailwind-ui, and ui-verification. Inspect the repo's shadcn/ui components, Tailwind tokens, CSS variables, and existing page patterns. Choose a product-specific visual direction, map screens to local components, define token and variant changes, cover loading/empty/error/success/disabled/focus/validation states, and verify desktop/mobile screenshots plus accessibility behavior before calling the UI complete.
```

## Common Failure Modes

- Using `Card` for every section instead of designing the workflow hierarchy.
- Adding long utility strings where a token or variant would clarify intent.
- Installing components without checking whether local equivalents already exist.
- Styling the happy path while missing invalid, disabled, loading, and empty states.
- Treating Tailwind as decoration instead of a design-system implementation layer.
