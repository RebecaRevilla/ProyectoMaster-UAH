#!bin/bash

rm -rf /rmp/*.pid


IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo "CONTAINER_IP=$IP"


#sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

service rsyslog start -S

mongosqld --auth --mongo-username admin --mongo-password admin \
--addr 0.0.0.0:3307 --mongo-uri mongodb://mongodb:27017 --logPath /data/logs/mongosqld.log \
--logAppend --logRotate=reopen --schemaMode auto --schemaSource schemaDb --schemaRefreshIntervalSecs 60

/bin/bash


