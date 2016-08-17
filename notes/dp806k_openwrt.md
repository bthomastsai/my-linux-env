# To build OpenWRT #
1. cp wrt_vpn/package/* mt7620_wrt/package.
1. cp config file
1. ./script/feeds update -a
1. ./script/feeds install -a
1. make menuconfig
1. make V=s
1. **To build a specific package, run make package/blcp/{clean,compile}**
1. **To config kernel, run make kernel_menuconfig**
1. **To compile linux kerel, run make target/linux/compile**
1. **To compile 802.11 kernel module, run make -j1 V=s package/kernel/mac80211/compile** 

<br />

# To update HC808K firmware #
1. Sometimes, need to update it by clear.bin, power-on, and reprogramming the updated firmware.

<br />

# OpenWRT notes #
1. Wireless modules are located in **build_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/linux-ramips_mt7620/compat-wireless-2015-03-09/**

# OpenWrt LuCI #
## How to Add module ##
1. _Restart without reboot for modified lua:_
	- **/etc/init.d/uhttpd stop **
	- **rm -rf /tmp/luci-indexcache /tmp/luci-modulecache/**
	- **/etc/init.d/uhttpd start **
1. _UCI command utility:_
	- **show /etc/config/pptpd:** uci show pptpd
	- **show option of /etc/config/pptpd:** 
		- uci get pptpd.pptpd.enabled
		- uci get pptpd.@login[0].username