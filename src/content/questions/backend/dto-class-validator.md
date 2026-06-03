---
question: "What is a DTO and why use class-validator?"
section: "backend"
difficulty: "easy"
tags: ["nestjs", "validation", "dto"]
order: 17
---

A **DTO (Data Transfer Object)** is a plain class that defines the shape of data coming into or going out of your API. It does not contain business logic — it is purely a data contract.

**Why use DTOs?**

- **Validation** — ensure incoming data matches the expected shape before it reaches your service.
- **Documentation** — the DTO clearly shows what fields an endpoint expects.
- **Type safety** — TypeScript catches mismatches at compile time.

**class-validator** is a library that uses decorators to define validation rules on DTO properties. Paired with NestJS's `ValidationPipe`, invalid requests are automatically rejected with a 400 error.

```ts
import { IsEmail, IsString, MinLength } from 'class-validator';

export class CreateUserDto {
  @IsString()
  @MinLength(2)
  name: string;

  @IsEmail()
  email: string;

  @IsString()
  @MinLength(8)
  password: string;
}
```

**Using it in a controller:**

```ts
@Post()
create(@Body() dto: CreateUserDto) {
  return this.userService.create(dto);
}
```

**Enable `ValidationPipe` globally in `main.ts`:**

```ts
app.useGlobalPipes(new ValidationPipe({
  whitelist: true,       // strip unknown properties
  forbidNonWhitelisted: true, // throw if unknown properties are sent
  transform: true,       // auto-transform payloads to DTO instances
}));
```

> **Tip:** Always enable `whitelist: true` to strip unexpected fields. This prevents users from injecting extra properties (like `isAdmin: true`) into your database.
