# Cinematic Web Experience Example

## Scenario

Premium AI-built showcase site like a short viral demo: dark cinematic hero, glowing 3D focal object, particles, glass panels, sparse navigation, and scroll-driven reveals.

## Before Prompt

```text
Make a cool website for my project.
```

Likely failure: dark gradient background, oversized hero text, generic cards, no real motion system, no 3D scene, weak mobile behavior, and no verification.

## Beautiful UI Prompt

```text
Use beautiful-ui and cinematic-web-experience to build a demo-worthy cinematic web experience for this project. Inspect the repo first. Define the cinematic promise, first-viewport art direction, scene structure, motion model, interaction model, asset plan, responsive fallback, reduced-motion behavior, and implementation stack. Use Three.js or an existing 3D stack if available. Verify with browser preview, Playwright desktop/mobile screenshots, nonblank canvas checks, and ui-verification before calling it complete.
```

## Expected Handoff

Visual direction: premium dark tech, high contrast, glowing focal object, subtle particle depth, glass-like panels, sparse navigation, and a first viewport designed to feel demo-worthy.

Design-system core: dark ink surfaces, controlled bloom accents, sharp typography, minimal nav, 8px spacing rhythm, glass borders, and motion tokens for ambient drift, pointer response, and scroll reveal.

Scene structure: full-screen hero with one focal WebGL/Three.js object, ambient particles, soft bloom, minimal `WORK` and `CONTACT` navigation, a clear CTA, and a next-section preview below the fold.

State coverage: loading scene, static fallback image, WebGL unavailable state, reduced-motion mode, mobile simplified scene, focused nav links, and failed asset recovery.

Accessibility: readable contrast over the scene, semantic headings, keyboard navigation, reduced motion, no essential information hidden inside animation, and text alternatives for visual media.

Platform adapter: `platform-web-ui` plus `cinematic-web-experience`.

Verification: run local preview, capture Playwright screenshots at desktop and mobile widths, assert the canvas/media region is nonblank, check no text overlap, and run `ui-verification`.

## Evidence To Capture

- Before evidence: weak-prompt output showing a dark gradient, generic hero text, no art direction, no motion model, or no fallback plan.
- After evidence: Beautiful UI handoff excerpt showing the cinematic Visual direction, focal scene structure, motion model, and platform-web-ui plus cinematic-web-experience adapter choice.
- Check evidence: desktop and mobile Playwright screenshots, nonblank canvas/media assertion, reduced-motion fallback, WebGL unavailable fallback, State coverage, and Accessibility.
