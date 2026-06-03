---
question: "What does module.exports vs require do, and how does ESM differ?"
section: "backend"
difficulty: "easy"
tags: ["nodejs", "modules"]
order: 14
---

Node.js has two module systems: **CommonJS (CJS)** and **ES Modules (ESM)**.

**CommonJS (the original Node.js way):**

- `module.exports` — defines what a file exports.
- `require()` — imports a module synchronously.

```js
// math.js
module.exports = { add: (a, b) => a + b };

// app.js
const math = require('./math');
console.log(math.add(2, 3)); // 5
```

**ES Modules (the modern standard):**

- `export` / `export default` — defines exports.
- `import` — imports a module. Statically analyzed and asynchronous.

```js
// math.mjs
export const add = (a, b) => a + b;

// app.mjs
import { add } from './math.mjs';
console.log(add(2, 3)); // 5
```

**Key differences:**

| | CommonJS | ES Modules |
|---|---|---|
| **Syntax** | `require()` / `module.exports` | `import` / `export` |
| **Loading** | Synchronous | Asynchronous |
| **Parsing** | Dynamic (can require conditionally) | Static (imports hoisted to top) |
| **Tree-shaking** | Not possible | Supported (bundlers remove unused exports) |
| **File extension** | `.js` (default) | `.mjs` or `.js` with `"type": "module"` in `package.json` |

> **Tip:** To use ESM in Node.js, either name your files `.mjs` or add `"type": "module"` to your `package.json`. Most modern frameworks (including NestJS and Astro) use ESM by default.
