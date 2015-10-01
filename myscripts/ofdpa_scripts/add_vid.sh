#!/usr/bin/expect
set timeout 60
spawn ssh -l root 192.168.100.51
expect "password:"
send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_group --groupid=0x00c80019\n"
expect "#"
send "./client_group --groupid=0x00c80019 --l2intfbktid=0 --outport=25 --popvlan=0\n"
expect "#"
send "./client_group --groupid=0x10000001\n"
expect "#"
#send "./client_group --groupid=0x10000001 --l2rewritebktid=0 --l2rewriterefGID=0xc80019 --l2rewritedstMac=00:00:00:22:33:44 --l2rewritevlanId=200\n"
send "./client_group --groupid=0x10000001 --l2rewritebktid=0 --l2rewriterefGID=0xc80019 --l2rewritevlanId=200 --l2rewritedstMac=00:11:00:22:33:44 --l2rewritesrcMac=00:99:00:88:77:66\n"
expect "#"
send "./client_acl --priority=10 --intf=15 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setvlanp=3 --setgroup=0x10000001\n"
expect "#"

interact

exit
