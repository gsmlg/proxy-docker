FROM alpine

MAINTAINER GSMLG < me@gsmlg.org >

RUN apk update \
    && apk add curl \
    && apk add stunnel \
    && apk add squid \
    && rm -rf /var/cache/apk/*

COPY stunnel.conf pkey.pem cert.pem /etc/stunnel/

EXPOSE 443

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
