# Claude Cinematic Web Recipe

Use this recipe when you want Claude or another coding agent to recreate the style of a premium cinematic web demo: dark full-screen hero, sparse navigation, a focal scene built with the right media or 3D technology, particles, bloom, glass panels, and scroll-driven reveals.

## Copy-Paste Prompt

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification.

Goal: recreate the style of a premium cinematic AI-built website, not the exact branding or assets. Build a demo-worthy web experience that feels like a dark luxury tech / creative studio landing page.

Reference traits to preserve:
- Full-screen dark cinematic first viewport.
- Sparse top navigation with WORK and CONTACT.
- One central focal object or abstract artifact. Use WebGL/Three.js only if the effect needs runtime 3D interaction; otherwise prefer video, image sequences, Lottie, Rive, Spline, or pre-rendered media.
- Glow, bloom, particle depth, glass panels, and subtle smoke/light energy.
- Scroll-driven reveal into a second showcase section.
- Minimal copy, high contrast, premium spacing, and strong first impression.

Required implementation:
1. Inspect the repo and identify the web stack.
2. Define the cinematic promise in one sentence.
3. Define the first viewport: focal object, backdrop, lighting, nav, CTA, and next-section hint.
4. Pick a Cinematic Technology Ladder rung: static/generated media, looping video/image sequence, Lottie/Rive, Spline, CSS/SVG/light canvas, Three.js/R3F, or custom shaders/GPGPU. Explain why that rung is enough.
5. Use Three.js, React Three Fiber, or custom shaders only when runtime interaction, procedural motion, 3D camera control, particle behavior, or scene composition truly requires it. If visual impact is the main goal, fake the WebGL with pre-rendered or embedded media and make the fallback excellent.
6. Add ambient motion, pointer response when useful, and one scroll reveal. Respect prefers-reduced-motion.
7. Build responsive desktop and mobile layouts.
8. Add loading, media/WebGL unavailable, reduced-motion, and mobile fallback states.
9. Keep text readable and navigation usable over the scene.
10. Run the local dev server.
11. Use Playwright to capture desktop and mobile screenshots.
12. Verify the hero canvas/media/embed is nonblank, the scene is framed correctly, text does not overlap, and the first viewport feels demo-worthy.
13. Iterate until the screenshots look premium before calling the work complete.

Acceptance criteria:
- The first viewport is full-screen or near full-screen and immediately cinematic.
- Navigation includes WORK and CONTACT or equivalent minimal labels.
- The hero contains rendered media, video, image sequence, Lottie, Rive, Spline, canvas, or 3D; it is not only a gradient.
- The implementation stack choice is justified against the Cinematic Technology Ladder.
- There is visible particle/glow/depth treatment.
- There is at least one scroll reveal or staged transition.
- Reduced-motion mode keeps the content usable.
- Mobile layout preserves the mood without broken desktop scaling.
- Playwright screenshots are captured and reviewed.
- A nonblank canvas/media check passes.
```

## One-Line Version

```text
Use beautiful-ui, cinematic-web-experience, and the S-tier quality bar to build a premium cinematic page. Pick the simplest Cinematic Technology Ladder rung that delivers the effect, then verify it with Playwright screenshots and a nonblank canvas/media check before calling it complete.
```

## Build Checklist

- Cinematic promise written before implementation.
- Art direction covers mood, palette, lighting, focal object, and density.
- WORK and CONTACT navigation or equivalent minimal nav exists.
- Hero uses video, image sequence, Lottie, Rive, Spline, Three.js/WebGL/canvas/media, not a static gradient.
- Technology choice starts low on the Cinematic Technology Ladder and climbs only when needed.
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
