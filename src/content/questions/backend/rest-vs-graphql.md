---
question: "REST vs GraphQL — when would you choose each?"
section: "backend"
difficulty: "medium"
tags: ["rest", "graphql", "api"]
order: 19
---

REST and GraphQL are two approaches to building APIs. Each has trade-offs.

**REST:**

- Multiple endpoints, one per resource (`/users`, `/posts`, `/comments`).
- The server decides what data to return for each endpoint.
- Simple HTTP caching with `Cache-Control`, `ETag`, etc.
- Can lead to **over-fetching** (getting more fields than you need) or **under-fetching** (needing multiple requests to assemble a view).

**GraphQL:**

- A **single endpoint** (typically `/graphql`).
- The client sends a **query** specifying exactly which fields it needs.
- No over-fetching or under-fetching — the response shape matches the query.
- Built-in schema and type system for self-documentation.

| | REST | GraphQL |
|---|---|---|
| **Endpoints** | Many (one per resource) | Single (`/graphql`) |
| **Data shape** | Server decides | Client decides |
| **Caching** | Easy (HTTP-level) | Harder (needs client-side cache like Apollo) |
| **Learning curve** | Lower | Higher (schema, resolvers, query language) |
| **File uploads** | Straightforward | Requires extra setup |
| **Real-time** | Polling or WebSockets | Subscriptions built in |

**When to choose REST:**

- Simple CRUD applications with predictable data needs.
- When HTTP caching is important.
- When the team is more familiar with REST patterns.

**When to choose GraphQL:**

- Complex frontends that need different slices of data on different screens.
- Mobile apps where minimizing payload size matters.
- When you have many related resources and want to avoid multiple round trips.

> **Tip:** They are not mutually exclusive. Some teams use REST for simple CRUD and add a GraphQL layer for complex, relationship-heavy queries.
