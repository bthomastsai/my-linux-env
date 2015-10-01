#!/usr/bin/expect
set timeout 60
spawn ssh -l root 192.168.100.51
expect "password:"
send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_group --groupid=0x00010007\n"
expect "#"
send "./client_group --groupid=0x00010007 --l2intfbktid=0 --outport=7 --popvlan=0\n"
expect "#"
send "./client_acl --priority=10 --intf=25 --srcmac=00:00:00:00:11:11 --dstmac=00:00:00:00:33:33 --vlan=0 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010007\n"
expect "#"

interact

exit