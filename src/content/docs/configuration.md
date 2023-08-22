---
title: "Configuration"
---

One of voltproxy's core features is that configuration is done from **one** file.

Configuration in voltproxy is done in YAML format from a file named `config.yml`.
Here is an example configuration file that proxies two services, **foo** and **bar**:

```yaml
services:
  foo:
    host: foo.plam.dev
    redirect: "http://192.168.0.1:3000"
  bar:
    host: bar.plam.dev
    tls: true
    container:
      name: "/bar"
      network: "bar_default"
      port: 8080
```

**foo** and **bar** are service names.
Service names must be unique.

**redirect** and **container** are service types.
Each service can have a maximum on one service type.

**tls** instructs voltproxy to proxy the service over HTTPS.
If **tls** is unspecified or false, the service will be hosted over HTTP.

With this configuration:

- Incoming requests to `http://foo.plam.dev` would get directed to `http://192.168.0.1:3000` on the server.
- Incoming requests to `https://bar.plam.dev` would get directed to a Docker container with name `\bar` on the network `bar_default` through port `8080`.
