---
question: "What is event bubbling and delegation?"
section: "frontend"
difficulty: "medium"
tags: ["browser", "events"]
order: 12
---

**Event bubbling** is the DOM's default propagation model: when an event fires on an element, it first runs handlers on that element, then **bubbles up** through every ancestor to the document root.

```
click on <button>
  → button handler
    → div handler
      → body handler
        → document handler
```

You can stop propagation with `event.stopPropagation()`, but this is rarely needed.

**Event delegation** leverages bubbling by attaching a **single listener on a parent** instead of one listener on every child. The parent checks `event.target` to determine which child was actually clicked.

```js
// Instead of adding a listener to every <li>...
document.querySelector("ul").addEventListener("click", (e) => {
  if (e.target.tagName === "LI") {
    console.log("Clicked:", e.target.textContent);
  }
});
```

**Why delegation is useful:**

- **Performance** — one listener instead of hundreds.
- **Dynamic elements** — new children added later are automatically handled.
- **Cleaner code** — less setup and teardown logic.
