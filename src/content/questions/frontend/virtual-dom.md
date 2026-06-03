---
question: "What is the Virtual DOM and how does React use it?"
section: "frontend"
difficulty: "medium"
tags: ["react", "rendering"]
order: 2
---

The Virtual DOM is a lightweight in-memory copy of the UI. On a state change, React builds a new tree, **diffs** it against the old one (reconciliation), and updates only the changed real-DOM nodes — far cheaper than re-rendering everything.
