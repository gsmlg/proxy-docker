FROM alpine:3.8

MAINTAINER GSMLG < me@gsmlg.org >

RUN apk update \
    && apk add curl \
    && apk add stunnel \
    && rm -rf /var/cache/apk/*

COPY stunnel.conf stunnel-client.conf pkey.pem cert.pem /etc/stunnel/

EXPOSE 80 443

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
