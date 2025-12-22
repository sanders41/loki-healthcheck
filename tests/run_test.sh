docker compose down
docker compose up -d

if ! docker compose exec loki curl -f http://127.0.0.1:3100/ready; then
  docker compose down
  exit 1
fi

docker compose down
