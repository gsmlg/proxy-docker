#!/bin/sh

set -e

MKDIR=$(/usr/bin/which mkdir)
CHOWN=$(/usr/bin/which chown)
NGINX=$(/usr/bin/which nginx)

# Ensure permissions are set correctly on the Squid cache + log dir.
# "$CHOWN" -R www:www /var/cache/squid
# "$CHOWN" -R www:www /var/log/nginx
"$MKDIR" -p /run/nginx

# Launch squid
echo "Starting Squid..."
exec "$NGINX" "-g" "daemon off;"
