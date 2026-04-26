# UI Quality Rubric

Use this rubric to score weak-prompt output against Beautiful UI output. Score each dimension from 0 to 4.

## Scale

| Score | Meaning |
| --- | --- |
| 0 | Missing or actively harmful. |
| 1 | Generic, vague, or incomplete. |
| 2 | Usable but underspecified. |
| 3 | Strong and implementation-ready. |
| 4 | Excellent, specific, and verified. |

## Dimensions

| Dimension | What To Look For |
| --- | --- |
| Visual direction | Product-specific art direction, mood, constraints, and visual intent. |
| Hierarchy | Clear primary workflow, readable typography, useful spacing, and scannable priority. |
| Real visual subject | Product UI, rendered media, canvas, 3D, image, or purposeful operational surface. |
| State coverage | Loading, empty, error, success, disabled, focus, selected, validation, and destructive states where relevant. |
| Accessibility | Contrast, labels, semantics, focus, keyboard/touch behavior, text scaling, and reduced motion. |
| Platform fit | Native-feeling behavior for web, iOS, Android, cinematic web, or framework-specific targets. |
| Responsive behavior | Desktop and mobile layouts with stable dimensions and no horizontal overflow. |
| Motion and fallbacks | Motion that supports meaning, plus reduced-motion and media fallback behavior. |
| Verification evidence | Screenshots, nonblank media checks, overflow checks, scorecards, or explicit verification notes. |

## Pass Threshold

A public example should average at least 3.0, with no dimension below 2. Accessibility, state coverage, and verification evidence must score 3 or higher for launch-quality examples.

## Critical failures

- The first viewport has no product-specific visual direction.
- The main visual is only a gradient, abstract decoration, or generic card pile.
- Important states are missing.
- Accessibility and focus behavior are missing.
- Mobile or responsive behavior is ignored.
- The output claims completion without screenshots, scorecards, or concrete verification.

## Scorecard Template

```json
{
  "caseId": "landing-page",
  "artifactType": "seeded-example",
  "scores": {
    "visual-direction": 4,
    "hierarchy": 4,
    "real-visual-subject": 3,
    "state-coverage": 4,
    "accessibility": 3,
    "platform-fit": 4,
    "responsive-behavior": 3,
    "motion-fallbacks": 3,
    "verification-evidence": 3
  },
  "criticalFailures": [],
  "notes": "Product-led hero, state coverage, and rendered gallery evidence are present."
}
```
