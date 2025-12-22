docker compose down
docker compose up -d

ready=0
for _ in {1..30}; do
  if docker compose exec loki curl -fsS http://127.0.0.1:3100/ready; then
    ready=1
    break
  fi
  sleep 1
done

docker compose down

if [ "$ready" -ne 1 ]; then
  exit 1
fi
