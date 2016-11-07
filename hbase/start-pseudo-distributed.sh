#!/bin/bash

: ${HBASE_HOME:=/usr/local/hbase}

$HBASE_HOME/bin/hbase regionserver start > logregion.log 2>&1 &
$HBASE_HOME/bin/hbase master start --localRegionServers=0
