---
question: "How can you transform a request or response before it reaches your handler?"
section: "backend"
difficulty: "medium"
tags: ["nestjs", "middleware", "interceptors"]
order: 4
---

Most backend frameworks give you hooks to modify requests and responses at different stages. In **NestJS**, the three main tools are:

- **Middleware** — runs first; has access to `req`, `res`, `next()`. Great for logging, body parsing, and setting headers.
- **Pipes** — transform or validate the incoming data before it reaches the handler. For example, `ParseIntPipe` converts a string param to a number.
- **Interceptors** — wrap the handler call, so they can transform both the request *and* the response. They use RxJS observables.

**NestJS Interceptor example — adding a `timestamp` to every response:**

```ts
@Injectable()
export class TimestampInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    return next.handle().pipe(
      map(data => ({
        ...data,
        timestamp: new Date().toISOString(),
      })),
    );
  }
}
```

Apply it globally or per-controller:

```ts
@UseInterceptors(TimestampInterceptor)
@Controller('users')
export class UsersController { ... }
```

> **Key point:** The NestJS request lifecycle order is: Middleware → Guards → Interceptors (before) → Pipes → Handler → Interceptors (after) → Exception Filters.
