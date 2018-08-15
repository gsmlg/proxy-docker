FROM alpine:3.8

MAINTAINER GSMLG < me@gsmlg.org >

ENV SQUID_WAIT=5

RUN apk update \
    && apk add curl \
    && apk add squid \
    && rm -rf /var/cache/apk/*

EXPOSE 3128

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
