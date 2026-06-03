---
question: "How do you secure a backend application? (name several)"
section: "backend"
difficulty: "hard"
tags: ["security", "auth"]
order: 20
---

Backend security is not a single feature — it is a layered approach. Here are the essential practices:

**Authentication & Passwords:**

- **Hash passwords with bcrypt** (or Argon2) — never store plain text. bcrypt includes a salt and is intentionally slow to resist brute-force attacks.
- Use **JWT or session cookies** for auth. Prefer httpOnly, Secure, SameSite cookies to reduce XSS and CSRF risk.

**Input Validation:**

- **Validate and sanitize all input** — never trust data from the client. Use a validation library (class-validator, Joi, Zod) at the API boundary.
- **Parameterized queries** (prepared statements) — prevent SQL injection. Never concatenate user input into SQL strings.

```js
// BAD — SQL injection risk
db.query(`SELECT * FROM users WHERE id = ${req.params.id}`);

// GOOD — parameterized query
db.query('SELECT * FROM users WHERE id = $1', [req.params.id]);
```

**Transport & Headers:**

- **HTTPS everywhere** — encrypt data in transit. Redirect HTTP to HTTPS.
- **Use helmet** (Express middleware) — sets security headers like `X-Content-Type-Options`, `Strict-Transport-Security`, `X-Frame-Options`.
- **CORS configuration** — only allow trusted origins.

**Rate Limiting & Abuse Prevention:**

- **Rate-limit endpoints** — prevent brute-force login attempts and DDoS. Use libraries like `express-rate-limit` or `@nestjs/throttler`.
- **Limit payload size** — prevent large request body attacks.

**Other Important Measures:**

- **Principle of least privilege** — give services and database users only the permissions they need.
- **Keep dependencies updated** — run `npm audit` regularly to catch known vulnerabilities.
- **Never expose stack traces** in production — return generic error messages and log details server-side.
- **Environment variables** — store secrets (API keys, DB passwords) in environment variables, never in code.

> **Remember:** Security is defense in depth. No single measure is enough. Combining multiple layers — hashing, validation, HTTPS, rate-limiting, least privilege — makes your application resilient against different attack vectors.
