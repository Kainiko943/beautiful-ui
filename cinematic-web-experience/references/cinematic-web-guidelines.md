# Cinematic Web Guidelines

## Visual Direction

- Start with a specific mood: luxury tech, sci-fi studio, dark editorial, product lab, creative portfolio, game reveal, or industrial showcase.
- Pick one focal subject: logo mark, product object, vehicle, device, abstract artifact, character-free scene, or data sculpture.
- Use darkness, glow, glass, bloom, particles, and depth only when they serve the focal subject.

## Composition

- Make the hero full-bleed or effectively full-screen.
- Keep the navigation sparse: brand, two to four links, and one action.
- Put copy over the scene only where contrast is controlled.
- Reveal a hint of the next section below the fold when building a landing page.

## Motion

- Use ambient motion for life: particles, light sweeps, slow camera drift, subtle shader movement.
- Use interaction for agency: pointer parallax, hover response, scrubbed rotation, or magnetic controls.
- Use scroll for story: scene transition, card reveal, camera move, or staged content.
- Avoid constant fast motion, noisy effects, and motion that hides content.

## Implementation

- Choose the simplest technology that creates the intended cinematic effect.
- Use static hero media, looping video, image sequences, Lottie, Rive, Spline, CSS, SVG, or lightweight canvas before reaching for custom WebGL.
- Use Three.js or React Three Fiber for real 3D scenes that need runtime camera control, pointer interaction, procedural motion, or composed 3D objects.
- Use custom shaders, GPGPU particles, or fluid simulations only when the brief requires procedural behavior that cannot be delivered convincingly with pre-rendered media or simpler animation tools.
- Use postprocessing bloom only when it improves the focal subject.
- Use CSS variables for color, spacing, and glow intensity.
- Keep scene logic isolated from content components.
- Lazy-load heavy 3D, video, Spline, Lottie, Rive, or image-sequence assets and provide a static fallback.
- Keep asset licensing and attribution clear when using generated, purchased, or third-party media.

## Performance

- Target a fast first paint with a graceful loading state.
- Keep geometry, particles, and postprocessing modest by default.
- Prefer pre-rendered media on mobile when live WebGL would hurt frame rate, battery, or loading.
- Pause or simplify animation when the tab is hidden.
- Respect `prefers-reduced-motion`.

## Verification

- Run the local dev server.
- Capture desktop and mobile screenshots with Playwright.
- Check that the canvas or media area is nonblank.
- Check that video, Lottie, Rive, Spline, image sequence, canvas, or WebGL fallbacks load when the primary effect fails.
- Check that text does not overlap the scene or navigation.
- Check reduced-motion behavior.
- Check that the page still communicates the offer if WebGL fails.
