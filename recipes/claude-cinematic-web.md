# Claude Cinematic Web Recipe

Use this recipe when you want Claude or another coding agent to recreate the style of a premium cinematic web demo: dark full-screen hero, sparse navigation, WebGL/Three.js focal scene, particles, bloom, glass panels, and scroll-driven reveals.

## Copy-Paste Prompt

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification.

Goal: recreate the style of a premium cinematic AI-built website, not the exact branding or assets. Build a demo-worthy web experience that feels like a dark luxury tech / creative studio landing page.

Reference traits to preserve:
- Full-screen dark cinematic first viewport.
- Sparse top navigation with WORK and CONTACT.
- One central WebGL/Three.js-style focal object or abstract artifact.
- Glow, bloom, particle depth, glass panels, and subtle smoke/light energy.
- Scroll-driven reveal into a second showcase section.
- Minimal copy, high contrast, premium spacing, and strong first impression.

Required implementation:
1. Inspect the repo and identify the web stack.
2. Define the cinematic promise in one sentence.
3. Define the first viewport: focal object, backdrop, lighting, nav, CTA, and next-section hint.
4. Use Three.js, React Three Fiber, or the closest existing 3D/canvas stack for the hero scene. If no 3D stack is feasible, create a canvas particle scene plus a static fallback.
5. Add ambient motion, pointer response, and one scroll reveal. Respect prefers-reduced-motion.
6. Build responsive desktop and mobile layouts.
7. Add loading, WebGL unavailable, reduced-motion, and mobile fallback states.
8. Keep text readable and navigation usable over the scene.
9. Run the local dev server.
10. Use Playwright to capture desktop and mobile screenshots.
11. Verify the hero canvas/media is nonblank, the scene is framed correctly, text does not overlap, and the first viewport feels demo-worthy.
12. Iterate until the screenshots look premium before calling the work complete.

Acceptance criteria:
- The first viewport is full-screen or near full-screen and immediately cinematic.
- Navigation includes WORK and CONTACT or equivalent minimal labels.
- The hero contains rendered media, canvas, or 3D; it is not only a gradient.
- There is visible particle/glow/depth treatment.
- There is at least one scroll reveal or staged transition.
- Reduced-motion mode keeps the content usable.
- Mobile layout preserves the mood without broken desktop scaling.
- Playwright screenshots are captured and reviewed.
- A nonblank canvas/media check passes.
```

## Build Checklist

- Cinematic promise written before implementation.
- Art direction covers mood, palette, lighting, focal object, and density.
- WORK and CONTACT navigation or equivalent minimal nav exists.
- Hero uses Three.js/WebGL/canvas/media, not a static gradient.
- Particles, bloom, glow, glass, or smoke effects are purposeful.
- Scroll reveal section exists after the hero.
- Reduced motion fallback exists.
- WebGL or canvas fallback exists.
- Mobile framing is checked.
- Playwright desktop and mobile screenshots are captured.
- nonblank canvas/media check is run.

## What To Avoid

- Copying the reference site's logo, brand, or exact assets.
- Building a generic dark SaaS hero with cards.
- Using decorative gradient blobs as the main visual.
- Shipping without screenshot review.
- Ignoring slow-device, mobile, or reduced-motion behavior.

