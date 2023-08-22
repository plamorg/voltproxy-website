---
title: "Authelia Integration Guide"
---

> Authelia is an open-source authentication and authorization server and portal

- [Authelia](https://www.authelia.com/)

Authelia can be integrated using the [Auth Forward](auth-forward) middleware.

Here is an example configuration:

```yaml
services:
  my-authelia-service:
    host: auth.example.com
    tls: true
    redirect: "http://172.22.0.2:9091"

  protected-service:
    host: protected.example.com
    tls: true
    redirect: "http://localhost:3000"
    middlewares:
      authForward:
        address: "https://auth.example.com/api/verify?rd=https://auth.example.com"
        responseHeaders:
          ["Remote-User", "Remote-Groups", "Remote-Name", "Remote-Email"]
        xForwarded: true
```

## Protecting multiple services

Protecting multiple services is simply a matter of specifying the same `authForward` configuration multiple times;
however, this can quickly get repetitive.
To avoid repetition, we can use YAML anchors and aliases.
This allows us to specify the Authelia `authForward` configuration once and repeat it elsewhere.

Example:

```yaml
services:
  foo:
    host: example.com
    redirect: "http://172.0.0.20:8080"
    middlewares:
      authForward: &customAuth # YAML anchor.
        address: "https://auth.example.com/api/verify?rd=https://auth.example.com"
        responseHeaders:
          ["Remote-User", "Remote-Groups", "Remote-Name", "Remote-Email"]
        xForwarded: true

  bar:
    host: bar.example.com
    redirect: "http://172.0.0.20:3000"
    middlewares:
      authForward: *customAuth # YAML alias

  baz:
    host: bar.example.com
    redirect: "http://172.0.0.20:5173"
    middlewares:
      authForward: *customAuth # YAML alias
```

In this example, all three of the services are protected using the same `authForward` configuration.
