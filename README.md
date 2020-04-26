# github-action-container

For personal Use. Creates an nodejs aplpine  container with the following tools:

```
FROM node:12-alpine3.11
ENV AWS_CLI_VERSION=1.16.183
ENV AWS_EB_CLI_VERSION=3.15.3
ENV DOCKER_VERSION=19
ENV GETTEXT_VERSION=0.20
ENV GIT_VERSION=2
ENV KUBECTL_VERION=v1.15.0
ENV MAKE_VERSION=4.2
ENV SSH_VERSION=8.1
```

Also contains the `kustomize` tool for building and managing kubernetes manifests.

If you would like to use this container just run the following:

```
docker pull renegare/github-actions-container
```