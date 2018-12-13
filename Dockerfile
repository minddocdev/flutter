# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    flutter-lcov
# tag:      latest
# name:     minddocdev/flutter-lcov
# repo:     https://github.com/minddocdev/flutter-lcov
# how-to:   docker build -t minddocdev/flutter-lcov .
# Requires: alpine:3.8
# authors:  development@minddoc.com
# ------------------------------------------------------

FROM alpine:3.8
LABEL maintainer="dblancoit@gmail.com"
ARG branch=stable

WORKDIR /

RUN apk update && \
    apk add --no-cache git lcov curl unzip libglu1 && \
    git clone --branch $branch --depth=1 https://github.com/flutter/flutter.git && \
    /flutter/bin/flutter doctor
    
ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
