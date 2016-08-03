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

## To set SSID ##
1. Set Wifi SSID, **AT#SETSSID**="ttwrt","12345678",6 --> WPA2
1. Get MAC address, **AT#GETMAC**
1. Clear SSID, **AT#CLEARSSID**

# OpenWRT notes #
1. Wireless modules are located in **build_dir/target-mipsel_24kec+dsp_uClibc-0.9.33.2/linux-ramips_mt7620/compat-wireless-2015-03-09/**

