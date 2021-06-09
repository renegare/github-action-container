FROM alpine:3.13.5

ENV AWS_CLI_VERSION=1.16.183
ENV AWS_EB_CLI_VERSION=3.15.3
ENV BASH_VERSION=5.1.0-r0
ENV CURL_VERSION=7.76.1-r0
ENV DOCKER_VERSION=20.10.3-r1
ENV GETTEXT_VERSION=0.20
ENV GIT_VERSION=2.30.2-r0
ENV GROFF_VERSION=1.22.4-r1
ENV JQ_VERSION=1.6-r1
ENV KUBECTL_VERION=v1.15.0
ENV LESS_VERSION=563-r0
ENV MAKE_VERSION=4.3-r0
ENV NODEJS_VERSION=14.16.1-r1
ENV OPENSSH_VERSION=8.4_p1-r3
ENV YQ_VERSION=3.4.1-r0

RUN apk --no-cache --update add \
  bash=${BASH_VERSION} \
  yq=${YQ_VERSION}

RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.11/main >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v3.11/community >> /etc/apk/repositories
RUN apk --no-cache --update add \
  nodejs=${NODEJS_VERSION} \
  npm=${NODEJS_VERSION} && \
  npm i -g npm
RUN apk --no-cache --update add \
  make=${MAKE_VERSION} \
  bash=${BASH_VERSION}

RUN apk --no-cache --update add \
  less=${LESS_VERSION} \
  groff=${GROFF_VERSION} \
  jq=${JQ_VERSION} \
  docker~=${DOCKER_VERSION} git~=${GIT_VERSION} \
  openssh~=${OPENSSH_VERSION}


RUN apk --no-cache --update add \
  python3=3.8.10-r0 \
  py3-pip=20.3.4-r0 \
  build-base=0.5-r2 \
  gettext=0.20.2-r2

RUN pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir awscli==1.19.77 && \
  mkdir /root/.aws

# RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERION}/bin/linux/amd64/kubectl && \
#   chmod +x ./kubectl && \
#   mv ./kubectl /usr/bin && \
#   curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator && \
#   chmod +x ./aws-iam-authenticator && \
#   mv ./aws-iam-authenticator /usr/bin && \
#   curl -SsL https://downloads.gauge.org/stable | sh

# RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
#   mv kustomize /usr/bin

RUN printf "\n\n______________________________________________" && \
  printf "\n----------------------------------------------" && \
  printf "\n                INSTALLED VERSIONS            " && \
  printf "\n----------------------------------------------" && \
  printf "\n______________________________________________\n\n" && \
  echo "AWS: `aws --version`" && \
  echo "MAKE: `make -v`" && \
  echo "DOCKER: `docker -v`" && \
  echo "NODE JS: `node -v`" && \
  echo "NPM: `npm -v`"
  # echo "KUBECTL: `kubectl version --client`" && \
  # echo "KUSTOMIZE: `kustomize version`" && \
  # echo "AWS IAM AUTH: `aws-iam-authenticator version`" && \

ENTRYPOINT /bin/bash