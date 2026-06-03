---
question: "What are HTTP status codes? Give the common ranges and examples."
section: "backend"
difficulty: "easy"
tags: ["http", "rest"]
order: 5
---

HTTP status codes are three-digit numbers the server returns to tell the client what happened. They are grouped by the first digit:

- **1xx — Informational:** `100 Continue`, `101 Switching Protocols`. Rarely used directly.
- **2xx — Success:**
  - `200 OK` — standard success.
  - `201 Created` — a new resource was created (common after POST).
  - `204 No Content` — success but nothing to return (common after DELETE).
- **3xx — Redirection:**
  - `301 Moved Permanently` — resource has a new URL.
  - `304 Not Modified` — cached version is still valid.
- **4xx — Client Error:**
  - `400 Bad Request` — malformed or invalid input.
  - `401 Unauthorized` — authentication required or failed.
  - `403 Forbidden` — authenticated but not allowed.
  - `404 Not Found` — resource does not exist.
  - `422 Unprocessable Entity` — validation error.
- **5xx — Server Error:**
  - `500 Internal Server Error` — generic server failure.
  - `502 Bad Gateway` — upstream server returned an invalid response.
  - `503 Service Unavailable` — server is overloaded or under maintenance.

> **401 vs 403:** 401 means "I don't know who you are" (missing or invalid credentials). 403 means "I know who you are, but you're not allowed to do this." Getting this distinction right matters in interviews.
