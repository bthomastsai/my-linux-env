#!/usr/bin/expect
set timeout 60
spawn ssh -l root 192.168.100.51
expect "password:"
send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_acl --priority=10 --intf=15 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=0 --dscp=28 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00010019 delete\n"
expect "#"

interact

exit
