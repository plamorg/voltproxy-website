---
title: "Installation"
---

You can either deploy voltproxy using Docker or install and run it from source.

### Deploy with Docker

Ensure you have Docker and Docker Compose installed.

1. Create voltproxy configuration `config.yml`.

2. Create Docker Compose file `docker-compose.yml`. Example:

```yml
# docker-compose.yml
version: "3.3"

services:
  voltproxy:
    container_name: voltproxy
    build:
      context: .
    restart: unless-stopped
    ports:
      - 80:80
      - 443:443
    volumes:
      - "./_certs:/usr/src/voltproxy/_certs"
      - "./config.yml:/usr/src/voltproxy/config.yml"
      - "/var/run/docker.sock:/var/run/docker.sock:ro"
    networks:
      # If proxying to another Docker container, ensure the containers are on this same network.
      # This is optional if you are not proxying another Docker container.
      - service_net
networks:
  service_net:
    external: true
```

3. Run container with Docker Compose:

```sh
$ docker compose up -d --force-recreate
```

### Build from source

Ensure you have [Go](https://go.dev/doc/install) 1.21 or newer.

1. Clone the repository:

```sh
$ git clone "https://github.com/plamorg/voltproxy.git"
```

2. Build voltproxy:

```sh
$ cd voltproxy/
$ go build
```
