---
question: "What is a token, and why does it matter?"
section: "ai"
difficulty: "easy"
tags: ["llm", "tokens"]
order: 2
---

A **token** is a chunk of text that a language model reads and generates. Roughly **one token ~ 3/4 of an English word** (e.g., "chatbot" might be two tokens: "chat" + "bot").

**Why tokens matter:**

- **Billing** — API providers charge per token (input + output).
- **Context window** — every model has a maximum number of tokens it can process at once (e.g., 4K, 128K, 200K). Your prompt + the response must fit inside this window.
- **Truncation** — if your input exceeds the context window, the oldest content is silently dropped or the request fails.
- **Speed** — more tokens = longer generation time and higher latency.

> You can estimate token counts with tools like OpenAI's **tiktoken** library or Anthropic's token counting API before sending a request.
