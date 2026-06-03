---
question: "What are ACID properties?"
section: "database"
difficulty: "medium"
tags: ["sql", "transactions"]
order: 6
---

ACID is a set of guarantees that database transactions provide:

- **Atomicity** — a transaction is **all-or-nothing**. If any part fails, the entire transaction rolls back.
- **Consistency** — a transaction moves the database from one **valid state** to another, respecting all constraints and rules.
- **Isolation** — concurrent transactions do not **interfere** with each other. The result is the same as if they ran sequentially (exact behavior depends on the isolation level).
- **Durability** — once a transaction is **committed**, the data survives crashes, power loss, or restarts (typically via write-ahead logs).

```sql
BEGIN TRANSACTION;
  UPDATE accounts SET balance = balance - 500 WHERE id = 1;
  UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;
-- If either UPDATE fails, both are rolled back (Atomicity).
```

> NoSQL databases often relax one or more ACID properties in favor of availability and partition tolerance (see the **CAP theorem**).
