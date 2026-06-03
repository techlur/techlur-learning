---
question: "What are the common HTTP methods and what is each used for?"
section: "backend"
difficulty: "easy"
tags: ["http", "rest"]
order: 1
---

HTTP methods (verbs) describe the action a client wants to perform on a resource.

- **GET** — retrieve data; should never modify state (safe & idempotent).
- **POST** — create a new resource; not idempotent (calling twice creates two records).
- **PUT** — replace a resource entirely; idempotent.
- **PATCH** — partially update a resource.
- **DELETE** — remove a resource; idempotent.
- **OPTIONS / HEAD** — metadata; OPTIONS is used in CORS preflight, HEAD returns headers only.

> **Follow-up:** "What does idempotent mean?" → Making the same request multiple times has the same effect as making it once.
