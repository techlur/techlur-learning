---
question: "Describe the structure of an HTTP request and response."
section: "backend"
difficulty: "easy"
tags: ["http"]
order: 3
---

Both HTTP requests and responses share a similar three-part structure: a **start line**, **headers**, and an optional **body**.

**HTTP Request:**

```
POST /login HTTP/1.1
Host: api.example.com
Content-Type: application/json

{ "email": "user@example.com", "password": "s3cret" }
```

- **Start line** — method (`POST`), path (`/login`), and HTTP version.
- **Headers** — key-value metadata like `Content-Type`, `Authorization`, `Accept`.
- **Body** — the payload (JSON, form data, etc.). GET requests typically have no body.

**HTTP Response:**

```
HTTP/1.1 200 OK
Content-Type: application/json

{ "token": "eyJhbGciOi..." }
```

- **Status line** — HTTP version, status code (`200`), and reason phrase (`OK`).
- **Headers** — `Content-Type`, `Set-Cookie`, `Cache-Control`, etc.
- **Body** — the response payload (HTML, JSON, binary, etc.).

> **Remember:** Headers are always plain text key-value pairs. The body is separated from the headers by a blank line.
