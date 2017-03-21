#!/bin/bash

echo 'MATTERMOSTIMAGE="jasl8r/mattermost:latest"' >> mattermost.conf
echo 'MATTERMOSTVERSION="3.5.1"' >> mattermost.conf

source mattermost.conf
docker pull "$MATTERMOSTIMAGE"
