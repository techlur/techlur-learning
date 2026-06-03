---
question: "Is Node.js single-threaded? Explain the event loop."
section: "backend"
difficulty: "medium"
tags: ["nodejs", "event-loop"]
order: 11
---

**Yes and no.** Node.js runs your JavaScript on a **single thread**, but it delegates I/O operations (file reads, network calls, DNS lookups) to **libuv**, which maintains a thread pool (default 4 threads).

**The Event Loop** is the mechanism that coordinates this:

1. **Timers** — execute callbacks from `setTimeout` and `setInterval`.
2. **Pending callbacks** — I/O callbacks deferred from the previous cycle.
3. **Poll** — retrieve new I/O events; execute I/O-related callbacks. This is where Node spends most of its time.
4. **Check** — execute `setImmediate` callbacks.
5. **Close callbacks** — e.g., `socket.on('close', ...)`.

Between each phase, Node processes the **microtask queue** (resolved Promises, `process.nextTick`).

**Why does this matter?**

- **I/O is non-blocking** — while one request waits for a database response, Node can handle other requests.
- **CPU-heavy work blocks the loop** — a big `for` loop or image processing will freeze all other requests because there is only one JS thread.

**How to handle CPU-heavy tasks:**

- Use **Worker Threads** (`worker_threads` module) to run code on a separate thread.
- Offload to a **child process** (`child_process.fork`).
- Use a **job queue** (Bull, BeeQueue) for background processing.

> **Key takeaway:** Node.js is single-threaded for JavaScript execution but uses multiple threads under the hood for I/O. The event loop is what makes non-blocking async work possible.
