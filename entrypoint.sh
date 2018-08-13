#!/bin/sh

set -e

MKDIR=$(/usr/bin/which mkdir)
CHOWN=$(/usr/bin/which chown)
NGINX=$(/usr/bin/which nginx)

# Ensure permissions are set correctly on the Squid cache + log dir.
# "$CHOWN" -R www:www /var/cache/squid
# "$CHOWN" -R www:www /var/log/nginx

# Launch squid
echo "Starting Nginx..."
exec "$NGINX"

echo "Watching Sites files change"
inotifyd /watcher.sh /etc/nginx/sites
