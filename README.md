# study-redis-multiple

Studying how to provide multiple redis instances to a vapor app.

```
docker run --rm -p 6001:6379 redis
docker run --rm -p 6002:6379 redis
REDIS_1_URL=redis://localhost:6001 REDIS_2_URL=redis://localhost:6002 swift run
```

or

```
export COMPOSE_DOCKER_CLI_BUILD=1 
export DOCKER_BUILDKIT=1 
docker-compose build
docker-compose up
```

And then visit 
- localhost:8080/redis1
- localhost:8080/redis2
