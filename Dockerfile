FROM python:2-alpine
MAINTAINER Jesper Jeeninga <jesper.jeeninga@trimm.nl>
RUN apk update && \
	apk upgrade && \
	apk add git gcc musl-dev --no-cache && \
	adduser -g "Linkchecker user" -s /bin/sh -D linkchecker && \
	pip install git+https://github.com/linkcheck/linkchecker.git && \
	apk del musl-dev gcc git --purge && \
	rm -rf /var/cache/apk/*
USER linkchecker
WORKDIR /home/linkchecker
ENTRYPOINT ["linkchecker"]