# docker-gitlab
Gitlab CI docker swarm mode setup 

## Prerequisites 

* docker 1.13 +

## Setup

1. Run ``install-gitlab.sh`` and enter gitlab & registry host
2. Wait 'till gitlab is up and running and go to gitlab admin area -> runners section and copy the registration token
2. Run ``install-gitlab-runner.sh`` and enter registration token 

## Configuration
### Maven

#### Repository cache

To cache maven repository update ``config.toml`` [[runners.docker]] section and put ``root/.m2`` into existing volumes e.g. ``volumes = ["/cache","/root/m2:/root/.m2"]``

### Swarm

#### Deployment

To setup deployment copy appropriate manager machine certificates to machine hosting gitlab-runner and then setup the volumes e.g. ``volumes = ["/cache","/home/swarm/certs:/home/swarm/certs"]`` . Then setup MANAGER_CERTS_PATH variable pointing to this location to tell runner where to find certificates. Manager node ip must be specified as well in MANAGER_IP variable.

## Troubleshooting
### Runner

#### Extra hosts

If you see one of following errors while cloning repository:

```{r, engine='bash', count_lines}
fatal: unable to access 'http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@host:9090/user/repository.git/': Couldn't resolve host 'host'
```
or
```{r, engine='bash', count_lines}
fatal: unable to access 'http://gitlab-ci-token:xxxxxxxxxxxxxxxxxxxx@host.com:9090/user/repository.git/': Failed to connect to host.com port 9090: Operation timed out
```
update ``config.toml`` [[runners.docker]] section with ``extra_hosts = ["host:192.168.99.100"]`` pointing to your gitlab host address.

#### Priviledged

If you're using dind as service and getting following warning:

```{r, engine='bash', count_lines}
*** WARNING: Service runner-7f246700-project-1-concurrent-0-docker probably didn't start properly.

API error (500): Cannot link to a non running container: /runner-7f246700-project-1-concurrent-0-docker AS /runner-7f246700-project-1-concurrent-0-docker-wait-for-service/runner-7f246700-project-1-concurrent-0-docker

2016-09-25T13:29:15.279179478Z mount: permission denied (are you root?)
2016-09-25T13:29:15.281400597Z Could not mount /sys/kernel/security.
2016-09-25T13:29:15.281462451Z AppArmor detection and --privileged mode might break.
2016-09-25T13:29:15.294317096Z mount: permission denied (are you root?)
```
make sure that you have set ``privileged = true`` in ``config.toml`` [[runners.docker]] section.
