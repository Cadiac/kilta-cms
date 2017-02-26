#!/bin/bash

docker exec -i mysql mysql -uroot "-p$DIRECTUS_ROOT_PASSWORD" $DIRECTUS_DATABASE < ./sql/initialize-database.sql
