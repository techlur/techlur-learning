---
question: "Explain the four pillars of OOP."
section: "general"
difficulty: "easy"
tags: ["oop", "fundamentals"]
order: 4
---

**1. Encapsulation** — bundling data and the methods that operate on it into a single unit (class), and restricting direct access to internals via access modifiers (`private`, `public`).

**2. Abstraction** — hiding complex implementation details and exposing only what the user needs. Example: you call `array.sort()` without knowing the sorting algorithm inside.

**3. Inheritance** — a class can **extend** another class, inheriting its properties and methods. Promotes code reuse. Example: `Dog extends Animal`.

**4. Polymorphism** — the same method name behaves **differently** depending on the object. Two forms:
- **Compile-time** (method overloading) — same name, different parameters.
- **Runtime** (method overriding) — subclass provides its own version of a parent method.

```js
class Animal {
  speak() { return "..."; }
}
class Dog extends Animal {
  speak() { return "Woof!"; }  // polymorphism (override)
}
```

> OOP is not the only paradigm -- functional programming avoids mutable state and emphasizes pure functions. Many modern codebases blend both.
