---
name: platform-web-ui
description: Use when the UI needs web-specific responsive layout, browser interaction patterns, accessibility behavior, or browser-based verification.
---

# Platform Web UI

## Overview

Use this adapter when the design target is a browser-based product. Preserve the visual direction from `beautiful-ui`, then adapt it for responsive layout, browser interaction, and web accessibility.

## Rules

- Design desktop and mobile layouts intentionally.
- Treat hover, focus, active, disabled, loading, validation, and empty states as first-class.
- Keep forms, tables, filters, and navigation feasible in HTML/CSS terms.
- Use semantic structure, keyboard navigation, visible focus, and contrast checks.
- Prefer implementation notes that can be verified in a browser.

## Handoff Must Include

- Breakpoint behavior
- Navigation behavior
- Form and table behavior
- Focus and keyboard behavior
- Reduced motion notes

