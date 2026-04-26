# Mobile Finance App Example

## Scenario

Calm personal finance app for everyday spending awareness.

## Before Prompt

```text
Create a mobile finance UI.
```

Likely failure: generic fintech gradients, decorative cards, tiny numbers, missing trust cues, and no error or privacy states.

## Beautiful UI Prompt

```text
Use beautiful-ui to design a calm personal finance app. Define a trust-focused visual direction, choose a design-system core for balances and spending categories, then spec the home dashboard, transaction detail, add expense flow, budget warning, loading, empty, error, success, and privacy states. Adapt for iOS and Android separately, then run ui-verification.
```

## Expected Handoff

Visual direction: quiet, trustworthy, legible, and reassuring rather than flashy.

Design-system core: crisp number typography, muted financial category colors, generous touch spacing, restrained success/error tones, and motion that confirms actions without drawing attention.

State coverage: hidden-balance mode, no transactions, bank sync loading, sync failure, add expense success, validation errors, disabled submit, and selected category.

Accessibility: Dynamic Type or equivalent scaling, contrast-safe category labels, non-color warnings, reduced motion, and comfortable touch targets.

Platform adapter: `platform-ios-ui` and `platform-android-ui`.

Verification: `ui-verification` checks native navigation, privacy-sensitive states, and handoff completeness.

## Evidence To Capture

- Before evidence: weak-prompt output showing flashy finance styling, small financial data, missing trust cues, or no privacy treatment.
- After evidence: Beautiful UI handoff excerpt showing the trust-focused Visual direction, platform split for iOS and Android, and calm number hierarchy.
- Check evidence: screenshots or spec notes for hidden balance, sync loading/failure, validation, success, disabled submit, State coverage, and Accessibility.

## Rendered Evidence

- [Open rendered gallery case](../docs/rendered-gallery.html#mobile-finance)
- [Desktop screenshot](../docs/assets/rendered-gallery-desktop.png)
- [Mobile screenshot](../docs/assets/rendered-gallery-mobile.png)
