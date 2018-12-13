FROM alpine:3.8
MAINTAINER MindDoc <development@minddoc.com>

LABEL org.label-schema.vendor="MindDoc" \
      org.label-schema.name="Alpine linux image for Flutter test projects" \
      org.label-schema.license="MIT" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/minddocdev/flutter-lcov"

ARG branch=stable

WORKDIR /

RUN apk add --update --no-cache \
 build-base \
 git \
 lcov \
 curl \
 libglu1
RUN git clone --branch $branch --depth=1 https://github.com/flutter/flutter.git
RUN /flutter/bin/flutter doctor
    
ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
