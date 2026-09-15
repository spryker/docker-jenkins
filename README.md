# Jenkins

## Description

Extends official Jenkins image with Docker to be able run jobs inside containers.

* Based on: Official `Jenkins 2.516.3`, `Jenkins 2.555.1` and `Jenkins 2.568.1`
* Included:
    - Docker

> Note: Provided images require additional configuration for development, staging and production use.

## Tags

| Tag     | Jenkins version     | Dockerfile     |
| :------------- | :------------- | :------------- |
| [spryker/jenkins:latest](https://hub.docker.com/r/spryker/jenkins/tags) | 2.568.1 | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.568.1/Dockerfile) |
| [spryker/jenkins:2.568.1](https://hub.docker.com/r/spryker/jenkins/tags) | 2.568.1 | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.568.1/Dockerfile) |
| [spryker/jenkins:2.555.1](https://hub.docker.com/r/spryker/jenkins/tags) | 2.555.1 | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.555.1/Dockerfile) |
| [spryker/jenkins:2.516.3](https://hub.docker.com/r/spryker/jenkins/tags) | 2.516.3 | [:link:](https://github.com/spryker/docker-jenkins/blob/master/2.516.3/Dockerfile) |

## How to use

### Pull image

```bash
$ docker pull spryker/jenkins:2.568.1
```

### Dockerfile

```dockerfile
FROM spryker/jenkins:2.568.1
```

### docker-compose.yml

```yaml
jenkins:
    image: spryker/jenkins:2.568.1
```

## How to run docker container by Jenkins job

### Get proper group ID

- Linux: `export DOCKER_GID=$(ls -n /var/run/docker.sock | awk '{print $4}')`
- MacOS, Windows: `export DOCKER_GID=0`

### Running with `docker`

`docker run -it --rm --group-add ${DOCKER_GID} -v /var/run/docker.sock:/var/run/docker.sock:ro spryker/jenkins:2.568.1`

### Running with `docker-compose`

```yaml
jenkins:
    image: spryker/jenkins:2.568.1
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
