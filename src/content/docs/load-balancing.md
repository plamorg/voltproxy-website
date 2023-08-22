---
title: "Load Balancing"
---

> Load balancing refers to efficiently distributing incoming network traffic across a group of backend servers, also known as a server farm or server pool.

- [NGINX](https://www.nginx.com/resources/glossary/load-balancing/#:~:text=Load%20balancing%20refers%20to%20efficiently,server%20farm%20or%20server%20pool.)

Example configuration:

```yaml
services:
  myLoadBalancer:
    host: lb.example.com
      persistent: true
      strategy: random
      serviceNames: ["server1", "server2"]
  server1:
    redirect: "http://172.30.0.4:3000"
  server2:
    redirect: "http://172.24.0.2:8080"
```

Properties:

- **persistent** enables session persistence (Default: `false`).

  When a client connects to `lb.example.com`, voltproxy sets an HTTP cookie that stores the index of the server to which they connected.
  The next time the client connects to `lb.example.com`, they will be directed to the same service.

- **strategy** defines the service selection strategy (Default: `roundRobin`).

- **serviceNames** indicates the servers in the server pool (Default: `[]`).

## Selection Strategies

All strategies respect [health checks](health-checking).

- **roundRobin**: selects healthy services in a cyclic manner.
- **failover**: selects the first service in the pool that is healthy.
- **random**: selects a random healthy server from the pool.
