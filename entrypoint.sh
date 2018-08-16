#!/bin/sh

set -e

CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)

if test "$PROXY_MODE" "==" "master"
then

echo Proxy Mode is $PROXY_MODE, squid start
# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -z

# Give the Squid cache some time to rebuild.
WAIT_TIME=${SQUID_WAIT:-5}
sleep 5

# Launch squid
echo "Starting Squid..."
exec "$SQUID" -NYCd 1

else
echo Proxy Mode is $PROXY_MODE, do nothing
while true
do
    sleep 86400
done
fi
