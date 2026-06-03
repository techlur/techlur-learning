---
question: "Explain var vs let vs const."
section: "frontend"
difficulty: "easy"
tags: ["javascript", "variables"]
order: 1
---

**`var`** is function-scoped and hoisted to the top of its function (initialized as `undefined`). It can be re-declared and reassigned.

**`let`** is block-scoped (`{}`). It is hoisted but **not** initialized, so accessing it before declaration throws a `ReferenceError` (the temporal dead zone). It can be reassigned but not re-declared in the same scope.

**`const`** is also block-scoped and must be initialized at declaration. It **cannot be reassigned**, but if the value is an object or array, the contents can still be mutated.

```js
var a = 1;
var a = 2;   // OK — re-declaration allowed

let b = 1;
b = 2;       // OK — reassignment allowed
// let b = 3; // SyntaxError — no re-declaration

const c = { x: 1 };
c.x = 2;    // OK — mutation allowed
// c = {};   // TypeError — reassignment blocked
```

> **Rule of thumb:** default to `const`, use `let` when you need reassignment, avoid `var`.
