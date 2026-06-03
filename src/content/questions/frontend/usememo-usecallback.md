---
question: "useMemo vs useCallback — when do you use them?"
section: "frontend"
difficulty: "hard"
tags: ["react", "hooks", "performance"]
order: 17
---

Both hooks **memoize** values between renders to avoid unnecessary work, but they serve different purposes.

**`useMemo`** — memoizes a **computed value**. The factory function only re-runs when its dependencies change.

```jsx
const sorted = useMemo(
  () => items.sort((a, b) => a.price - b.price),
  [items]
);
```

**`useCallback`** — memoizes a **function reference**. Useful when passing callbacks to child components wrapped in `React.memo`.

```jsx
const handleClick = useCallback(() => {
  setCount(c => c + 1);
}, []); // stable reference across renders
```

`useCallback(fn, deps)` is essentially shorthand for `useMemo(() => fn, deps)`.

**When to use them:**

- An expensive calculation runs on every render (use `useMemo`).
- A child component wrapped in `React.memo` receives a callback prop and re-renders unnecessarily (use `useCallback`).
- A value is used as a dependency in another hook and needs referential stability.

**When NOT to use them:**

- The computation is cheap — memoization itself has overhead (memory + comparison).
- The component rarely re-renders anyway.
- You're optimizing prematurely without measuring.

> **Rule of thumb:** Write code without memoization first. Add `useMemo` / `useCallback` only when profiling reveals a real performance issue.
