#!/bin/bash

docker exec -i mysql mysqldump -d -h localhost -u $DIRECTUS_USER "-p$DIRECTUS_PASSWORD" $DIRECTUS_DATABASE > ./sql/database-schema.sql
