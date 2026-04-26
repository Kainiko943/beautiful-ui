# Cinematic Prompt Evals

Use these prompts to test whether the skill materially improves Claude's UI output.

## Eval 1: Weak Prompt Baseline

```text
Make a cool website for my AI product.
```

Expected weak output:

- generic dark hero
- vague gradients
- feature cards
- no cinematic promise
- no screenshot verification

## Eval 2: Beautiful UI Cinematic Prompt

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification. Build a demo-worthy cinematic web experience for an AI product. It should feel like a premium dark creative studio site with WORK and CONTACT navigation, a central focal scene, particles, bloom, glass panels, scroll reveal, reduced-motion fallback, mobile fallback, Playwright screenshots, and a nonblank canvas/media check. Choose from video, image sequence, Lottie, Rive, Spline, canvas, Three.js, or custom shaders using the Cinematic Technology Ladder; do not use custom WebGL unless the interaction truly needs it.
```

Claude should produce or implement:

- a named cinematic promise
- first-viewport art direction
- sparse WORK and CONTACT nav
- justified Cinematic Technology Ladder choice
- video/Lottie/Rive/Spline/canvas/Three.js/media hero plan
- ambient motion and scroll reveal
- fallback states
- accessibility notes
- screenshot verification plan or evidence

## Pass criteria

- Claude should define visual direction before implementation.
- Claude should avoid generic card piles and gradient-only visuals.
- Claude should include a real cinematic focal subject.
- Claude should justify whether to fake WebGL with media/embeds or use live Three.js/shaders.
- Claude should cover reduced motion, mobile, and WebGL/canvas fallback.
- Claude should run or request Playwright screenshots when implementation is available.
- Claude should perform a nonblank canvas/media check.

## Eval 3: Reference Recreation

```text
Use beautiful-ui and cinematic-web-experience to recreate the style of a viral cinematic website demo. Do not copy protected branding or assets. Preserve the mood: dark luxury tech, sparse nav, glowing focal object, particles, bloom, glass panels, scroll-driven reveal, and demo-worthy first viewport. Start with the Cinematic Technology Ladder and prefer pre-rendered media, Spline, Lottie, Rive, or image sequences when they produce a more reliable premium result than custom shaders.
```

Pass criteria:

- Claude should extract traits instead of copying assets.
- Claude should create an implementation contract.
- Claude should define motion beats and fallback behavior.
- Claude should verify the first viewport screenshot before claiming completion.
