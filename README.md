# docker-gitlab
Gitlab CI docker swarm mode setup 

## Prerequisites 

* docker 1.13 +

## Setup

1. Run ``install-gitlab.sh`` and enter gitlab & registry host
2. Wait 'till gitlab is up and running and go to gitlab admin area -> runners section and copy the registration token
3. Run ``install-gitlab-runner.sh`` and enter registration token 

## Support

* Runners are automatically registered/unregistered in gitlab on docker (run/stop) / docker service (create/rm)
* When new worker node spawned -> new runner is created automatically and register within gitlab
