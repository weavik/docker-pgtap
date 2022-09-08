# pgTap Image

This repo builds a PostgreSQL Docker Image that contains PostGIS and pgTap. 

The base image can be found on [Docker Hub](https://hub.docker.com/r/postgis/postgis) with source mirrored on [GitHub](https://github.com/postgis/docker-postgis). 

## Env

These are the environment variables that can be used when launching the Container:

* POSTGRES_DB
* POSTGRES_USER
* POSTGRES_PASSWORD
* PGPORT

### Connecting

```bash
docker exec -it `docker ps | awk '{print $1}' | tail -n 1` psql -U tap -d tap
```
