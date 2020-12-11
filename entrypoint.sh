#!/bin/sh

set -e

NGINX=$(/usr/bin/which nginx)

# Launch squid
echo "Starting Nginx..."
"$NGINX"

