#!/bin/bash
docker rm -f $(docker ps -aq) && docker rmi -f $(docker images -q)

docker build -t mynginximg .

docker-compose up -d







