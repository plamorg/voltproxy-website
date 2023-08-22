---
title: "Auth Forward Middleware"
---

The `authForward` middleware forwards certain headers to and from an external authentication service.
Requests are forwarded if and only if the authentication service responds with a `2xx` status code.

Example configuration:

```yaml
services:
  secureService:
    host: private.example.com
    redirect: "http://172.1.2.3:1234"
    middlewares:
      authForward:
        address: "https://auth.example.com"
        requestHeaders: ["Some-Header"]
        responseHeaders: ["Remote-User", "Remote-Email"]
        xForwarded: true
```

Properties:

- **address** is the URL of the authentication server.
- **requestHeaders** are the headers to forward from the incoming request to the authentication server.
  If unspecified, all headers will be forwarded to the authentication server.
- **responseHeaders** are the headers to forward from the authentication server to the end service.
- **xForwarded** instructs voltproxy to forward `X-Forwarded-*` headers to the authentication server.
  These headers are: X-Forwarded-For, X-Forwarded-Method, X-Forwarded-Proto, X-Forwarded-Host, and X-Forwarded-Uri.

See the [Authelia integration guide](authelia) to see how to use `authForward` with [Authelia](https://www.authelia.com/).
