---
question: "What is middleware, and what is a guard?"
section: "backend"
difficulty: "medium"
tags: ["nestjs", "express", "middleware"]
order: 8
---

**Middleware** is a function that runs in the request pipeline before the route handler, with access to `req`, `res`, and `next()`. Used for logging, body parsing, CORS, auth checks.

```js
function logger(req, res, next) {
  console.log(req.method, req.url);
  next(); // pass control onward
}
```

**Guards** (NestJS) decide whether a request is allowed to proceed — they return `true`/`false`. They run after middleware and are the right place for authentication and role-based authorization.

```ts
@Injectable()
class AuthGuard {
  canActivate(ctx) {
    const req = ctx.switchToHttp().getRequest();
    return Boolean(req.headers.authorization);
  }
}
```
