---
question: "What do temperature and max tokens control?"
section: "ai"
difficulty: "easy"
tags: ["llm", "parameters"]
order: 6
---

**Temperature** controls the **randomness** of the model's output:

- **Low (0 - 0.3)** — focused, deterministic, best for factual/code tasks.
- **Medium (0.4 - 0.7)** — balanced creativity.
- **High (0.8 - 1.5+)** — more creative and varied, but higher chance of nonsense.

A temperature of **0** makes the model (nearly) always pick the most likely next token.

**Max tokens** caps the **length** of the model's response. If the response hits the limit, it is cut off mid-sentence. Set it high enough for a complete answer but low enough to control cost and prevent runaway generation.

> These are the two most commonly tuned parameters. Other useful ones include `top_p` (nucleus sampling) and `stop` sequences.
