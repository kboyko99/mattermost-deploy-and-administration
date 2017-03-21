#!/bin/bash

source ./mattermost.secrets
source ./mattermost.conf

docker run --name mattermost-mysql -d  \
   --env "MYSQL_USER=mattermost" --env "MYSQL_PASSWORD=${MYSQL_MM_PASS}" --env 'MYSQL_DATABASE=mattermost' --env "MYSQL_ROOT_PASSWORD=${MYSQL_MM_ROOTPASS}" \
   --volume /srv/docker/mattermost/mysql:/var/lib/mysql \
   mysql:latest
