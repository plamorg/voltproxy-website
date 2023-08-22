---
title: "Additional Configuration"
---

In addition to service routing, you can also configure voltproxy's meta behavior.

## Structured Logging

```yaml
services:
  # ...

log:
  level: "info"
  handler: "text"
```

Properties:

- **level** controls the verbosity of voltproxy's structured logging (Default: `info`).
  It can be `debug`, `info`, `warn`, or `error` (increasing levels of verbosity).
- **handler** controls the output logging format (Default: `text`).
  It can also be `json`.

**Tip**: using the JSON handler, you can pipe voltproxy's log output to a tool like [**jq**](https://github.com/jqlang/jq) for prettier logging.

## Read Timeout

```yaml
services:
  # ...

readTimeout: 0s
```

- **readTimeout** is the number of seconds until the reverse proxy server times out (Default: `0s`).
