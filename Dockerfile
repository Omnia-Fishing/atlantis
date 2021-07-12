FROM runatlantis/atlantis:latest

LABEL maintainer="Steve Neuharth<steve@aethereal.io>"

RUN apk update

# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash && apk add jq

# Install build packages
RUN apk add make && apk add curl && apk add openssh

# Install git
RUN apk add git

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python3 py3-pip
RUN pip3 install awscli 
RUN apk --purge -v del py3-pip
RUN rm /var/cache/apk/*
