#!/bin/sh

NGINX=$(/usr/bin/which nginx)

EVENT=$1
DIRECTORY=$2
FILE=$3

case $EVENT in
  c)
    if test $("$NGINX" -t; echo $?) -eq 0
    then
      if test $(ps aux |grep nginx |grep 'master process' |grep -v grep |wc -l) -eq 1
      then
        echo "nginx reload ..."
        "$NGINX" "-s" "reload"
      else
        echo "nginx start ..."
        "$NGINX"
      fi
    fi
    ;;
esac
