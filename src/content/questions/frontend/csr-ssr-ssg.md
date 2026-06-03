---
question: "CSR vs SSR vs SSG (and where does Next.js fit)?"
section: "frontend"
difficulty: "hard"
tags: ["react", "nextjs", "rendering"]
order: 21
---

These are three strategies for turning your components into HTML that the browser can display.

**CSR (Client-Side Rendering)**

The server sends a nearly empty HTML shell and a JavaScript bundle. The browser downloads, parses, and executes the JS to render the page. Good for highly interactive apps (dashboards), but the initial load can be slow and SEO is limited.

**SSR (Server-Side Rendering)**

The server renders the full HTML **on every request** and sends it to the browser. The page is visible immediately, then JS "hydrates" it to make it interactive. Great for SEO and dynamic, personalized pages, but every request hits the server.

**SSG (Static Site Generation)**

HTML is generated **at build time** and served from a CDN. Fastest possible load since there is no per-request work. Ideal for content that does not change often (blogs, docs, marketing pages).

| | CSR | SSR | SSG |
|---|---|---|---|
| **Rendered** | In the browser | On the server per request | At build time |
| **Time to first content** | Slow (JS must load) | Fast | Fastest |
| **SEO** | Poor (without extra work) | Good | Good |
| **Dynamic data** | Yes | Yes | Limited (rebuild needed) |

**Where Next.js fits:**

Next.js lets you choose the rendering strategy **per route**. A single app can mix SSG pages, SSR pages, and fully client-rendered components. It also supports **ISR (Incremental Static Regeneration)** — static pages that revalidate in the background after a set interval, combining the speed of SSG with fresher data.
