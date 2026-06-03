---
question: "What are map, filter, and reduce?"
section: "frontend"
difficulty: "easy"
tags: ["javascript", "arrays"]
order: 7
---

These three array methods are the foundation of functional-style data transformation in JavaScript. None of them mutate the original array.

**`map`** — transforms every element and returns a new array of the same length.

```js
[1, 2, 3].map(n => n * 2); // [2, 4, 6]
```

**`filter`** — returns a new array containing only elements that pass the test.

```js
[1, 2, 3, 4].filter(n => n % 2 === 0); // [2, 4]
```

**`reduce`** — boils the array down to a **single value** by running an accumulator function on each element.

```js
[1, 2, 3, 4].reduce((sum, n) => sum + n, 0); // 10
```

**Chaining them together:**

```js
const orders = [
  { item: "Book", price: 12 },
  { item: "Pen", price: 2 },
  { item: "Bag", price: 35 },
];

const total = orders
  .filter(o => o.price > 5)     // keep expensive items
  .map(o => o.price)            // extract prices
  .reduce((sum, p) => sum + p, 0); // sum them
// total = 47
```
