---
question: "What is CORS and why does it block requests?"
section: "backend"
difficulty: "medium"
tags: ["cors", "security", "http"]
order: 10
---

**CORS (Cross-Origin Resource Sharing)** is a browser security mechanism that restricts web pages from making requests to a different origin (domain, protocol, or port) than the one that served the page.

**Why does it exist?**

Without CORS, a malicious site could make requests to your bank's API using your cookies — the browser would send them automatically. CORS prevents this by requiring the server to explicitly allow cross-origin access.

**How it works:**

1. The browser sends a request from `http://frontend.com` to `http://api.example.com`.
2. If the origins differ, the browser checks for CORS headers in the response.
3. For "non-simple" requests (PUT, DELETE, custom headers, JSON content-type), the browser first sends an **OPTIONS preflight** request asking "is this allowed?"
4. The server responds with headers like `Access-Control-Allow-Origin`, `Access-Control-Allow-Methods`, and `Access-Control-Allow-Headers`.
5. If the headers permit it, the browser proceeds with the actual request. Otherwise, it blocks it.

**Key CORS headers:**

- `Access-Control-Allow-Origin` — which origins are allowed (`*` for any, or a specific origin).
- `Access-Control-Allow-Methods` — which HTTP methods are permitted.
- `Access-Control-Allow-Headers` — which custom headers the client can send.
- `Access-Control-Allow-Credentials` — whether cookies/auth headers are allowed (cannot use `*` for origin when this is `true`).

**Fix on the server (Express example):**

```js
const cors = require('cors');
app.use(cors({
  origin: 'https://frontend.com',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true,
}));
```

> **Remember:** CORS is enforced by the **browser**, not the server. Server-to-server requests (e.g., from your backend to another API) are never blocked by CORS. If you see a CORS error, the fix is always on the server, not the client.
