---
question: "Props vs state."
section: "frontend"
difficulty: "easy"
tags: ["react"]
order: 15
---

**Props** (short for properties) are values **passed from a parent** component to a child. They are **read-only** — a child should never modify its own props.

**State** is data **managed internally** by a component. It can be updated with a setter (e.g., `setState` or the `useState` hook), and changes trigger a re-render.

| | Props | State |
|---|---|---|
| **Owner** | Parent component | The component itself |
| **Mutable?** | No (read-only for the child) | Yes (via setter function) |
| **Triggers re-render?** | Yes, when the parent passes new values | Yes, when updated |
| **Purpose** | Configure a child from the outside | Track internal, changing data |

```jsx
function Greeting({ name }) {       // name is a prop
  const [count, setCount] = useState(0); // count is state

  return (
    <div>
      <p>Hello, {name}!</p>
      <button onClick={() => setCount(count + 1)}>
        Clicked {count} times
      </button>
    </div>
  );
}
```

> **Key idea:** Data flows **down** through props. When a child needs to communicate up, the parent passes a callback function as a prop.
