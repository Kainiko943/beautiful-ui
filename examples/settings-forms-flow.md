# Settings Forms Flow Example

## Scenario

Account settings and forms flow for a SaaS product.

## Before Prompt

```text
Design settings screens.
```

Likely failure: flat form pages, unclear save behavior, missing validation, and no destructive-action safeguards.

## Beautiful UI Prompt

```text
Use beautiful-ui to design a polished settings and forms flow. Define form density, navigation, validation language, save behavior, and confirmation patterns. Spec profile, security, billing, team settings, destructive dialogs, loading, dirty, saved, error, disabled, focus, and empty invite states. Use platform-web-ui and ui-verification.
```

## Expected Handoff

Visual direction: quiet, dependable, organized, and optimized for confidence during account changes.

Design-system core: clear section rhythm, compact labels, explicit help text, calm borders, direct validation color, and persistent save feedback.

State coverage: dirty form, save in progress, saved confirmation, validation errors, disabled save, empty team members, billing load failure, modal confirmation, and selected settings section.

Accessibility: form labels, described validation, keyboard tab order, focus trap in dialogs, contrast-safe errors, and reduced motion.

Platform adapter: `platform-web-ui`.

Verification: `ui-verification` checks state coverage, form accessibility, navigation clarity, and implementation readiness.

## Evidence To Capture

- Before evidence: weak-prompt output showing flat forms, unclear save behavior, weak validation, or missing destructive-action safeguards.
- After evidence: Beautiful UI handoff excerpt showing the dependable Visual direction, form density, save model, and platform-web-ui adapter choice.
- Check evidence: screenshot or spec notes for dirty, saving, saved, validation error, disabled, empty invite, destructive dialog, State coverage, and Accessibility.
