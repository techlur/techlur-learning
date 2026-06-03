---
question: "What is an AI agent / tool calling?"
section: "ai"
difficulty: "medium"
tags: ["llm", "agents", "tools"]
order: 11
---

**Tool calling** (also called function calling) lets a model output a **structured request** to invoke a function you define, rather than just returning text.

```text
User: "What's the weather in Tokyo?"
Model output: { "tool": "get_weather", "args": { "city": "Tokyo" } }
Your code: calls the real weather API, returns result to the model
Model: "It's 22C and sunny in Tokyo."
```

The model decides **what** to call and with which arguments. Your code controls **whether** the call actually happens and how the result is handled.

**An AI agent** takes this further by running in a **loop**:

1. Receive a goal.
2. Decide the next action (tool call, ask user, or respond).
3. Execute the action, observe the result.
4. Repeat until the goal is achieved or a stop condition is met.

**Key principles:**

- The model **proposes** actions; your code **executes** them.
- Always validate and sanitize tool inputs before execution.
- Set maximum iteration limits to prevent infinite loops.
- Log every step for observability and debugging.

> Agents are powerful but unpredictable. Start with simple, well-scoped tools and expand gradually.
