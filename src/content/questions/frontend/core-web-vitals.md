---
question: "What are Core Web Vitals?"
section: "frontend"
difficulty: "medium"
tags: ["performance", "browser"]
order: 14
---

Core Web Vitals are a set of real-world performance metrics defined by Google that measure **user experience** on the web. They factor into search ranking.

| Metric | Measures | Good threshold |
|---|---|---|
| **LCP** (Largest Contentful Paint) | Loading — how quickly the main content appears | < 2.5 s |
| **INP** (Interaction to Next Paint) | Responsiveness — delay between user input and visual update | < 200 ms |
| **CLS** (Cumulative Layout Shift) | Visual stability — how much the page layout shifts unexpectedly | < 0.1 |

**How to improve each:**

- **LCP** — optimize images (modern formats, `loading="lazy"`), preload critical resources, use a CDN, reduce server response time.
- **INP** — break up long tasks, use `requestIdleCallback`, minimize main-thread work, defer non-essential JavaScript.
- **CLS** — set explicit `width`/`height` on images and embeds, avoid injecting content above existing content, use `font-display: swap`.

> **Tools to measure:** Chrome DevTools (Lighthouse), PageSpeed Insights, `web-vitals` npm package, and Chrome UX Report (CrUX) for field data.
