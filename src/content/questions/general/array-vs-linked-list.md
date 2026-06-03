---
question: "What is the difference between an array and a linked list?"
section: "general"
difficulty: "easy"
tags: ["dsa", "data-structures"]
order: 2
---

| | **Array** | **Linked List** |
|---|---|---|
| **Memory** | Contiguous block | Scattered nodes connected by pointers |
| **Access by index** | **O(1)** — direct jump | **O(n)** — must traverse from head |
| **Insert/Delete at middle** | **O(n)** — elements must shift | **O(1)** — if you already have a reference to the node |
| **Insert at end** | **O(1)** amortized (dynamic array) | **O(1)** with a tail pointer |
| **Cache performance** | Excellent (data is adjacent) | Poor (nodes scattered in memory) |
| **Memory overhead** | None beyond the data | Extra pointer(s) per node |

**When to use each:**

- **Array** (or dynamic array / `ArrayList`) — default choice when you need fast random access and iteration.
- **Linked list** — useful when you need frequent insertions/deletions at arbitrary positions and don't need index-based access (e.g., implementing queues, LRU caches).

> In most modern languages (JavaScript, Python, Java), the built-in "list" or "array" is a **dynamic array**, not a linked list.
