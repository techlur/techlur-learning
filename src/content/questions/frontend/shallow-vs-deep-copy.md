---
question: "What is the difference between shallow and deep copy?"
section: "frontend"
difficulty: "medium"
tags: ["javascript", "objects"]
order: 6
---

A **shallow copy** duplicates only the top-level properties. Nested objects and arrays are still **shared** between the original and the copy, so mutating a nested value affects both.

A **deep copy** recursively duplicates **everything**, so no references are shared.

```js
const original = { name: "Alice", address: { city: "NYC" } };

// Shallow copy — nested object is shared
const shallow = { ...original };
shallow.address.city = "LA";
console.log(original.address.city); // "LA" — both changed!

// Deep copy — fully independent
const deep = structuredClone(original);
deep.address.city = "Chicago";
console.log(original.address.city); // "LA" — original untouched
```

**Common ways to copy:**

| Method | Depth |
|---|---|
| Spread (`{ ...obj }`) / `Object.assign` | Shallow |
| `Array.from()` / `[...arr]` | Shallow |
| `structuredClone(obj)` | Deep |
| `JSON.parse(JSON.stringify(obj))` | Deep (but drops functions, `undefined`, `Date` objects, etc.) |

> **Tip:** `structuredClone` (available in all modern runtimes) is the safest built-in deep copy method.
