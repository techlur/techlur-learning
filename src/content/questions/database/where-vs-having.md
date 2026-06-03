---
question: "WHERE vs HAVING; difference and order of execution."
section: "database"
difficulty: "medium"
tags: ["sql", "queries"]
order: 8
---

- **WHERE** filters individual rows **before** grouping.
- **HAVING** filters groups **after** `GROUP BY` has been applied.

```sql
-- WHERE: filter rows before grouping
SELECT department, COUNT(*) AS cnt
FROM employees
WHERE status = 'active'
GROUP BY department
HAVING cnt > 5;           -- HAVING: filter groups after grouping
```

**Logical order of SQL execution:**

1. `FROM` (and `JOIN`)
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`
7. `LIMIT`

> You **cannot** use column aliases defined in `SELECT` inside a `WHERE` clause (because `SELECT` runs later), but some databases like MySQL allow aliases in `HAVING`.
