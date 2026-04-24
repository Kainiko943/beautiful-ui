# Admin Table Example

## Scenario

Dense admin review queue for support and operations teams.

## Before Prompt

```text
Make this admin table look better.
```

Likely failure: oversized cards, poor density, weak filters, unclear row status, and missing bulk-action states.

## Beautiful UI Prompt

```text
Use beautiful-ui to redesign a high-density admin review queue. Prioritize scanability, filters, row states, selection, bulk actions, keyboard navigation, empty results, loading, error, and responsive table behavior. Use platform-web-ui and run ui-verification before handoff.
```

## Expected Handoff

Visual direction: operational, compact, calm, and optimized for repeated decisions.

Design-system core: dense table rhythm, clear row separators, compact controls, status chips with text labels, restrained color, and strong focus states.

State coverage: loading rows, empty filters, failed refresh, selected rows, disabled bulk action, validation conflict, success toast, and expanded detail panel.

Accessibility: keyboard row navigation, visible focus, sortable header semantics, non-color status labels, and screen-reader-friendly bulk selection.

Platform adapter: `platform-web-ui`.

Verification: `ui-verification` checks information density, responsive behavior, state coverage, and accessibility.

