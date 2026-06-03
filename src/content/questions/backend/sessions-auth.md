---
question: "How do you create and maintain a session on the backend?"
section: "backend"
difficulty: "medium"
tags: ["auth", "sessions", "jwt"]
order: 6
---

There are two main approaches to maintaining user sessions: **session-based** (server-side) and **token-based** (client-side).

**Session-Based Authentication:**

1. User logs in with credentials.
2. Server creates a session object and stores it (in memory, Redis, or a database).
3. Server sends back a **session ID** in a `Set-Cookie` header.
4. Browser automatically sends the cookie on every subsequent request.
5. Server looks up the session ID to identify the user.

**Token-Based Authentication (JWT):**

1. User logs in with credentials.
2. Server creates and signs a **JWT** containing user claims.
3. Client stores the token (localStorage or httpOnly cookie) and sends it via `Authorization: Bearer <token>`.
4. Server verifies the token signature — no server-side lookup needed.

| | Session Cookies | JWT |
|---|---|---|
| **State** | Server-side (stateful) | Client-side (stateless) |
| **Storage** | Session store (Redis, DB) | Token stored by client |
| **Scalability** | Needs shared store across servers | Scales easily — no shared state |
| **Revocation** | Easy — delete the session | Hard — token valid until it expires |
| **Size** | Small cookie (just an ID) | Larger (carries payload) |

> **Best practice:** For most web apps, use httpOnly, Secure, SameSite cookies for storing session identifiers or tokens. This mitigates XSS and CSRF risks compared to localStorage.
