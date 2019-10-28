FROM python:2-alpine
MAINTAINER Jesper Jeeninga <jesper.jeeninga@trimm.nl>
RUN apk update && \
  apk upgrade && \
  apk add git gcc musl-dev tzdata --no-cache && \
  cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
  adduser -g "Linkchecker user" -s /bin/sh -D linkchecker && \
  pip install git+https://github.com/moxventura/linkchecker.git && \
  apk del musl-dev gcc git tzdata --purge && \
  rm -rf /var/cache/apk/*
USER linkchecker
WORKDIR /home/linkchecker
