---
question: "How does HTTPS keep data secure?"
section: "general"
difficulty: "medium"
tags: ["security", "networking"]
order: 6
---

**HTTPS = HTTP + TLS** (Transport Layer Security). It wraps normal HTTP traffic in an encrypted tunnel.

**How the TLS handshake works (simplified):**

1. **Client Hello** — browser sends supported cipher suites and a random number.
2. **Server Hello** — server picks a cipher suite and sends its **SSL/TLS certificate** (containing its public key).
3. **Certificate verification** — the browser checks the certificate is signed by a trusted Certificate Authority (CA).
4. **Key exchange** — using **asymmetric cryptography** (e.g., RSA or ECDHE), both sides agree on a shared secret.
5. **Symmetric encryption** — all subsequent data is encrypted with a fast **symmetric cipher** (e.g., AES) using the shared secret.

**What HTTPS provides:**

- **Encryption** — an eavesdropper on the network can't read the data.
- **Integrity** — data can't be tampered with in transit without detection.
- **Authentication** — the certificate proves you're talking to the real server, not an imposter.

> HTTPS does **not** hide which domain you're visiting (the SNI in the handshake is visible), and it doesn't protect against vulnerabilities in the application itself (like XSS or SQL injection).
