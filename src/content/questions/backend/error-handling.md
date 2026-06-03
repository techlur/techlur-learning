---
question: "How do you handle errors and error responses in a backend API?"
section: "backend"
difficulty: "medium"
tags: ["nestjs", "express", "errors"]
order: 9
---

Good error handling keeps your API predictable and your users informed without leaking internals.

**Key principles:**

- **Use a structured error shape** — every error response should have a consistent format so clients can parse it reliably.
- **Use typed/named exceptions** — throw specific errors (`NotFoundException`, `ValidationError`) rather than generic ones.
- **Never leak stack traces** — in production, stack traces expose file paths and internal logic. Return a clean message and log the details server-side.
- **Use the right status code** — 400 for bad input, 401/403 for auth issues, 404 for missing resources, 500 for unexpected failures.

**Express error-handling middleware:**

```js
app.use((err, req, res, next) => {
  console.error(err.stack); // log full error server-side

  res.status(err.status || 500).json({
    error: {
      message: err.message || 'Internal Server Error',
      code: err.code || 'UNKNOWN_ERROR',
    },
  });
});
```

**NestJS exception filters:**

NestJS has a built-in exception layer. You can throw typed exceptions and they are automatically mapped to responses:

```ts
throw new NotFoundException('User not found');
// → { statusCode: 404, message: "User not found" }
```

For custom shapes, create an exception filter:

```ts
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse();
    const status = exception.getStatus();

    response.status(status).json({
      success: false,
      error: exception.message,
      timestamp: new Date().toISOString(),
    });
  }
}
```

> **Tip:** Always validate input at the edge (with DTOs/pipes) so you can return a 400 before the error reaches your business logic.
