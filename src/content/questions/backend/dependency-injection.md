---
question: "What is Dependency Injection and why does NestJS use it?"
section: "backend"
difficulty: "medium"
tags: ["nestjs", "di", "architecture"]
order: 16
---

**Dependency Injection (DI)** is a design pattern where a class receives its dependencies from the outside rather than creating them itself. An **IoC (Inversion of Control) container** manages the creation and lifetime of these dependencies.

**Without DI (tightly coupled):**

```ts
class UserController {
  private userService = new UserService(); // creates its own dependency
}
```

**With DI (loosely coupled):**

```ts
@Controller('users')
class UserController {
  constructor(private readonly userService: UserService) {}
  // NestJS injects UserService automatically
}
```

**Why NestJS uses DI:**

- **Loose coupling** — classes depend on abstractions, not concrete implementations. You can swap a `DatabaseService` for a `MockDatabaseService` without changing the controller.
- **Testability** — in unit tests, you inject mock or stub services instead of real ones.
- **Single responsibility** — each service handles one concern; the container wires them together.
- **Lifecycle management** — the container controls whether a service is a singleton (default in NestJS), request-scoped, or transient.

**How it works in NestJS:**

1. Mark a class as injectable with `@Injectable()`.
2. Register it in a module's `providers` array.
3. Declare it as a constructor parameter wherever you need it.

```ts
@Injectable()
export class UserService {
  findAll() { return ['Alice', 'Bob']; }
}

@Module({
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
```

> **Tip:** If an interviewer asks "what is IoC?" — it is the principle that the framework controls object creation and lifecycle, not your code. DI is the most common way to implement IoC.
