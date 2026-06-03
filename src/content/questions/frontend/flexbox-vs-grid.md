---
question: "Flexbox vs Grid."
section: "frontend"
difficulty: "easy"
tags: ["css", "layout"]
order: 22
---

Both are CSS layout systems, but they solve different problems.

**Flexbox** is **one-dimensional** — it lays out items along a single axis (row or column). It excels at distributing space and aligning items within a line.

```css
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
```

**Grid** is **two-dimensional** — it controls both rows and columns simultaneously. It is ideal for page-level layouts and any design that needs alignment in both directions.

```css
.dashboard {
  display: grid;
  grid-template-columns: 250px 1fr;
  grid-template-rows: auto 1fr auto;
  gap: 1rem;
}
```

| | Flexbox | Grid |
|---|---|---|
| **Axes** | One (row or column) | Two (rows and columns) |
| **Best for** | Navbars, toolbars, card rows, centering | Page layouts, dashboards, galleries |
| **Content vs layout** | Content-driven (items size themselves) | Layout-driven (you define the grid, items fill it) |

> **In practice:** You often use both. Grid for the overall page structure and Flexbox for component-level alignment within each grid cell.
