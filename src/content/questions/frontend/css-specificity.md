---
question: "How does CSS specificity work?"
section: "frontend"
difficulty: "medium"
tags: ["css"]
order: 24
---

When multiple CSS rules target the same element, the browser uses **specificity** to decide which rule wins. Specificity is calculated as a three-part score: **(A, B, C)**.

| Level | What counts | Example |
|---|---|---|
| **A — IDs** | `#header` | (1, 0, 0) |
| **B — Classes, attributes, pseudo-classes** | `.nav`, `[type="text"]`, `:hover` | (0, 1, 0) |
| **C — Elements, pseudo-elements** | `div`, `::before` | (0, 0, 1) |

**Comparing specificity:** A beats B beats C, regardless of count.

```css
/* (0, 1, 0) — one class */
.button { color: blue; }

/* (1, 0, 0) — one ID (wins) */
#submit { color: red; }

/* (0, 0, 2) — two elements (loses to one class) */
div button { color: green; }
```

**Tie-breaker:** When two selectors have equal specificity, the **later** rule in the stylesheet wins.

**Special cases:**

- **Inline styles** (`style="..."`) override any selector-based rule.
- **`!important`** overrides everything, including inline styles. Use it sparingly.
- The universal selector (`*`), combinators (`>`, `+`, `~`), and `:where()` add **zero** specificity.
- `:is()` and `:not()` take the specificity of their most specific argument.

> **Tip:** Keep specificity low and flat. Prefer classes over IDs, avoid `!important`, and use a consistent naming convention (like BEM) to prevent specificity wars.
