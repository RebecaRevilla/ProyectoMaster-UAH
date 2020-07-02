#!/bin/bash

rm -rf /tmp/*.pid


IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo "CONTAINER_IP=$IP"

#$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format


$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR --daemon start namenode
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR --daemon start secondarynamenode
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR --daemon start datanode
$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start resourcemanager
$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR --daemon start nodemanager
$HADOOP_HOME/bin/mapred --config $HADOOP_CONF_DIR --daemon start historyserver


#Turn off safe-mode to allow connection
$HADOOP_HOME/bin/hdfs dfsadmin -safemode leave

/bin/bash
