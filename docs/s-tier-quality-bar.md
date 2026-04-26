# S-tier Quality Bar

Use this bar to decide whether an AI-built interface is worth showing publicly.

## S-tier Means

- The first viewport has a clear point of view.
- The visual direction fits the product, not a template.
- The main visual is real: rendered media, canvas, 3D, image, or purposeful product UI.
- Typography, spacing, and contrast create hierarchy without explanation.
- Motion supports reveal, depth, continuity, or interaction.
- States and accessibility are part of the design, not afterthoughts.
- The result is verified with screenshots or equivalent visual checks.

## Cinematic Web S-tier

For cinematic pages, the result must include:

- full-screen or near full-screen hero
- sparse navigation
- one memorable focal object or scene
- controlled dark palette with glow, bloom, depth, or particles
- justified technology choice: media, video, Lottie, Rive, Spline, canvas, WebGL, or shaders
- scroll reveal or staged transition
- mobile-specific composition
- reduced-motion fallback
- WebGL/canvas/media fallback
- Playwright desktop and mobile screenshots
- nonblank canvas or media check

## Automatic Failures

- Generic card piles.
- Random gradient backgrounds.
- Hero text with no real visual subject.
- Unreadable text over effects.
- Motion that fights the content.
- Desktop-only composition.
- No fallback for slow devices or reduced motion.
- Claims of completion without verification.

## Final Review Prompt

```text
Use ui-verification and the S-tier quality bar. Review the UI for visual direction, hierarchy, motion, state coverage, accessibility, platform fit, mobile behavior, reduced motion, and screenshot evidence. List any failure before claiming completion.
```
