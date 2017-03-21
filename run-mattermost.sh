#!/bin/bash

source ./mattermost.secrets
source ./mattermost.conf

[ "$FIRST" = "true" ] && cmd="/sbin/entrypoint.sh app:start"
[ -z "$FIRST" ] && cmd="./bin/platform --config /opt/mattermost/config/config.json"
echo "mattermost command: $cmd"

docker run --name mattermost -d  --link mattermost-mysql:mysql --publish 80:80 --publish 443:443 \
  --env "MATTERMOST_EMAIL=$MATTERMOST_EMAIL" --env "SMTP_SECURITY=$SMTP_SECURITY" --env "SMTP_HOST=$SMTP_HOST" --env "SMTP_PORT=$SMTP_PORT" \
  --env "SMTP_USER=$SMTP_USER" --env "SMTP_PASS=$SMTP_PASS" \
  --env "MATTERMOST_SECRET_KEY=$SECRET_KEY" --env "MATTERMOST_LINK_SALT=$LINK_SALT" --env "MATTERMOST_RESET_SALT=$RESET_SALT"  --env "MATTERMOST_INVITE_SALT=$INVITE_SALT" \
  --volume "/srv/docker/mattermost/config:/opt/mattermost/config" --volume "/srv/docker/mattermost/mattermost:/opt/mattermost/data" \
  --volume "/srv/docker/mattermost/logs:/var/log/mattermost/" \
  "$MATTERMOSTIMAGE" $cmd

#debug
docker ps -a
