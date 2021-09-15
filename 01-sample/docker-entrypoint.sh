#!/bin/bash

# This will install the product
/opt/radiantone/run.sh

if [ $? == 0 ]; then
  echo "Startup complete"
else
  echo "Failed to start"
fi

# Custom commands
echo "Wating for FID to start..."

while ! nc -z localhost 2389; do
  sleep 5
done

echo "FID started"

cluster.sh list

echo "CURRENT_BUILDID: $CURRENT_BUILDID"

# If CURRENT_BUILDID is blank then it is a fresh install
if [ "$CURRENT_BUILDID" == "" ]; then
  echo "Placeholder for custom commands"
fi

tail -f /opt/radiantone/vds/vds_server/logs/vds_server_access.log

