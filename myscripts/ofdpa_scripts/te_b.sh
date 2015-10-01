#!/bin/bash

client_acl --intf=1 --dstmac=00:01:02:03:04:05 --ether=0x800 --srcmac=00:00:00:00:00:00 --srcmacmask=00:00:00:00:00:00 --vlan=10 --dstip4=192.168.5.1 --srcip4=0 --proto=1 --dstport=0 --srcport=0 --setgroup=0x20000001

