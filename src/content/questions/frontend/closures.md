---
question: "What is a closure?"
section: "frontend"
difficulty: "medium"
tags: ["javascript", "fundamentals"]
order: 1
---

A closure is a function that **remembers the variables from the scope where it was created**, even after that outer function has returned. It's the basis for data privacy and hooks like `useState`.

```js
function counter() {
  let n = 0;
  return () => ++n; // closes over n
}
const next = counter();
next(); // 1
next(); // 2
```
