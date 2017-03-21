#!/bin/bash

echo 'MATTERMOSTIMAGE="mattermost"' >> mattermost.conf
echo 'MATTERMOSTVERSION="3.6.2"' >> mattermost.conf

source mattermost.conf
  
# version 3.6.2
git clone https://github.com/funkyfuture/docker-mattermost.git
cd docker-mattermost 
git checkout update_to_3.6.2 
git pull 
docker build -t "$MATTERMOSTIMAGE" .

