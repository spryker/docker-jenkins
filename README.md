# Jenkins

## Description

Extends official Jenkins image with Docker to be able run jobs inside containers.

* Based on: Official `Jenkins 2.176.1`, `Jenkins 2.305` and `Jenkins 2.324`
* Included:
    - Docker

> Note: Provided images require additional configuration for development, staging and production use.  

## Reverse Proxy
The provided nginx image is used as reverse proxy to block the access to these sensitive urls : 
- asynchPeople
- cli
- credential-store
- injectedEnvVars
- jnlpJars
- quietDown
- restart
- script
- systemInfo
- user/jenkins

It should be called in the same docker-compose as Jenkins. Jenkins' container must be named : ```jenkins_scheduler```

## Tags

| Tag     | Jenkins version     | Details     | Dockerfile     |
| :------------- | :------------- | :------------- | :------------- |
| [spryker/jenkins:latest](https://hub.docker.com/r/spryker/jenkins/tags) | 2.176.1 | [![](https://images.microbadger.com/badges/image/spryker/jenkins:latest.svg)](https://microbadger.com/images/spryker/jenkins:latest "Get your own image badge on microbadger.com") | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.176/Dockerfile) |
| [spryker/jenkins:2.176](https://hub.docker.com/r/spryker/jenkins/tags)  | 2.176.1 | [![](https://images.microbadger.com/badges/image/spryker/jenkins:2.176.svg)](https://microbadger.com/images/spryker/jenkins:2.176 "Get your own image badge on microbadger.com") | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.176/Dockerfile) |
| [spryker/jenkins:2.305](https://hub.docker.com/r/spryker/jenkins/tags)  | 2.305 | [![](https://images.microbadger.com/badges/image/spryker/jenkins:2.304.svg)](https://microbadger.com/images/spryker/jenkins:2.305 "Get your own image badge on microbadger.com") | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.305/Dockerfile) |
| [spryker/jenkins:2.324](https://hub.docker.com/r/spryker/jenkins/tags)  | 2.324 | [![](https://images.microbadger.com/badges/image/spryker/jenkins:2.324.svg)](https://microbadger.com/images/spryker/jenkins:2.324 "Get your own image badge on microbadger.com") | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.324/Dockerfile) |

## How to use

### Pull image

```bash
$ docker pull spryker/jenkins:2.176
```

### Dockerfile

```dockerfile
FROM spryker/jenkins:2.176
```

### docker-compose.yml

```yaml
jenkins:
    image: spryker/jenkins:2.176
```

## How to run docker container by Jenkins job

### Get proper group ID

- Linux: `export DOCKER_GID=$(ls -n /var/run/docker.sock | awk '{print $4}')`
- MacOS, Windows: `export DOCKER_GID=0`

### Running with `docker`

`docker run -it --rm --group-add ${DOCKER_GID} -v /var/run/docker.sock:/var/run/docker.sock:ro spryker/jenkins:2.176`

### Running with `docker-compose`

```yaml
jenkins:
    image: spryker/jenkins:2.176
    user: "1000:${DOCKER_GID}"
    volumes:
        - /var/run/docker.sock:/var/run/docker.sock:ro
```

### Job definition example

```xml
...
    <builders>
        <hudson.tasks.Shell>
            <command>
                docker run -i --rm \
                my-image \
                command-to-run
            </command>
        </hudson.tasks.Shell>
    </builders>
...
```

## More information

* [Jenkins official images](https://github.com/jenkinsci/docker)
