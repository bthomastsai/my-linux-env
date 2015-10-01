#!/bin/bash

echo "To investigate the maximum of acl entry"

count=0
port=1
vlanid=200
while [ $count -lt 2000 ]; do
    outport=$(( (port+1)%54 ))
    if [ $outport -eq 0 ]; then
        outport=1
    fi
    group=`printf %04x%04x $vlanid $outport`
    ./client_group --groupid=0x${group}
    ./client_group --groupid=0x${group} --l2intfbktid=0 --outport=${outport} --popvlan=1
    ./client_acl --priority=10 --intf=${port} --srcmac=00:00:00:00:11:11 --dstmac=00:00:00:00:77:77 --vlan=${vlanid} --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x${group}
    if [ "$?" != "0" ]; then
        echo "Max Entry: $count"
        exit 0
    fi
    count=$(( count+1 ))
    port=${outport}
    vlanid=$(( vlanid+1 ))
done
