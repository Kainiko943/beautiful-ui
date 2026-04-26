# Claude Quickstart

This is the fastest path for Claude Code users who want better UI output immediately.

## Install The Skill Folders

Copy these folders into your Claude skills directory or include them as project-level instructions:

- `beautiful-ui`
- `platform-web-ui`
- `framework-shadcn-tailwind-ui` for shadcn/ui and Tailwind web apps
- `cinematic-web-experience`
- `ui-verification`

For mobile work, also include:

- `platform-ios-ui`
- `platform-android-ui`

## Use This First Prompt

```text
Use beautiful-ui before implementation. Inspect the repo, choose a visual direction, define the design-system core, select the platform adapter, design key screens and states, and run ui-verification before calling the UI complete.
```

For shadcn/ui and Tailwind projects:

```text
Use beautiful-ui, platform-web-ui, framework-shadcn-tailwind-ui, and ui-verification. Inspect local components, tokens, variants, and CSS variables before designing or implementing the UI.
```

## Use This For Cinematic Websites

```text
Use beautiful-ui, platform-web-ui, cinematic-web-experience, and ui-verification. Build a demo-worthy cinematic web experience with a full-screen first viewport, sparse WORK / CONTACT navigation, one cinematic focal scene, particles, bloom, glass panels, scroll reveal, reduced-motion fallback, mobile fallback, Playwright screenshots, and a nonblank canvas/media check. Choose the simplest Cinematic Technology Ladder rung that can deliver the effect: video, image sequence, Lottie, Rive, Spline, canvas, Three.js, or shaders.
```

## What Claude Should Do Differently

- Ask fewer aesthetic follow-up questions because the workflow defines the quality bar.
- Produce visual direction before code.
- Use existing repo components and tokens when present.
- Cover empty, loading, error, success, disabled, focus, selected, reduced-motion, and fallback states.
- Verify output with screenshots or concrete checks instead of saying it looks good.

## Good Result Shape

Claude should return or build:

- visual direction
- design-system core
- screen plan
- state coverage
- platform handoff
- implementation notes
- verification evidence

## Bad Result Shape

Reject output that is only:

- a generic hero section
- a card pile
- a dark gradient background
- no mobile plan
- no reduced-motion behavior
- no screenshot verification
- no state coverage
