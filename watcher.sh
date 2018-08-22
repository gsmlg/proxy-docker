#!/bin/sh

NGINX=$(/usr/bin/which nginx)

EVENT=$1
DIRECTORY=$2
FILE=$3

case $EVENT in
  c)
    if test $(exec "$NGINX" -t; echo $?) -eq 0
    then
      if test $(ps aux |grep 'master process nginx' |grep -v grep |wc -l) -eq 1
      then
        exec "$NGINX" "-s" "reload"
      else
        exec "$NGINX"
      fi
    fi
    ;;
esac
