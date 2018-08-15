FROM alpine:3.8

MAINTAINER GSMLG < me@gsmlg.org >

ENV SERVER_MODE=master \
    SERVER_URL="" \
    PRIVATE_KEY=/etc/stunnel/pkey.pem \
    CERTIFICATE=/etc/stunnel/cert.pem

RUN apk update \
    && apk add curl \
    && apk add stunnel \
    && rm -rf /var/cache/apk/*

COPY pkey.pem cert.pem /etc/stunnel/

EXPOSE 80 443

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
