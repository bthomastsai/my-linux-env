#!/usr/bin/expect
set timeout 60
spawn ssh -l root esp9012
#expect "password:"
#send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_group --groupid=0x00c80019\n"
expect "#"
send "./client_group --groupid=0x00c80019 --l2intfbktid=0 --outport=25 --popvlan=1\n"
expect "#"
send "./client_group --groupid=0x20000002\n"
expect "#"
send "./client_group --groupid=0x20000002 --l3ucastbktid=1 --l3ucastvlanId=200 --l3ucastdstMac=00:00:00:00:00:22 --l3ucastsrcMac=00:00:00:00:00:11 --l3ucastrefGID=0x00c80019\n"
expect "#"
send "./client_acl --priority=10 --intf=15 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --vlan=200 --proto=0 --srcport=0 --dstport=0 --setgroup=0x20000002\n"

interact

exit
