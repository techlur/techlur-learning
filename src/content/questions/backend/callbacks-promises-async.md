---
question: "Callbacks vs Promises vs async/await — what's the difference?"
section: "backend"
difficulty: "easy"
tags: ["javascript", "async"]
order: 12
---

All three are ways to handle asynchronous operations in JavaScript. Each is an evolution of the previous.

**Callbacks** — a function passed as an argument, called when the async work completes. Works, but nesting multiple callbacks creates **callback hell** (deeply indented, hard-to-read code).

```js
fs.readFile('a.txt', (err, data) => {
  if (err) throw err;
  fs.readFile('b.txt', (err, data2) => {
    if (err) throw err;
    console.log(data, data2); // nested and messy
  });
});
```

**Promises** — an object representing a future value. Chain `.then()` for success and `.catch()` for errors. Flattens the nesting.

```js
readFilePromise('a.txt')
  .then(data => readFilePromise('b.txt'))
  .then(data2 => console.log(data2))
  .catch(err => console.error(err));
```

**async/await** — syntactic sugar over Promises. Makes async code look and behave like synchronous code. Uses `try/catch` for error handling.

```js
async function readFiles() {
  try {
    const data = await readFilePromise('a.txt');
    const data2 = await readFilePromise('b.txt');
    console.log(data, data2);
  } catch (err) {
    console.error(err);
  }
}
```

> **Tip:** `async/await` is still using Promises under the hood — it's not a different mechanism. Every `async` function returns a Promise, and `await` pauses execution until that Promise resolves.
