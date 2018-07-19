#!/bin/sh

set -e

CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -z

# Give the Squid cache some time to rebuild.
sleep 5

mkdir -p /run/stunnel
"$CHOWN" -R stunnel:stunnel /run/stunnel

# start stunnel in background
stunnel /etc/stunnel/stunnel.conf

# Launch squid
echo "Starting Squid..."
exec "$SQUID" -NYCd 1
