# Beautiful UI Proof Layer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add proof artifacts, rubric scoring, framework guidance, a stronger gallery, and a Codex installer so the package is easier to trust and install.

**Architecture:** Keep the repo Markdown and PowerShell based. Add static docs and JSON manifests, then extend existing validation scripts so the proof layer is part of the launch gate.

**Tech Stack:** Markdown, JSON, PowerShell, static HTML, Playwright through `npx --yes playwright`.

---

### Task 1: Proof Artifacts Validation

**Files:**
- Create: `scripts/validate-eval-artifacts.ps1`
- Create: `evals/before-after/README.md`
- Create: `evals/before-after/manifest.json`
- Create: `evals/before-after/cases/*.json`
- Create: `evals/rubrics/ui-quality-rubric.json`

- [x] Write validation for manifest, six case files, seeded run links, and rubric dimensions.
- [x] Run validation before artifacts exist and confirm it fails.
- [x] Add minimal artifacts that satisfy the contract.

### Task 2: Quality Rubric

**Files:**
- Create: `docs/rubrics/ui-quality-rubric.md`
- Create: `scripts/score-ui-rubric.ps1`
- Modify: `docs/s-tier-quality-bar.md`
- Modify: `ui-verification/SKILL.md`
- Modify: `ui-verification/references/verification-checklist.md`

- [x] Document 0-4 scoring, pass thresholds, and critical failures.
- [x] Add a simple score script for JSON score files.
- [x] Link rubric guidance from verification docs.

### Task 3: Framework Guide

**Files:**
- Create: `framework-shadcn-tailwind-ui/SKILL.md`
- Create: `framework-shadcn-tailwind-ui/references/component-patterns.md`
- Create: `docs/framework-guides/shadcn-tailwind.md`
- Modify: `beautiful-ui/SKILL.md`
- Modify: `platform-web-ui/SKILL.md`
- Modify: `README.md`
- Modify: `docs/install.md`
- Modify: `docs/claude-quickstart.md`
- Modify: `ROADMAP.md`

- [x] Add shadcn + Tailwind adapter guidance using current official installation direction.
- [x] Wire the adapter into install and selection docs.

### Task 4: Gallery Proof Upgrade

**Files:**
- Create: `docs/gallery-cases.json`
- Modify: `docs/rendered-gallery.html`
- Modify: `docs/gallery.md`
- Modify: `scripts/verify-rendered-gallery.ps1`

- [x] Add case metadata, rubric scores, and eval links.
- [x] Keep static HTML browser-verifiable without introducing a Node build.

### Task 5: Codex Installer

**Files:**
- Create: `scripts/install-codex-skills.ps1`
- Modify: `scripts/install-claude-skills.ps1`
- Modify: `scripts/validate-package.ps1`
- Modify: `README.md`
- Modify: `docs/install.md`

- [x] Install all skill folders to `$env:CODEX_HOME\skills` or `%USERPROFILE%\.codex\skills`.
- [x] Add the framework skill to both Codex and Claude installers.
- [x] Validate installer presence and success text.

### Task 6: Verification

**Files:**
- Modify: validation scripts as needed.

- [x] Run `scripts/validate-eval-artifacts.ps1`.
- [x] Run `scripts/validate-package.ps1`.
- [x] Run `scripts/verify-rendered-gallery.ps1`.
- [x] Smoke-test Codex and Claude installers against temp directories.
