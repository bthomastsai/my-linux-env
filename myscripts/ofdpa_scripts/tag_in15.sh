#!/usr/bin/expect
set timeout 60
spawn ssh -l root 192.168.100.51
expect "password:"
send "1234\n"
expect "#"
send "cd /root/ofdpa\n"
expect "#"
send "./client_vlan -i 15 -v 0x10c8 -m 0x1fff -n 0xc8\n"
expect "#"
send "./client_vlan -i 15 -v 0x0 -m 0x0fff -n 0xc8\n"
expect "#"
##send "./client_vlan -i 25 -v 0x10c8 -m 0x1fff -n 0xc8\n"
##expect "#"
send "./client_group --groupid=0x00c80019\n"
expect "#"
send "./client_group --groupid=0x00c80019 --l2intfbktid=0 --outport=25 --popvlan=0\n"
expect "#"
send "./client_acl --priority=10 --intf=15 --srcmac=00:00:00:00:00:00 --dstmac=00:00:00:00:00:00 --vlan=200 --srcip4=0.0.0.0 --dstip4=0.0.0.0 --proto=0 --srcport=0 --dstport=0 --setgroup=0x00c80019\n"
expect "#"

interact

exit
