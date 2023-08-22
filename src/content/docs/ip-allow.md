---
title: "IP Allow Middleware"
---

The `ipAllow` middleware restricts access to a service based on request's origin IP.

```yaml
services:
  service:
    host: example.com
    redirect: "http://192.168.0.3"
    middlewares:
      ipAllow:
        - 172.0.0.1
        - 10.9.0.0/24 # CIDR notation
        - 192.168.1.7
```

`ipAllow` accepts a list of IPs.
Each IP can optionally be written in [CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) to represent ranges of IPs to accept.

If a request's origin IP is not in the list, they will be sent a `403` **StatusForbidden** status code.
