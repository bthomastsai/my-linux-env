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
send "./client_group --groupid=0x00010019 --l2intfbktid=0 --outport=25 --popvlan=1\n"
expect "#"
send "./client_group --groupid=0x00010021\n"
expect "#"
send "./client_group --groupid=0x00010021 --l2intfbktid=0 --outport=33 --popvlan=1\n"
expect "#"
send "./client_group --groupid=0x10000001\n"
expect "#"
send "./client_group --groupid=0x10000001 --l2rewritebktid=0 --l2rewriterefGID=0x10021 --l2rewritedstMac=00:00:00:22:33:44 --l2rewritevlanId=0\n"
#send "./client_group --groupid=0x10000001 --l2rewritebktid=0 --l2rewriterefGID=0xc80019 --l2rewritedstMac=00:00:00:22:33:44 --l2rewritevlanId=200\n"
#send "./client_group --groupid=0x10000001 --l2rewritebktid=0 --l2rewriterefGID=0xc80019 --l2rewritedstMac=00:11:00:22:33:44 --l2rewritesrcMac=00:99:00:88:77:66\n"
expect "#"
#send "./client_acl --priority=10 --intf=15 --srcmac=00:23:45:67:89:ab --dstmac=00:de:f0:12:34:56 --vlan=0 --srcip4=192.168.0.1 --dstip4=192.168.0.2 --proto=0x06 --srcport=1234 --dstport=80 --setvlanp=3 --setgroup=0x10000001\n"
send "./client_acl --priority=10 --intf=15 --srcmac=00:23:45:67:89:ab --dstmac=00:de:f0:12:34:56 --vlan=0 --srcip4=192.168.0.1 --dstip4=192.168.0.2 --proto=0x06 --srcport=1234 --dstport=80 --setgroup=0x10000001\n"
expect "#"

interact

exit
