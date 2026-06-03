---
question: "Explain == vs ===."
section: "frontend"
difficulty: "easy"
tags: ["javascript"]
order: 5
---

**`==`** (loose equality) compares two values **after type coercion**. JavaScript converts one or both operands to a common type before comparing, which can produce surprising results.

**`===`** (strict equality) compares both **value and type** with no coercion. If the types differ, the result is immediately `false`.

```js
0 == "";       // true  — both coerced to 0
0 === "";      // false — number vs string

null == undefined;  // true  — special coercion rule
null === undefined; // false — different types

"1" == 1;      // true  — string coerced to number
"1" === 1;     // false — string vs number
```

> **Best practice:** Always use `===` (and `!==`) to avoid accidental coercion bugs. The only common exception is `value == null`, which conveniently checks for both `null` and `undefined`.
