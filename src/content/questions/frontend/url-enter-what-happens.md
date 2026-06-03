---
question: "What happens when you type a URL and press Enter?"
section: "frontend"
difficulty: "hard"
tags: ["browser", "networking"]
order: 13
---

This classic question covers the full lifecycle of a web request:

1. **URL parsing** — the browser parses the URL into protocol, host, port, and path.

2. **DNS resolution** — the browser checks its cache, then the OS cache, then queries DNS servers to resolve the domain name to an IP address.

3. **TCP connection** — a TCP three-way handshake (SYN, SYN-ACK, ACK) establishes a connection with the server.

4. **TLS handshake** (HTTPS) — client and server negotiate encryption, exchange certificates, and establish a secure session.

5. **HTTP request** — the browser sends the HTTP request (method, headers, cookies) to the server.

6. **Server processing** — the server routes the request, runs application logic, queries databases if needed, and builds a response.

7. **HTTP response** — the server sends back a status code, headers, and the response body (HTML).

8. **HTML parsing** — the browser parses HTML into the **DOM** tree. When it encounters CSS, it builds the **CSSOM** tree. Scripts may block parsing unless marked `async` or `defer`.

9. **Render tree** — the DOM and CSSOM are combined into a render tree (only visible elements).

10. **Layout** — the browser calculates the exact position and size of every element.

11. **Paint** — pixels are drawn to the screen, layer by layer.

12. **Compositing** — layers are combined in the correct order and sent to the GPU for display.

> This is a great question to show breadth of knowledge. Interviewers don't expect every detail — focus on the areas you know best.
