---
name: cinematic-web-experience
description: Use when users want a premium, demo-worthy cinematic web experience, immersive landing page, portfolio, product showcase, or Claude-made wow-factor UI with motion, 3D, particles, WebGL, or scroll-driven storytelling.
---

# Cinematic Web Experience

## Overview

Use this skill when the user wants the kind of web experience that looks impressive in a short demo: full-screen composition, premium art direction, motion, depth, and a strong first-viewport reveal. This is for demo-worthy cinematic web experiences, not ordinary dashboards or static pages.

Start with `beautiful-ui` for product intent and visual direction, then use this skill to turn the direction into an implementable web experience. Pair with `platform-web-ui` for browser behavior and `ui-verification` before completion.

## When To Trigger

- "Build something like this cinematic website."
- "Make a site that looks like a premium studio/portfolio."
- "Create a WebGL/Three.js landing page."
- "Make Claude build a wow-factor demo."
- "Add particles, bloom, glass, smoke, scroll animation, or interactive 3D."
- "Make this look like a viral AI-built website demo."

## Required Workflow

1. Identify the cinematic promise in one sentence.
2. Define the first-viewport composition: subject, backdrop, focal point, lighting, navigation, and CTA.
3. Choose the motion model: ambient loop, pointer response, scroll reveal, scene transition, or staged sequence.
4. Select implementation primitives:
   - Use Three.js or React Three Fiber for primary 3D/WebGL scenes.
   - Use CSS and lightweight canvas only for simple particles or glow fields.
   - Use GSAP, Framer Motion, or existing project motion tools only when already available or clearly justified.
5. Design responsive fallbacks for mobile, reduced motion, slow devices, and non-WebGL browsers.
6. Implement a real first screen, not a marketing placeholder.
7. Verify with browser preview, Playwright screenshots, and a nonblank canvas/visual asset check.

## Handoff Must Include

- Cinematic promise
- First-viewport art direction
- Scene structure
- Motion model
- Interaction model
- Asset plan
- Performance budget
- Accessibility and reduced-motion behavior
- Implementation stack choice
- Verification steps

## Quality Bar

- The first viewport must create a clear "how did AI make this?" moment.
- The main visual must be actual rendered media, canvas, video, image, or 3D, not a gradient blob.
- Navigation must stay minimal and legible.
- Motion must support reveal, depth, or interaction.
- Mobile must keep the same mood without forcing a broken desktop scene.
- Reduced motion must preserve the content without the cinematic effects.

## Read Next

- `references/cinematic-web-guidelines.md`

