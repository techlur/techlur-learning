---
question: "Explain the core building blocks of NestJS."
section: "backend"
difficulty: "medium"
tags: ["nestjs", "architecture"]
order: 15
---

NestJS organizes applications around a set of core building blocks, each with a specific responsibility:

- **Module** (`@Module`) — a class that groups related controllers and providers. Every app has at least a root `AppModule`. Modules can import other modules.
- **Controller** (`@Controller`) — handles incoming HTTP requests and returns responses. Defines routes with decorators like `@Get()`, `@Post()`, etc.
- **Provider / Service** (`@Injectable`) — contains business logic. Services are injected into controllers via dependency injection.
- **Pipe** — transforms or validates input data before it reaches the handler. Example: `ValidationPipe` validates DTOs, `ParseIntPipe` converts strings to numbers.
- **Guard** (`@Injectable`, implements `CanActivate`) — determines whether a request is allowed to proceed. Used for authentication and authorization.
- **Interceptor** (`@Injectable`, implements `NestInterceptor`) — wraps the handler execution. Can transform the response, add logging, or cache results.
- **Exception Filter** (`@Catch`) — catches thrown exceptions and converts them into HTTP responses.

**Request lifecycle order:**

```
Incoming Request
  → Middleware
    → Guards
      → Interceptors (before)
        → Pipes
          → Route Handler
        → Interceptors (after)
      → Exception Filters (if error)
  → Response
```

> **Key insight:** Each building block has a single responsibility. Guards only decide yes/no, Pipes only validate/transform data, Interceptors wrap the handler. This separation makes NestJS apps testable and maintainable.
