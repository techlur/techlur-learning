---
question: "What is an index? What's the trade-off?"
section: "database"
difficulty: "medium"
tags: ["mysql", "performance"]
order: 2
---

An index is a data structure (usually a B-tree) that speeds up reads by avoiding full table scans — like a book's index. Trade-off: it speeds up `SELECT`/`WHERE`/`JOIN` but slows down `INSERT`/`UPDATE`/`DELETE` and uses storage. Index columns you frequently filter or join on.
