# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    flutter
# name:     minddocdev/flutter
# repo:     https://github.com/minddocdev/flutter
# Requires: ubuntu:latest
# authors:  development@minddoc.com
# ------------------------------------------------------
FROM ubuntu:latest

LABEL maintainer="development@minddoc.com"

WORKDIR /

RUN apt-get update && \
    apt-get install -y lcov git-core curl unzip libglu1 && \
    git clone --branch stable --depth=1 https://github.com/flutter/flutter.git && \
    /flutter/bin/flutter doctor && \
    apt-get remove -y curl unzip && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
