# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Techlur Learning is a community-driven, open-source interview preparation platform built with **Astro 5**, branded to match the Techlur corporate website (techlursoftware.com). It serves interview questions organized by topic (backend, frontend, database, ai, general) with model answers, all stored as Markdown files in a content collection.

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
- **Layout** (`src/layouts/Base.astro`): Single root layout with glass-morphism sticky header (matching techlursoftware.com), dark 4-column footer with social icons, global styles, and Google Fonts (Inter, JetBrains Mono). Mobile hamburger drawer for nav.
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

CSS custom properties in `Base.astro` match the Techlur corporate website (`techlursoftware.com`):
- `--color-primary: #12aa5b`, `--color-accent-dark: #0e8a49`, `--color-accent-light: #d1fae5`, `--color-primary-50: #f0fdf4`
- `--color-gray: #1f2937` (headings), `--color-gray-500: #494b51` (body text), `--color-gray-400: #9ca3af` (muted text)
- `--color-muted: #f1f5f9` (light bg), `--color-border: #e5e7eb`, `--color-dark-bg: #0d1117` (code blocks)
- `--shadow-green`, `--shadow-gray`, `--gradient-accent` (button/CTA gradient)
- Typography: Inter (Google Fonts, 400-700) for all text, JetBrains Mono for code
- Logo SVGs in `public/images/`: `techlur-logo.svg` (header), `techlur-logo-g.svg` (footer)
- Max content width 1200px, glass-morphism sticky header, dark (#111827) 4-column footer

## Deployment

Static output to `dist/`. Update `site` (and optionally `base` for subpath hosting) in `astro.config.mjs` before deploying to Vercel, Netlify, Cloudflare Pages, or GitHub Pages.
