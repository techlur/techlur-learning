---
question: "What causes unnecessary re-renders and how do you prevent them?"
section: "frontend"
difficulty: "hard"
tags: ["react", "performance"]
order: 20
---

A React component re-renders when:

1. Its **state** changes.
2. Its **props** change (by reference).
3. Its **parent re-renders** (even if the child's props are the same).
4. A **context** it consumes changes.

Most re-renders are fast and harmless, but they become a problem in large lists or computation-heavy components.

**Prevention strategies:**

**`React.memo`** — wraps a component so it only re-renders when its props change (shallow comparison).

```jsx
const ExpensiveList = React.memo(({ items }) => {
  return items.map(item => <Row key={item.id} {...item} />);
});
```

**`useCallback` / `useMemo`** — stabilize callback and object references passed as props so `React.memo` comparisons succeed.

```jsx
const handleClick = useCallback(() => { /* ... */ }, []);
const config = useMemo(() => ({ theme: "dark" }), []);
```

**Component splitting** — move state as close to where it's used as possible. Only the component holding the state re-renders.

```jsx
// Before: entire page re-renders on every keystroke
// After: only SearchInput re-renders
function SearchInput() {
  const [query, setQuery] = useState("");
  return <input value={query} onChange={e => setQuery(e.target.value)} />;
}
```

**Store selectors** — with Zustand or Redux, subscribe to specific slices so unrelated state changes don't trigger a re-render.

> **Key principle:** Profile first (React DevTools Profiler), optimize second. Premature memoization adds complexity without measurable benefit.
