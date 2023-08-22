---
title: "Getting Started"
---

## What is voltproxy?

voltproxy is a [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) that helps you manage and distribute incoming network traffic to multiple backend servers.
It acts as an intermediary between clients and servers, forwarding requests from clients to the appropriate backend server and returning the server's response to the client.

## Why do I need a reverse proxy?

A reverse proxy is essential for various reasons:

1. **Security**: A reverse proxy can act as a shield between clients and backend servers, providing an additional layer of security.

2. **Load balancing**: A reverse proxy can distribute incoming traffic across multiple backend servers, ensuring optimal resource utilization and preventing any single server from being overwhelmed.

3. **High availability**: By using a reverse proxy, you can set up multiple backend servers and configure failover mechanisms. If one server fails, the reverse proxy can automatically redirect traffic to a healthy server, ensuring uninterrupted service.

Intrigued? Head over to the [installation](installation)!
