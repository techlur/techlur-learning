---
question: "What makes an API RESTful?"
section: "backend"
difficulty: "medium"
tags: ["rest", "api"]
order: 18
---

**REST (Representational State Transfer)** is an architectural style for designing networked APIs. An API is considered RESTful when it follows these principles:

- **Stateless** — every request contains all the information the server needs. The server does not store client session state between requests.
- **Resource-based URLs** — endpoints represent resources (nouns), not actions (verbs). Use `/users/5` instead of `/getUser?id=5`.
- **Correct HTTP methods** — use GET to read, POST to create, PUT/PATCH to update, DELETE to remove.
- **Proper status codes** — return 201 for creation, 404 for not found, 400 for bad input, etc.
- **Uniform interface** — consistent URL patterns, predictable request/response formats (usually JSON).
- **Client-server separation** — the client and server are independent; the client only knows the API contract.

**Good REST design:**

```
GET    /users          → list all users
GET    /users/42       → get user 42
POST   /users          → create a new user
PUT    /users/42       → replace user 42
PATCH  /users/42       → partially update user 42
DELETE /users/42       → delete user 42
GET    /users/42/posts → list posts by user 42
```

**Common mistakes:**

- Using verbs in URLs: `/getUsers`, `/deleteUser/42`
- Using POST for everything
- Returning 200 for errors with an error message in the body
- Not using plural nouns for collections (`/user` vs `/users`)

> **Interview tip:** REST is a set of guidelines, not a strict specification. In practice, very few APIs are "purely" RESTful — what matters is consistent, predictable conventions that your team agrees on.
