---
question: "What is the rules-of-hooks constraint?"
section: "frontend"
difficulty: "medium"
tags: ["react", "hooks"]
order: 18
---

React hooks rely on a **stable call order** between renders. To guarantee this, React enforces two rules:

**1. Only call hooks at the top level**

Never call hooks inside loops, conditions, or nested functions. Every render must invoke the same hooks in the same order.

```jsx
// Bad — conditional hook
if (loggedIn) {
  useEffect(() => { /* ... */ }); // breaks call order
}

// Good — condition inside the hook
useEffect(() => {
  if (loggedIn) { /* ... */ }
}, [loggedIn]);
```

**2. Only call hooks from React functions**

Hooks can only be called from:
- **Function components**
- **Custom hooks** (functions whose name starts with `use`)

They cannot be called from regular JavaScript functions, class components, or event handlers.

**Why these rules exist:**

React tracks hooks by their **call index** (first hook = index 0, second = index 1, etc.). If a hook is conditionally skipped, every subsequent hook shifts position and maps to the wrong state — causing subtle and hard-to-debug errors.

> **Tip:** The `eslint-plugin-react-hooks` package (included in Create React App and Next.js) catches violations automatically.
