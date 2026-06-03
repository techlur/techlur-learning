---
question: "localStorage vs sessionStorage vs cookies."
section: "frontend"
difficulty: "easy"
tags: ["browser", "storage"]
order: 11
---

All three store data on the client, but they differ in lifetime, size, and behavior.

| Feature | `localStorage` | `sessionStorage` | Cookies |
|---|---|---|---|
| **Lifetime** | Until explicitly cleared | Until the tab/window closes | Set by `Expires` / `Max-Age` (or session) |
| **Size limit** | ~5-10 MB | ~5-10 MB | ~4 KB per cookie |
| **Sent to server** | No | No | Yes, on every matching HTTP request |
| **Scope** | Same origin, all tabs | Same origin, single tab | Same origin (configurable with `Domain`, `Path`) |
| **API** | `setItem` / `getItem` | `setItem` / `getItem` | `document.cookie` string or `Set-Cookie` header |

```js
// localStorage
localStorage.setItem("theme", "dark");
localStorage.getItem("theme"); // "dark"

// sessionStorage
sessionStorage.setItem("token", "abc123");

// Cookie
document.cookie = "lang=en; max-age=86400; path=/";
```

> **When to use what:** Use cookies when the server needs the data (auth tokens with `HttpOnly`). Use `localStorage` for persistent user preferences. Use `sessionStorage` for temporary, tab-specific data.
