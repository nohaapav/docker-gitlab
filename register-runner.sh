#!/bin/bash

echo "Enter url:"
read url
echo "Enter token:"
read token

docker exec -it gitlab-runner gitlab-runner register -n \
  --url $url \
  --registration-token $token \
  --executor docker \
  --description "Docker Runner" \
  --docker-image "docker:latest" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock
