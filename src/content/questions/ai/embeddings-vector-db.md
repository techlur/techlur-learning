---
question: "What are embeddings and a vector database?"
section: "ai"
difficulty: "medium"
tags: ["embeddings", "vector-database", "rag"]
order: 5
---

An **embedding** is a fixed-length array of numbers (a vector) that captures the **semantic meaning** of a piece of text. Similar meanings produce vectors that are close together in high-dimensional space.

```text
"king"  -> [0.21, -0.55, 0.89, ...]
"queen" -> [0.19, -0.52, 0.91, ...]   <-- close to "king"
"pizza" -> [-0.73, 0.44, -0.12, ...]   <-- far from "king"
```

A **vector database** (Pinecone, Weaviate, pgvector, Chroma) stores these vectors and supports fast **nearest-neighbor search** — finding the most semantically similar items.

**How they work together (RAG pipeline):**

1. **Index** — split your documents into chunks, embed each chunk, store in the vector DB.
2. **Query** — embed the user's question, search the vector DB for the closest chunks.
3. **Generate** — pass the retrieved chunks + the question to an LLM for a grounded answer.

> Embeddings are the backbone of **semantic search** and **Retrieval-Augmented Generation (RAG)**.
