---
question: "Explain debounce vs throttle."
section: "frontend"
difficulty: "hard"
tags: ["javascript", "performance"]
order: 10
---

Both techniques limit how often a function fires, but they work differently.

**Debounce** — waits until the user **stops** triggering the event for a set delay, then fires **once**. Each new trigger resets the timer.

Use case: search-as-you-type input, window resize handler.

```js
function debounce(fn, delay) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delay);
  };
}

input.addEventListener("input", debounce(handleSearch, 300));
```

**Throttle** — fires at most **once per interval**, no matter how many times the event triggers. It guarantees a steady execution rate.

Use case: scroll listener, drag handler, rate-limited API calls.

```js
function throttle(fn, interval) {
  let lastTime = 0;
  return (...args) => {
    const now = Date.now();
    if (now - lastTime >= interval) {
      lastTime = now;
      fn(...args);
    }
  };
}

window.addEventListener("scroll", throttle(handleScroll, 200));
```

> **In short:** Debounce collapses a burst into one call at the end. Throttle spreads calls evenly across time.
