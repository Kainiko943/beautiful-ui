# Landing Page Example

## Scenario

Product launch landing page for a developer tool.

## Before Prompt

```text
Build a landing page for my product.
```

Likely failure: vague headline, stock gradient hero, generic feature cards, and no mobile or conversion-state planning.

## Beautiful UI Prompt

```text
Use beautiful-ui to design a conversion-focused landing page for a developer tool. Define the brand mood, hero media direction, typography, and proof strategy. Spec the first viewport, product proof, examples, pricing, FAQ, responsive mobile layout, loading media, form validation, disabled submit, and success states. Use platform-web-ui and ui-verification.
```

## Expected Handoff

Visual direction: sharp, credible, product-led, and concrete, with the product visible in the first viewport.

Design-system core: editorial headline scale, precise spacing, clear CTA hierarchy, product screenshots or generated bitmap media, and restrained surfaces for proof sections.

State coverage: loading hero media, email capture validation, disabled submit, success confirmation, pricing toggle state, FAQ open state, and mobile navigation.

Accessibility: contrast-safe hero text, keyboard focus, semantic headings, reduced motion for hero media, and form labels.

Platform adapter: `platform-web-ui`.

Verification: `ui-verification` checks first-viewport clarity, conversion hierarchy, responsiveness, and accessibility.

## Evidence To Capture

- Before evidence: weak-prompt output showing a vague headline, decorative gradient hero, generic feature cards, or missing conversion states.
- After evidence: Beautiful UI handoff excerpt showing product-led Visual direction, first-viewport proof, CTA hierarchy, and platform-web-ui adapter choice.
- Check evidence: desktop/mobile screenshots or spec notes for loading media, form validation, disabled submit, success confirmation, State coverage, and Accessibility.
