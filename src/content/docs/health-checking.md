---
title: "Health Checking"
---

Health checks periodically poll services to ensure they are running properly.
Services without health checks defined are assumed to be perpetually healthy.

Example configuration:

```yaml
services:
  foo:
    redirect: "http://172.0.0.8"
    health:
      path: "/health"
      tls: false
      interval: 5s
      timeout: 300ms
      method: "POST"
```

Properties:

- **path** is appended path to the service's URL that will be queried to determine health (Default: `/`).
- **tls** instructs voltproxy to query the health endpoint using HTTPS (Default: `false`).
- **interval** is the amount of time between health check queries (Default: `30s`).
- **timeout** is the maximum amount of time between a health check and a response until the service is marked as unhealthy (Default: `5s`).
- **method** is the HTTP method used for the health check (Default: `GET`).

Health checking is commonly paired with [load balancing](load-balancing) to facilitate a service failover scheme.
