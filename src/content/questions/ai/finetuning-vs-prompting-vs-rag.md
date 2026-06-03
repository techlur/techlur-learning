---
question: "Fine-tuning vs prompt engineering vs RAG — when each?"
section: "ai"
difficulty: "hard"
tags: ["llm", "rag", "fine-tuning"]
order: 7
---

| Approach | Cost | Best when |
|---|---|---|
| **Prompt engineering** | Lowest | You can get the right output by writing a better prompt (system message, few-shot examples, chain-of-thought). Try this **first**. |
| **RAG** | Medium | The model needs access to **your data** (docs, knowledge base) that it wasn't trained on. Retrieves relevant context at query time. |
| **Fine-tuning** | Highest | You need a consistent **style, format, or behavior** that prompting alone can't achieve, or you need to reduce token usage by baking instructions into the model. |

**Decision flow:**

1. Start with **prompt engineering** — it's free and instant.
2. If the model lacks knowledge, add **RAG** to inject external data.
3. If quality is still off or you need a specialized tone/format at scale, consider **fine-tuning**.

> Fine-tuning does **not** teach a model new facts reliably — use RAG for that. Fine-tuning is best for teaching *how* to respond, not *what* to know.
