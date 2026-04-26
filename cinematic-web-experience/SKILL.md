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
   - Start with the Cinematic Technology Ladder and choose the simplest primitive that can deliver the intended impact.
   - Use video, image sequences, Lottie, Rive, Spline, or pre-rendered assets when the scene is mostly atmospheric, decorative, or fixed.
   - Use Three.js, React Three Fiber, or custom shaders only when runtime interaction, procedural motion, 3D camera control, particle behavior, or scene composition truly requires it.
   - Use CSS and lightweight canvas only for simple particles or glow fields.
   - Use GSAP, Framer Motion, or existing project motion tools only when already available or clearly justified.
5. Design responsive fallbacks for mobile, reduced motion, slow devices, and non-WebGL browsers.
6. Implement a real first screen, not a marketing placeholder.
7. Verify with browser preview, Playwright screenshots, and a nonblank canvas/visual asset check.

## Cinematic Technology Ladder

Prefer the simplest visual technology that achieves the intended effect. Climb the ladder only when the product experience needs the extra runtime capability.

1. Static generated image or art-directed hero media.
2. Short looping video or image sequence.
3. Lottie or Rive for vector motion and controlled UI animation.
4. Spline embed or exported 3D scene for a polished focal object without custom rendering code.
5. CSS, SVG, and lightweight canvas for glow fields, simple particles, masks, or parallax.
6. Three.js or React Three Fiber for interactive 3D scenes, camera moves, and runtime composition.
7. Custom shaders, GPGPU particles, fluid simulations, or postprocessing pipelines only when the brief requires procedural behavior or deep interaction.

Document the chosen rung, why lower rungs were insufficient, and the fallback for mobile, reduced motion, and failed asset loading.

## Recreate A Reference Experience

When the user provides a video, screenshot, website, or phrase like "make it like this," translate the reference into reproducible traits instead of copying blindly.

1. Extract the visual traits:
   - mood and genre
   - first-viewport composition
   - focal object
   - lighting and color
   - navigation style
   - motion beats
   - interaction model
   - section structure
2. Turn the traits into a build contract:
   - full-screen cinematic hero
   - sparse nav with labels like `WORK` and `CONTACT` when appropriate
   - one central focal scene built with the appropriate ladder rung, not automatically custom shaders
   - particles, bloom, glow, glass, or smoke only where they support the subject
   - scroll-driven reveal section after the hero
   - responsive and reduced-motion fallbacks
3. Implement the closest feasible version using the current repo stack.
4. Verify visually. If the first screenshot does not feel demo-worthy, iterate on composition, lighting, density, and motion before calling it complete.

## Handoff Must Include

- Cinematic promise
- First-viewport art direction
- Scene structure
- Motion model
- Interaction model
- Cinematic Technology Ladder choice
- Asset plan
- Performance budget
- Accessibility and reduced-motion behavior
- Implementation stack choice
- Verification steps

## Quality Bar

- The first viewport must create a clear "how did AI make this?" moment.
- The main visual must be actual rendered media, canvas, video, image, or 3D, not a gradient blob.
- A cinematic effect can be pre-rendered or embedded when that improves reliability, polish, or mobile performance.
- Navigation must stay minimal and legible.
- A reference-inspired build must preserve the reference's mood, composition, motion energy, and premium feel without copying protected branding or assets.
- Motion must support reveal, depth, or interaction.
- Mobile must keep the same mood without forcing a broken desktop scene.
- Reduced motion must preserve the content without the cinematic effects.

## Read Next

- `references/cinematic-web-guidelines.md`
