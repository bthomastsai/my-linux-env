#!/bin/bash

echo "==> Set vlan table"
client_vlan -i 1 -v 0x100a -m 0x1fff
client_vlan -i 2 -v 0x100a -m 0x1fff
client_vlan -i 5 -v 0x100a -m 0x1fff

echo "==> Create l2 interface group"
client_group --groupid=0xb0003
client_group --groupid=0xb0003 --l2intfbktid=0 --outport=3 --popvlan=0
client_group --groupid=0xb0004
client_group --groupid=0xb0004 --l2intfbktid=0 --outport=4 --popvlan=0

echo "==> Set Termination MAC table"
client_termmac --intf=0 --vlan=10 --dstmac=00:01:02:03:04:05

echo "==> Create L3 unicast group"
client_group --groupid=0x20000001
client_group --groupid=0x20000001 --l3ucastbktid=0 --l3ucastdstMac=00:00:00:00:00:01 --l3ucastsrcMac=00:01:02:03:04:05 --l3ucastrefGID=0xb0003 --l3ucastvlanId=11
client_group --groupid=0x20000002
client_group --groupid=0x20000002 --l3ucastbktid=0 --l3ucastdstMac=00:00:00:00:00:02 --l3ucastsrcMac=00:01:02:03:04:05 --l3ucastrefGID=0xb0004 --l3ucastvlanId=11

echo "==> Create ECMP group"
client_group --groupid=0x70000001
client_group --groupid=0x70000001 --refgroupsbktid=0 --refgroupsrefGID=0x20000001
client_group --groupid=0x70000001 --refgroupsbktid=1 --refgroupsrefGID=0x20000002

echo "==> Set Unicast Routing table"
client_routing --dstip4=192.168.5.0 --ether=0x800 --prefix=24 --setgroup=0x70000001
