# Kilta CMS

## Quick Start

Copy `.env.sample` into `.env`, and setup your secrets. Source the env variables, and run

```bash
# Start mysql
docker run -e MYSQL_ROOT_PASSWORD=$DIRECTUS_ROOT_PASSWORD -e MYSQL_DATABASE=$DIRECTUS_DATABASE -e MYSQL_USER=$DIRECTUS_USER \
          -e MYSQL_PASSWORD=$DIRECTUS_PASSWORD --name mysql -d mysql:5.5

# Initialize database
docker exec -i mysql mysql -uroot "-p$DIRECTUS_ROOT_PASSWORD" $DIRECTUS_DATABASE < ./sql/initialize-database.sql

# Start directus
docker run --link mysql:mysql -p 8080:8080 --name directus -d getdirectus/directus:6.3

# Start Redis
docker run --name kilta-redis -p 6379:6379 -d redis:3.2.8

# Start web backend
npm start
```

## Directus Login Credentials

Default credentials are
- Email: **admin@admin.com**
- password: **admin**

## Dump database

```bash
docker exec -i mysql mysqldump -h localhost -u $DIRECTUS_USER "-p$DIRECTUS_PASSWORD" $DIRECTUS_DATABASE > ./sql/database-dump.sql
```
