---
question: "What is the difference between process.nextTick, microtasks, and setTimeout?"
section: "backend"
difficulty: "hard"
tags: ["nodejs", "event-loop"]
order: 13
---

These three schedule callbacks at different points in the Node.js event loop, and their execution order is a common interview question.

**Execution priority (highest to lowest):**

1. **`process.nextTick`** — fires immediately after the current operation, before *any* other I/O or timer. It is processed from the **nextTick queue**, which is drained completely before moving on.
2. **Microtasks (Promise `.then`, `queueMicrotask`)** — processed from the **microtask queue**, right after the nextTick queue is empty. These run between every phase of the event loop.
3. **`setTimeout(fn, 0)` / `setImmediate`** — these are **macrotasks**. `setTimeout` runs in the **Timers** phase; `setImmediate` runs in the **Check** phase.

**Example:**

```js
console.log('1 - start');

setTimeout(() => console.log('2 - setTimeout'), 0);

Promise.resolve().then(() => console.log('3 - Promise'));

process.nextTick(() => console.log('4 - nextTick'));

console.log('5 - end');
```

**Output:**

```
1 - start
5 - end
4 - nextTick
3 - Promise
2 - setTimeout
```

Synchronous code runs first (`1`, `5`), then `process.nextTick` (`4`), then the microtask/Promise (`3`), and finally the macrotask/setTimeout (`2`).

> **Warning:** Overusing `process.nextTick` can starve I/O because the nextTick queue is drained completely before the event loop continues. Prefer `setImmediate` or `queueMicrotask` unless you specifically need nextTick's priority.
