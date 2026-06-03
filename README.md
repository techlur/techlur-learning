# Fresher Interview Prep — Web Development

> An open-source, community-driven bank of web development interview questions
> with model answers — built for **Node.js / NestJS · React · MySQL** freshers.

Every question is a single Markdown file. Anyone can add one by opening a pull
request — no framework knowledge required. The site is built with
[Astro](https://astro.build) and ships as fast, static HTML.

## ✨ What's inside

- **5 sections** — Backend, Frontend, Database, AI & LLMs, General & HR
- **Model answers** with code examples and interviewer follow-ups
- **Difficulty badges** and topic tags on every question
- **Zero-JS by default** — fast pages, great Core Web Vitals
- **Schema-validated contributions** — bad frontmatter fails CI automatically

## 🚀 Quick start

```bash
git clone https://github.com/your-username/fresher-interview-prep.git
cd fresher-interview-prep
npm install
npm run dev        # http://localhost:4321
```

Requires **Node.js 18+**.

| Command           | Action                                       |
| ----------------- | -------------------------------------------- |
| `npm run dev`     | Start the local dev server                   |
| `npm run build`   | Build the static site to `./dist/`           |
| `npm run preview` | Preview the production build locally         |
| `npm run check`   | Type-check `.astro` files                    |

## 🤝 Contributing

This project lives and grows through contributions. Adding a question takes
about two minutes:

1. Drop a new `.md` file in `src/content/questions/<section>/`
2. Fill in the frontmatter template
3. Open a PR — CI validates the format for you

👉 Full guide: **[CONTRIBUTING.md](./CONTRIBUTING.md)**

## 🗂 Project structure

```
src/
├── content/
│   ├── config.ts              # Zod schema — validates every PR
│   └── questions/<section>/   # one Markdown file per question
├── components/QuestionCard.astro
├── layouts/Base.astro
└── pages/
    ├── index.astro            # section overview
    └── [section].astro        # one page per section
```

## 📦 Deploying

Builds to fully static files in `dist/`, so it hosts anywhere — Vercel,
Netlify, Cloudflare Pages, or GitHub Pages. Set `site` (and `base` for GitHub
Pages project sites) in `astro.config.mjs` before a production build.

## 📄 License

MIT — free to use, share, and adapt.
