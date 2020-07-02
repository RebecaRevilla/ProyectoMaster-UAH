#!bin/bash

rm -rf /tmp/*.pid


echo "Welcome to Zookeeper"

$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
#$KAFKA_HOME/bin/zookeeper-server-start.sh


/bin/bash


