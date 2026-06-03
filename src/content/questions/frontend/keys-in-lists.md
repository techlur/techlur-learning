---
question: "What are keys in lists and why are they important?"
section: "frontend"
difficulty: "easy"
tags: ["react"]
order: 16
---

Keys give React a **stable identity** for each item in a list. During reconciliation (diffing), React uses keys to figure out which items were added, removed, or reordered — without keys, React falls back to comparing by index, which can cause bugs and wasted renders.

```jsx
// Good — unique, stable id
{users.map(user => (
  <UserCard key={user.id} name={user.name} />
))}

// Bad — array index as key
{users.map((user, index) => (
  <UserCard key={index} name={user.name} />
))}
```

**Why array index is problematic:**

- If items are reordered, inserted, or deleted, the index shifts and React may reuse the wrong component instance, leading to stale state or broken animations.

**Rules for good keys:**

- Use a **unique, stable identifier** from your data (database ID, slug, etc.).
- Keys must be unique **among siblings** (not globally).
- Never generate keys on the fly (e.g., `Math.random()`) — this defeats the purpose.

> **Tip:** If your data has no natural ID, consider adding one at the data layer rather than relying on index.
