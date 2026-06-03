---
question: "What is database normalization?"
section: "database"
difficulty: "medium"
tags: ["sql", "schema"]
order: 3
---

Normalization is the process of organizing tables to **reduce redundancy** and **prevent update anomalies**.

- **1NF (First Normal Form)** — every column holds **atomic** (indivisible) values; no repeating groups.
- **2NF** — meets 1NF and has **no partial dependency** (every non-key column depends on the *whole* primary key, not just part of it).
- **3NF** — meets 2NF and has **no transitive dependency** (non-key columns depend only on the primary key, not on other non-key columns).

**Example of a 3NF violation:**

| student_id | student_name | dept_id | dept_name |
|---|---|---|---|
| 1 | Alice | 10 | CS |

`dept_name` depends on `dept_id`, not on `student_id`. Fix by moving department info to its own table.

**Denormalization** is the deliberate reverse — adding redundancy (e.g., storing a computed total) to speed up reads at the cost of extra write complexity.
