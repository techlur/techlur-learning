---
question: "What is overfitting?"
section: "ai"
difficulty: "medium"
tags: ["ml", "fundamentals"]
order: 13
---

**Overfitting** happens when a model **memorizes the training data** -- including its noise and quirks -- instead of learning the general underlying pattern. It performs great on training data but poorly on new, unseen data.

**Analogy:** a student who memorizes past exam answers word-for-word but can't solve a slightly different question.

**Signs of overfitting:**

- High accuracy on training data, significantly lower on validation/test data.
- The model is too complex relative to the amount of training data.

**How to mitigate:**

- **More data** — larger datasets make it harder to memorize.
- **Simpler model** — reduce the number of parameters or layers.
- **Regularization** — techniques like L1/L2 penalties or dropout discourage the model from relying on any single feature too heavily.
- **Validation split** — always evaluate on a held-out test set the model hasn't seen.
- **Early stopping** — stop training when validation performance stops improving.
- **Data augmentation** — create variations of existing training samples.

> The opposite problem is **underfitting** — the model is too simple to capture the pattern and performs poorly on both training and test data.
