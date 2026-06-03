---
question: "Explain the types of SQL JOINs."
section: "database"
difficulty: "medium"
tags: ["mysql", "sql", "joins"]
order: 1
---

- **INNER JOIN** — only rows matching in both tables.
- **LEFT JOIN** — all left rows + matching right (NULLs if none).
- **RIGHT JOIN** — all right rows + matching left.
- **FULL OUTER JOIN** — all rows from both (MySQL emulates with UNION).

```sql
SELECT u.name, o.total
FROM users u
LEFT JOIN orders o ON o.user_id = u.id;
```
