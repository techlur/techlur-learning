# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Fresher Interview Prep is a community-driven, open-source interview preparation platform built with **Astro 5**. It serves interview questions organized by topic (backend, frontend, database, ai, general) with model answers, all stored as Markdown files in a content collection.

## Commands

```bash
npm run dev       # Start dev server on port 4321
npm run build     # Production build to dist/ (also validates content schema)
npm run preview   # Preview production build locally
npm run check     # Type-check .astro files with @astrojs/check
```

## Architecture

**Static site with content collections.** No database, no runtime JS by default. Pages are pre-built at deploy time.

- **Content collection** (`src/content/questions/`): Markdown files grouped by section subdirectory (backend, frontend, database, ai, general). Each file has Zod-validated frontmatter defined in `src/content/config.ts`.
- **Pages** (`src/pages/`): `index.astro` (home with section grid) and `[section].astro` (dynamic route rendering all questions for a section, sorted by `order`).
- **Layout** (`src/layouts/Base.astro`): Single root layout with sticky header, footer, global styles, and Google Fonts (Fraunces, Spline Sans, JetBrains Mono).
- **Components** (`src/components/QuestionCard.astro`): Uses native HTML `<details>` for expand/collapse — zero client JS.
- **React integration** is configured (`@astrojs/react`) but minimally used; the site is primarily Astro components.

## Content Schema

Every question markdown file requires this frontmatter (validated by Zod on build):

```yaml
question: string (min 8 chars)
section: backend | frontend | database | ai | general
difficulty: easy | medium | hard
tags: string[]       # optional
order: number        # optional, lower = earlier in list
author: string       # optional
```

Bad frontmatter fails the build, which acts as CI validation.

## Adding Questions

1. Create a new `.md` file in `src/content/questions/<section>/` with a hyphenated slug name (e.g., `cors-explained.md`).
2. Add valid frontmatter (see schema above).
3. Write the answer body in Markdown. Supports bold, lists, inline code, fenced code blocks, and blockquotes (rendered as highlighted callouts).

## Design Tokens

CSS custom properties defined in `Base.astro`:
- `--ink` (dark text), `--paper`/`--paper2` (backgrounds), `--rust`/`--rust-dk` (primary accent), `--teal` (secondary), `--gold` (tertiary), `--line` (borders)
- Typography: Fraunces for headings, Spline Sans for body, JetBrains Mono for code
- Fluid typography via `clamp()`, max content width 900px

## Deployment

Static output to `dist/`. Update `site` (and optionally `base` for subpath hosting) in `astro.config.mjs` before deploying to Vercel, Netlify, Cloudflare Pages, or GitHub Pages.
