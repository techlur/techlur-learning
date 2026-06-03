---
question: "Map CRUD operations to HTTP methods."
section: "backend"
difficulty: "easy"
tags: ["http", "rest", "crud"]
order: 2
---

CRUD is the set of four basic operations every persistent application needs. Each maps to an HTTP method:

| CRUD Operation | HTTP Method | Example |
|---------------|-------------|---------|
| **Create** | `POST` | `POST /users` — create a new user |
| **Read** | `GET` | `GET /users/1` — fetch user with id 1 |
| **Update** | `PUT` / `PATCH` | `PUT /users/1` — replace user 1 |
| **Delete** | `DELETE` | `DELETE /users/1` — remove user 1 |

**PUT vs PATCH:**

- **PUT** replaces the entire record. If you omit a field, it may be set to `null`.
- **PATCH** updates only the fields you send; everything else stays the same.

> **Tip:** In interviews, mentioning the PUT vs PATCH distinction shows you understand REST semantics beyond the basics.
