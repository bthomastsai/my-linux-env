#!/bin/bash

echo "To investigate the maximum of L2 entry"

count=0
port=1
vlanid=2
max_entry=16385
while [ $count -lt $max_entry ]; do
    count=$(( count+1 ))
    outport=$(( (port+1)%28 ))
    if [ $outport -eq 0 ]; then
        outport=1
    fi
    #test $(( vlanid%4094 )) -eq 0 && vlanid=2
    dstmac=$(printf %0.12X "$count" | sed -e 's/../&:/g' -e 's/:$//')
    ##echo "dpctl10 add-flow tcp:2.1.1.91:6634 in_port=${port},dl_vlan=${vlanid},priority=1,idle_timeout=0,dl_dst=${dstmac},actions=output:${outport}"
    dpctl10 add-flow tcp:2.1.1.91:6634 in_port=${port},dl_vlan=${vlanid},priority=1,idle_timeout=0,dl_dst=${dstmac},actions=output:${outport}
    if [ "$?" != "0" ]; then
        echo "Max Entry: $count"
        exit 0
    fi
    #port=${outport}
    #vlanid=$(( vlanid+1 ))
    cc=$(( count%512 ))
    test $cc -eq 0 && echo "count...${count}...port...${port}...vlanid...${vlanid}"
done
