#!/bin/sh

set -e

CHOWN=$(/usr/bin/which chown)
STUNNEL=$(/usr/bin/which stunnel)

# Ensure permissions are set correctly on the Squid cache + log dir.
mkdir -p /run/stunnel
"$CHOWN" -R stunnel:stunnel /run/stunnel

if test "$1" "==" "client"
then
    CONF=/etc/stunnel/stunnel-client.conf
    REMOTE_HOST=${REMOTE_HOST:-proxy}
    sed -i'' "s/REMOTE_HOST/${REMOTE_HOST}/g" "$CONF"
else
    CONF=/etc/stunnel/stunnel.conf
fi

# start stunnel in foreground
echo "Starting Stunnel..."
exec "$STUNNEL" "$CONF"

