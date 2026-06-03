---
question: "Explain useState and useEffect."
section: "frontend"
difficulty: "medium"
tags: ["react", "hooks"]
order: 9
---

**useState** adds local state and returns the value plus a setter. **useEffect** runs side effects (data fetching, subscriptions) after render; its dependency array controls when it re-runs, and the returned function cleans up.

```jsx
useEffect(() => {
  const id = setInterval(tick, 1000);
  return () => clearInterval(id); // cleanup
}, []); // [] = run once on mount
```
