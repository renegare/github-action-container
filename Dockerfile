FROM alpine:3.13.5

ENV AWS_CLI_VERSION=1.16.183
ENV AWS_EB_CLI_VERSION=3.15.3
ENV DOCKER_VERSION=19
ENV GETTEXT_VERSION=0.20
ENV GIT_VERSION=2
ENV KUBECTL_VERION=v1.15.0
ENV MAKE_VERSION=4.2
ENV SSH_VERSION=8.1
ENV BASH_VERSION=5.1.0-r0
ENV YQ_VERSION=3.4.1-r0

RUN apk --no-cache --update add \
  bash=${BASH_VERSION} \
  yq=${YQ_VERSION}

ENV NODEJS=12.22.1-r0
RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.13/main >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.13/community >> /etc/apk/repositories
RUN apk add --no-cache --update nodejs=${NODEJS} npm=${NODEJS}


# RUN apk --no-cache --update add make~=${MAKE_VERSION} bash curl less groff jq \
#   python py-pip build-base docker~=${DOCKER_VERSION} git~=${GIT_VERSION} \
#   openssh~=${SSH_VERSION} \
#   gettext~=${GETTEXT_VERSION} && \
#   pip install --no-cache-dir --upgrade pip && \
#   pip install --no-cache-dir awscli==${AWS_CLI_VERSION} && \
#   pip install --no-cache-dir awsebcli==${AWS_EB_CLI_VERSION} && \
#   mkdir /root/.aws && \
#   curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERION}/bin/linux/amd64/kubectl && \
#   chmod +x ./kubectl && \
#   mv ./kubectl /usr/bin && \
#   curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator && \
#   chmod +x ./aws-iam-authenticator && \
#   mv ./aws-iam-authenticator /usr/bin && \
#   curl -SsL https://downloads.gauge.org/stable | sh

# RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
#   mv kustomize /usr/bin

# RUN printf "\n\n______________________________________________" && \
#   printf "\n----------------------------------------------" && \
#   printf "\n                INSTALLED VERSIONS            " && \
#   printf "\n----------------------------------------------" && \
#   printf "\n______________________________________________\n\n" && \
#   echo "AWS: `aws --version`" && \
#   echo "AWS EB: `eb --version`" && \
#   echo "MAKE: `make -v`" && \
#   echo "DOCKER: `docker -v`" && \
#   echo "NODE JS: `node -v`" && \
#   echo "NPM: `npm -v`" && \
#   echo "KUBECTL: `kubectl version --client`" && \
#   echo "KUSTOMIZE: `kustomize version`" && \
#   echo "ENVSUBT: `envsubst --version`" && \
#   echo "AWS IAM AUTH: `aws-iam-authenticator version`" && \
#   echo "GAUGE: `gauge version`"

ENTRYPOINT /bin/bash