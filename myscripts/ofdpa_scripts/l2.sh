#!/bin/bash

echo "==> Set vlan table"
client_vlan -i 15 -v 0x10c8 -m 0x1fff
client_vlan -i 25 -v 0x10c8 -m 0x1fff

echo "==> Create l2 interface group"
client_group --groupid=0xc80021
client_group --groupid=0xc80021 --l2intfbktid=0 --outport=33 --popvlan=0
client_group --groupid=0xc8002b
client_group --groupid=0xc8002b --l2intfbktid=0 --outport=43 --popvlan=0

#echo "==> Set Termination MAC table"
#client_termmac --intf=0 --vlan=200 --dstmac=00:01:02:03:04:05

client_bridging --group=0xc8002b --dstmac=00:01:02:03:04:05 --vlan=200

