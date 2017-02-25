# Kilta CMS

## Quick Start
```bash
# Start mysql
docker run -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=$DIRECTUS_DATABASE -e MYSQL_USER=$DIRECTUS_USER \
          -e MYSQL_PASSWORD=$DIRECTUS_PASSWORD --name mysql -d mysql:5.5

# Start directus
docker run --link mysql:mysql -p 8080:8080 --name directus -d getdirectus/directus:6.3
```

## Directus Login Credentials

- Email: **admin@admin.com**
- password: **admin**
