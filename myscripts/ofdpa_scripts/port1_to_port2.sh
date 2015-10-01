#!/bin/bash

cd /opt/ofdpa/client
./client_group --groupid=0x00010002
./client_group --groupid=0x00010002 --l2intfbktid=0 --outport=2 --popvlan=0
./client_acl --priority=100 --intf=1 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=0 --ether=0x0000 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010002

