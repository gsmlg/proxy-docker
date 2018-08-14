FROM alpine:3.8

MAINTAINER GSMLG < me@gsmlg.org >

RUN apk update \
    && apk add nginx \
    && apk add nginx-mod-http-headers-more \
    && mkdir /etc/nginx/sites \
    && touch /etc/nginx/ssl.conf \
    && rm /etc/nginx/conf.d/default.conf \
    && rm -rf /var/cache/apk/*


EXPOSE 80 443

COPY nginx.conf /etc/nginx/

COPY default /etc/nginx/sites/

COPY watcher.sh entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
