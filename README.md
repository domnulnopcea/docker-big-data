A simple docker compose package that gathers

* hbase 1.1.6
* kafka 0.10.0.1
* zookeeper
* kafka-manager

Every container receives a static IP for easier management.
For this to work you should add 

172.16.238.10   zookeeper
172.16.238.11   hbase

to you /etc/hosts file
