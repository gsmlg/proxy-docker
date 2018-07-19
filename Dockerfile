FROM alpine

MAINTAINER GSMLG < me@gsmlg.org >

RUN apk update \
    && apk add curl \
    && apk add stunnel \
    && apk add squid \
    && rm -rf /var/cache/apk/*

COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY pkey.pem /etc/stunnel/pkey.pem
COPY cert.pem /etc/stunnel/cert.pem

EXPOSE 443

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
