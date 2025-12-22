# Loki docker image that has the ability to run health checks

In Loki 3.6 the ability to run health checks in the docker container was removed. This image adds
the the ability to run health checks with curl.

## Example docker-compose.yml

```yaml
services:
  loki:
    image: ghcr.io/sanders41/loki-healthcheck:latest
    container_name: loki
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://127.0.0.1:3100/ready"]
      interval: 10s
      retries: 5
      start_period: 30s
      timeout: 10s
    ports:
      - "127.0.0.1:3100:3100"
```

## How To Pull The container

```sh
docker pull ghcr.io/sanders41/loki-healthcheck:latest
```
