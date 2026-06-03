---
question: "What is a JWT and how is it used?"
section: "backend"
difficulty: "medium"
tags: ["auth", "security", "jwt"]
order: 7
---

A **JSON Web Token** is a compact, signed token with three dot-separated parts: **Header.Payload.Signature**.

- **Header** — algorithm & token type.
- **Payload** — claims like `userId`, `role`, `exp` (expiry). This is Base64-encoded, *not encrypted* — never put secrets here.
- **Signature** — created with a secret key; lets the server verify the token wasn't tampered with.

**Flow:** user logs in → server signs a JWT → client stores it and sends `Authorization: Bearer <token>` → server verifies the signature on each request.

> **Best practice:** Use a short-lived access token + a long-lived refresh token. Store tokens in httpOnly cookies when possible to reduce XSS risk.
