# SaaS Dashboard Example

## Scenario

Revenue Ops Dashboard for a B2B SaaS company.

## Before Prompt

```text
Make a dashboard for our SaaS metrics.
```

Likely failure: generic metric cards, arbitrary charts, weak filtering, no empty or loading states, and no keyboard focus guidance.

## Beautiful UI Prompt

```text
Use beautiful-ui to design a Revenue Ops dashboard for a B2B SaaS company. Inspect existing components first. Define the visual direction and design-system core, then design desktop and mobile layouts with filters, metric cards, charts, table drill-down, loading, empty, error, disabled, and keyboard focus states. Use platform-web-ui and finish with ui-verification.
```

## Expected Handoff

Visual direction: calm, precise, revenue-focused, with high scanability and restrained color for status and trend.

Design-system core: neutral surfaces, one confident accent, compact type scale, 8px spacing rhythm, clear focus rings, and subtle borders over decorative shadows.

State coverage: loading skeletons for charts and tables, empty-state guidance for no data, error recovery for failed metrics, disabled export state, selected filter state, and keyboard focus order.

Accessibility: visible focus, contrast-safe trend colors, non-color status labels, table headers, and reduced motion for chart transitions.

Platform adapter: `platform-web-ui`.

Verification: `ui-verification` confirms visual direction, responsive behavior, state coverage, accessibility, and implementation handoff.

## Evidence To Capture

- Before evidence: weak-prompt output showing generic cards, unclear chart purpose, missing filters, or absent state planning.
- After evidence: Beautiful UI handoff excerpt showing the revenue-focused Visual direction, filter/table hierarchy, and platform-web-ui adapter choice.
- Check evidence: screenshot or spec notes for loading, empty, error, disabled, selected filter, keyboard focus, and Accessibility coverage.
