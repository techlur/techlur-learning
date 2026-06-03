# Contributing

Thanks for helping build the best free interview-prep resource for web dev freshers! 🎉

Adding a question is intentionally simple: **you write one Markdown file, open a pull request, and our CI checks the format automatically.** You do not need to know Astro, React, or any framework.

## How to add a question

### 1. Pick the right folder

Questions live in `src/content/questions/<section>/`. The sections are:

| Folder      | Covers                                          |
| ----------- | ----------------------------------------------- |
| `backend`   | HTTP, Node.js, NestJS, auth, APIs               |
| `frontend`  | JavaScript, the browser, React, CSS             |
| `database`  | MySQL, SQL, data modelling, indexing            |
| `ai`        | LLM concepts, RAG, calling AI APIs, prompting   |
| `general`   | Git, DSA, OOP, and HR / behavioural questions   |

### 2. Create one `.md` file per question

Name it with a short, hyphenated slug, e.g. `cors-explained.md`.

Copy this template and fill it in:

```markdown
---
question: "Your question, written exactly as an interviewer would ask it?"
section: "backend"          # must match the folder you put it in
difficulty: "easy"          # easy | medium | hard
tags: ["http", "rest"]      # optional list of topic tags
order: 99                   # optional — lower numbers appear first
author: "your-github-name"  # optional credit
---

Your answer goes here in plain Markdown.

You can use **bold**, lists, `inline code`, and fenced code blocks:

```js
console.log("code is supported");
```

> Blockquotes render as a highlighted callout — great for tips or follow-ups.
```

### 3. Open a pull request

Push your branch and open a PR. Our GitHub Action will run `astro build`,
which validates your frontmatter against the schema. **If a required field is
missing or a value is invalid (e.g. `difficulty: "tricky"`), the build fails
and the PR check turns red** — just fix it and push again.

A reviewer will also get an automatic **preview deploy** to see your question
rendered live before merging.

## Style guidelines

- **One question per file.** Keep them focused.
- **Answers should be concise** — what a fresher needs to say in an interview,
  not an exhaustive essay. Aim for a tight explanation plus a short example.
- **Be accurate.** If you're unsure, link a source in the PR description.
- **No copy-pasting** large blocks from other sites — write it in your own words.
- Use the existing files in each folder as a reference for tone and length.

## Running locally (optional)

You don't need to, but if you want to preview your changes:

```bash
npm install
npm run dev      # open the printed localhost URL
npm run build    # same check that CI runs
```

Requires Node.js 18 or later.

---

That's it. Thank you for contributing! 💛
