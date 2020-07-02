#!/bin/bash

rm -rf /tmp/*.pid


IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo "CONTAINER_IP=$IP"


#IP1=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

perl -pi -e 's/nifi.web.http.host=/nifi.web.http.host=$IP/g' $NIFI_HOME/conf/nifi.properties

$NIFI_HOME/bin/nifi.sh start

/bin/bash


