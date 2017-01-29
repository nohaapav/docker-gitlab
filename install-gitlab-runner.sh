#!/bin/bash

echo "Enter gitlab runner registration token:"
read gitlab_runner_token

export GITLAB_RUNNER_TOKEN=${gitlab_runner_token}

docker stack deploy -c stack/gitlab-runner-stack.yml ci
