---
question: "How would you call an LLM API from a Node backend safely?"
section: "ai"
difficulty: "medium"
tags: ["llm", "api", "nodejs"]
order: 8
---

**Key rules:** call the LLM from your **server**, never from the browser, and keep your API key in an environment variable.

```js
import Anthropic from "@anthropic-ai/sdk";

const client = new Anthropic(); // reads ANTHROPIC_API_KEY from env

export async function askLLM(userPrompt) {
  const message = await client.messages.create({
    model: "claude-sonnet-4-20250514",
    max_tokens: 1024,
    messages: [{ role: "user", content: userPrompt }],
  });
  return message.content[0].text;
}
```

**Production checklist:**

- **Secrets** — store API keys in env vars or a secrets manager, never in code.
- **Timeouts** — set a request timeout so a slow model call doesn't hang your server.
- **Retries** — add exponential backoff for transient 429 / 5xx errors.
- **Input validation** — sanitize and limit user input length before sending to the API.
- **Rate limiting** — throttle requests per user to control cost.
- **Caching** — cache identical prompts to reduce latency and spend.
- **Error handling** — return graceful fallback messages to the user if the API fails.
