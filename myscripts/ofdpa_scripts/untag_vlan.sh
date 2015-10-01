#!/bin/bash
cd /root/ofdpa
./client_group --groupid=0x00010012
./client_group --groupid=0x00010012 --l2intfbktid=0 --outport=18 --popvlan=0
./client_acl --priority=10 --intf=14 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=65535 --ether=0x0800 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010012

