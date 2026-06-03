---
question: "Process vs thread; synchronous vs asynchronous."
section: "general"
difficulty: "medium"
tags: ["os", "fundamentals"]
order: 5
---

**Process vs Thread:**

- A **process** is an independent program in execution with its **own memory space**. Processes are isolated -- one crashing doesn't take down another.
- A **thread** is a lightweight unit of execution **within a process**. Threads share the same memory, making communication fast but introducing risks like race conditions.

| | Process | Thread |
|---|---|---|
| Memory | Separate | Shared |
| Creation cost | Heavy | Light |
| Communication | IPC (pipes, sockets) | Shared variables |
| Crash impact | Isolated | Can crash entire process |

**Synchronous vs Asynchronous:**

- **Synchronous** — each operation **blocks** until it completes before the next one starts. Simple but can waste time waiting (e.g., waiting for a database query).
- **Asynchronous** — an operation is started and the program **continues** without waiting. A callback, promise, or event fires when the result is ready.

```js
// Synchronous -- blocks
const data = fs.readFileSync("file.txt");

// Asynchronous -- non-blocking
const data = await fs.promises.readFile("file.txt");
```

> Node.js is **single-threaded** but handles concurrency via an **async event loop**, which is why understanding async is critical for backend JavaScript.
