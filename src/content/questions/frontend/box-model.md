---
question: "Explain the box model and box-sizing."
section: "frontend"
difficulty: "easy"
tags: ["css"]
order: 23
---

Every HTML element is a rectangular **box** made up of four layers (from inside out):

1. **Content** — the actual text, image, or child elements.
2. **Padding** — transparent space between the content and the border.
3. **Border** — the visible edge around the padding.
4. **Margin** — transparent space outside the border, separating the element from its neighbors.

**`box-sizing` property:**

By default (`content-box`), `width` and `height` apply only to the content area. Padding and border are **added on top**, making the element larger than the declared size.

With `border-box`, `width` and `height` include content + padding + border. This makes sizing far more predictable.

```css
/* Apply border-box globally — recommended */
*, *::before, *::after {
  box-sizing: border-box;
}

.card {
  width: 300px;
  padding: 20px;
  border: 2px solid #ccc;
  /* With border-box: total width is still 300px */
  /* With content-box: total width would be 300 + 40 + 4 = 344px */
}
```

> **Best practice:** Set `box-sizing: border-box` on all elements at the start of your stylesheet. Nearly every modern CSS reset or framework does this.
