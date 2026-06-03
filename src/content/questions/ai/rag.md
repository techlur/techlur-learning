---
question: "What is RAG (Retrieval-Augmented Generation)?"
section: "ai"
difficulty: "medium"
tags: ["llm", "rag", "architecture"]
order: 2
---

A pattern where you **retrieve relevant documents** (often via a vector database) and inject them into the prompt so the model answers from your data instead of just its training. Used to build chatbots over private docs and to reduce hallucination.

Flow: `user question → embed → search vector DB → top matches → prompt + matches → LLM answer`.
