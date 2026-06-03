---
question: "What is SQL injection and how do you prevent it?"
section: "database"
difficulty: "hard"
tags: ["security", "sql"]
order: 3
---

An attack where malicious input is concatenated into a query to alter its logic. Prevent it with **parameterized queries / prepared statements** (and ORMs that use them), plus input validation and least-privilege DB accounts. Never build SQL by string concatenation.

```js
// safe — parameterized
db.query("SELECT * FROM users WHERE email = ?", [email]);
```
