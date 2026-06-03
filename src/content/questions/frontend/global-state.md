---
question: "How do you manage global state in React?"
section: "frontend"
difficulty: "medium"
tags: ["react", "state-management"]
order: 19
---

There is no single "right" answer — the best approach depends on the **type and frequency** of the shared data.

**Context API** (built-in)

Good for low-frequency, rarely-changing values like theme, locale, or auth status. Every consumer re-renders when the context value changes, so it is not ideal for rapidly updating state.

```jsx
const ThemeCtx = createContext("light");

function App() {
  return (
    <ThemeCtx.Provider value="dark">
      <Page />
    </ThemeCtx.Provider>
  );
}
```

**Zustand / Redux / Jotai** (external libraries)

Better for larger, frequently-changing state. These libraries provide **selectors** so components only re-render when the specific slice of state they use changes.

```js
// Zustand example
const useStore = create((set) => ({
  count: 0,
  increment: () => set((s) => ({ count: s.count + 1 })),
}));
```

**React Query / TanStack Query** (server state)

Best for data fetched from APIs. Handles caching, background refetching, stale-while-revalidate, and error/loading states out of the box — keeping server state out of your global store.

> **Guideline:** Start with local state (`useState`) and lift only when needed. Reach for Context for simple global values, a dedicated store for complex client state, and a data-fetching library for server state.
