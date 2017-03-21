#!/bin/bash

docker rm -f $(docker ps -a |awk '{print $1;}')

# optionally remove images..
#docker rmi $(docker images |awk '{print $3;}')

rm -rf /srv/docker/mattermost
