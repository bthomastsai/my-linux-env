#!/usr/bin/expect
set timeout 60
spawn ssh -l root 172.23.4.51
expect "password:"
send "1234\n"
expect "#"
send "cd /root/sdk-xgs-robo-6.3.5\n"
expect "#"
send "rmmod linux-bcm-knet.ko\n"
expect "#"
send "rmmod linux-user-bde.ko\n"
expect "#"
send "rmmod linux-kernel-bde.ko\n"
expect "#"
send "mknod /dev/linux-bcm-knet c 122 0\n"
expect "#"
send "mknod /dev/linux-user-bde c 126 0\n"
expect "#"
send "mknod /dev/linux-kernel-bde c 127 0\n"
expect "#"
send "insmod ./linux-kernel-bde.ko dmasize=512M\n"
expect "#"
send "insmod ./linux-user-bde.ko\n"
expect "#"
send "insmod ./linux-bcm-knet.ko use_rx_skb=1 rx_rate=3000000,3000000 rx_burst=300000,300000 rx_buffer_size=2000\n"
sleep 2
expect "#"
send "./bcm.user\n"
expect "BCM.0>"
send "vlan remove 1 PortBitMap=xe50-xe53\n"
expect "BCM.0>"
send "vlan add 1 PortBitMap=cpu\n"
expect "BCM.0>"
send "port xe0-xe49 SPeed=1000\n"
expect "BCM.0>"

set max_port 49
for {set i 0} {$i < $max_port} {incr i 1} {
    send "knetctrl netif create AddTag=no RCPU=no Port=xe$i IFName=knet\%d\n"
    expect "BCM.0>"
}

send "knetctrl filter destroy 1\n"
expect "BCM.0>"

for {set i 0} {$i < $max_port} {incr i 1} {
    set id "[expr $i + 1]"
    send "knetctrl filter create DestType=NetIF DestID=${id} StripTag=yes PRIOrity=2 IngPort=xe$i\n"
    expect "BCM.0>"
}

send "rxcfg spps=3000000 gpps=3000000 burst=300000 ppc=16 pktsize=2000\n"
expect "BCM.0>"

send "rxmon init\n"
expect "BCM.0>"

send "shell\n"
expect "#"

send "rmmod bridge\n"
expect "#"

send "modprobe libcrc32c\n"
expect "#"

send "insmod /root/openvswitch/openvswitch.ko\n"
expect "#"

send "rm -f /usr/local/etc/openvswitch/conf.db\n"
expect "#"

send "ovsdb-tool create /usr/local/etc/openvswitch/conf.db /home/user/openvswitch/vswitchd/vswitch.ovsschema\n"
expect "#"

send "ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --private-key=db:Open_vSwitch,SSL,private_key --certificate=db:Open_vSwitch,SSL,certificate --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert --pidfile --detach\n"
expect "#"

send "ovs-vsctl --no-wait init\n"
expect "#"

send "ovs-vswitchd --pidfile --detach\n"
expect "#"

send "ovs-vsctl add-br br0\n"
expect "#"

#send "ovs-vsctl add-port br0 eth5\n"
#expect "#"

for {set i 0} {$i < $max_port} {incr i 1} {
    send "ovs-vsctl add-port br0 knet$i\n"
    expect "#"
}

send "ifconfig br0 2.1.1.11 netmask 255.255.255.0\n"
expect "#"

#send "ifconfig eth5 0\n"
#expect "#"

for {set i 0} {$i < $max_port} {incr i 1} {
    send "ifconfig knet$i 0\n"
    expect "#"
}

send "ovs-vsctl set-controller br0 tcp:2.1.1.119:6633\n"
expect "#"

send "ovs-vsctl set bridge br0 protocols=OpenFlow10\n"
expect "#"

interact

exit
