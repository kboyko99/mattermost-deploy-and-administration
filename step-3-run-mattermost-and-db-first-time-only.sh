#!/bin/bash

source ./run-mysql.sh

source ./mattermost.conf
mkdir -p /srv/docker/mattermost/mattermost
echo "$MATTERMOSTVERSION" > /srv/docker/mattermost/mattermost/VERSION

FIRST=true
source ./run-mattermost.sh
