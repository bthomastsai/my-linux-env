
Current --> Boot Strap Register:  0x7f7f755f


Leo before: Boot Strap Register: 0x3b7f755f

After workable: Boot Strap Register:  0x7f7f755f


Updating the NAND Flash Partition Table
Old Table
boot    offset=0x00000000, size=0x00000000
rootfs1 offset=0x00000000, size=0x00000000
rootfs2 offset=0x00000000, size=0x00000000
data    offset=0x00000000, size=0x00000000
bbt     offset=0x00000000, size=0x00000000

New Table
boot    offset=0x00000000, size=0x00100000
rootfs1 offset=0x00100000, size=0x0fd00000
rootfs2 offset=0x0fe00000, size=0x0fd00000
data    offset=0x1fb00000, size=0x00400000
bbt     offset=0x1ff00000, size=0x00100000

# uname -a
Linux (none) 4.1.38 #1 SMP PREEMPT Mon Jun 26 10:07:14 CST 2017 aarch64
# ls
bin     data    dev     lib     opt     sbin    tmp     var
bootfs  debug   etc     mnt     proc    sys     usr     webs
# pspctl list
WanRate
RdpaWanType
IpClassMethod
tr69c_acsState
linkState
# pspctl dump RdpaWanType
GPON
# pspctl dump WanRate
0101
# pspctl set WanRate N/A
# pspctl dump WanRate
N/A
# pspctl dump RdpaWanType
GPON
# reboot

