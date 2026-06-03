---
question: "What is prompt engineering? Name a few techniques."
section: "ai"
difficulty: "easy"
tags: ["llm", "prompting"]
order: 9
---

**Prompt engineering** is the practice of crafting inputs to get better, more reliable outputs from a language model. It's the cheapest and fastest way to improve LLM results.

**Key techniques:**

- **Be specific** — instead of "summarize this," say "summarize in 3 bullet points, each under 20 words."
- **Few-shot examples** — include 2-3 input/output examples in the prompt so the model learns the pattern.
- **Chain-of-thought (CoT)** — ask the model to "think step by step" before giving a final answer. Improves reasoning accuracy.
- **Structured output** — request the response in a specific format like JSON or Markdown so it's easier to parse programmatically.
- **System / role prompts** — set a persona or context (e.g., "You are a senior backend engineer reviewing code").
- **Delimiters** — use clear markers like triple backticks or XML tags to separate instructions from data.

> Good prompts are **iterative** — start simple, test, then refine based on where the model goes wrong.
