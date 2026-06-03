---
question: "What is hoisting?"
section: "frontend"
difficulty: "easy"
tags: ["javascript"]
order: 3
---

Hoisting is JavaScript's behavior of moving **declarations** to the top of their scope during the compile phase, before any code executes.

- **`var`** declarations are hoisted and initialized as `undefined`, so you can reference them before the declaration line without an error.
- **`let` / `const`** declarations are hoisted but **not** initialized. Accessing them before their declaration throws a `ReferenceError` — the region before initialization is called the **temporal dead zone (TDZ)**.
- **Function declarations** are fully hoisted (both name and body), so they can be called before they appear in the code.
- **Function expressions** and **arrow functions** assigned to variables follow the rules of the variable keyword (`var`, `let`, or `const`).

```js
console.log(x); // undefined (var is hoisted)
var x = 5;

console.log(y); // ReferenceError (TDZ)
let y = 10;

greet();        // "Hello!" (function declaration is fully hoisted)
function greet() {
  console.log("Hello!");
}
```
