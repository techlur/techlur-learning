---
question: "SQL vs NoSQL — when to use each?"
section: "database"
difficulty: "easy"
tags: ["sql", "nosql"]
order: 1
---

**SQL databases** (MySQL, PostgreSQL) store data in structured **tables** with a fixed schema. They enforce relationships, support complex queries, and guarantee strong consistency through ACID transactions. Choose SQL when your data is relational and predictable — e.g., users, orders, payments.

**NoSQL databases** (MongoDB, DynamoDB, Redis) offer flexible schemas and are designed for **horizontal scaling**. They trade some consistency guarantees for speed and flexibility. Choose NoSQL when you need:

- **Rapidly evolving schemas** (e.g., early-stage prototypes)
- **High write throughput** at scale (e.g., event logging, IoT)
- **Document-shaped data** that doesn't fit neatly into tables

> In practice many production systems use **both** — SQL for transactional data and NoSQL for caching, search, or analytics.
