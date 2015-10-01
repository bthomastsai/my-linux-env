#!/usr/bin/expect
set timeout 60
spawn ssh -l root 2.1.1.51
#expect "password:"
#send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_group --groupid=0x00010019\n"
expect "#"
send "./client_group --groupid=0x00010019 --l2intfbktid=0 --outport=25 --popvlan=0\n"
expect "#"
#send "./client_acl --priority=10 --intf=15 --srcmac=00:06:07:08:09:0a --dstmac=00:01:02:03:04:05 --vlan=0 --ether=0x0800 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010019\n"
#expect "#"
#send "./client_group --groupid=0x00010021\n"
#expect "#"
#send "./client_group --groupid=0x00010021 --l2intfbktid=0 --outport=33 --popvlan=1\n"
#expect "#"
send "./client_acl --priority=10 --intf=15 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=0 --ether=0x0800 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010019\n"

interact

exit

client_acl --priority=10 --intf=1 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=10 --ether=0x0800 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x000a0002
