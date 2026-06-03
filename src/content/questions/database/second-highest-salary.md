---
question: "Find the 2nd highest salary — write the query."
section: "database"
difficulty: "hard"
tags: ["sql", "queries"]
order: 9
---

**Approach 1 — LIMIT / OFFSET (MySQL, PostgreSQL):**

```sql
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
```

**Approach 2 — Subquery:**

```sql
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
```

**Approach 3 — DENSE_RANK window function (works for Nth highest):**

```sql
SELECT salary
FROM (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM employees
) ranked
WHERE rnk = 2;
```

> Use `DENSE_RANK` over `ROW_NUMBER` when duplicate salaries should share the same rank. `DISTINCT` in Approach 1 handles ties but OFFSET can still skip values unexpectedly if you're not careful.
