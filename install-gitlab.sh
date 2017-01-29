#!/bin/bash

echo "Enter gitlab url:"
read gitlab_url
echo "Enter registry url:"
read registry_url

export GITLAB_URL=${gitlab_url}
export REGISTRY_URL=${registry_url} 

docker stack deploy -c stack/gitlab-stack.yml ci
