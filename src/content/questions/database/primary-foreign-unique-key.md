---
question: "Primary key vs foreign key vs unique key."
section: "database"
difficulty: "easy"
tags: ["sql", "keys"]
order: 4
---

- **Primary Key** — uniquely identifies every row in a table. Only **one** per table. Cannot be `NULL`.
- **Foreign Key** — a column that **references the primary key** of another table, enforcing referential integrity (you can't insert an order for a non-existent user).
- **Unique Key** — enforces uniqueness on a column (like email), but a table can have **multiple** unique keys and they allow **one NULL** (behavior varies by RDBMS).

```sql
CREATE TABLE users (
  id    INT PRIMARY KEY,          -- primary key
  email VARCHAR(255) UNIQUE,      -- unique key
  dept  INT,
  FOREIGN KEY (dept) REFERENCES departments(id)  -- foreign key
);
```

> A primary key is implicitly unique, but a unique key is **not** automatically the primary key.
