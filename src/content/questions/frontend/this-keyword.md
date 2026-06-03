---
question: "What does the this keyword refer to?"
section: "frontend"
difficulty: "medium"
tags: ["javascript"]
order: 4
---

The value of `this` depends on **how** a function is called, not where it is defined.

| Call style | `this` value |
|---|---|
| **Method call** (`obj.fn()`) | The calling object (`obj`) |
| **Plain call** (`fn()`) | `undefined` in strict mode, `globalThis` in sloppy mode |
| **`new` call** (`new Fn()`) | The newly created instance |
| **`call` / `apply` / `bind`** | Whatever you explicitly pass |
| **Arrow function** | Inherited from the enclosing lexical scope (not its own `this`) |

```js
const user = {
  name: "Alice",
  greet() {
    console.log(this.name); // "Alice" — method call
  },
  greetLater() {
    setTimeout(() => {
      console.log(this.name); // "Alice" — arrow inherits this
    }, 100);
  },
};

function standalone() {
  console.log(this); // undefined (strict) or globalThis (sloppy)
}
```

> **Tip:** Arrow functions are ideal for callbacks inside methods because they preserve the outer `this`.
