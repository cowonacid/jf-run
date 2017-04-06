FROM alpine:latest

RUN apk update

RUN apk add bash

COPY entrypoint.sh /groovy.sh

COPY entrypoint.sh /bash.sh