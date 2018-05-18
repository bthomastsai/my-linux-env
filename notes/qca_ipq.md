# Note for QCA IPQ8074 debugging #

## Uboot upgrade image via USB ##
usb start
fatload usb 0:1 0x44000000 norplusnand-ipq807x-single.img
imgaddr=0x44000000
source $imgaddr:script

## Thermal Sensors Reading ##
/sys/devices/virtual/thermal/thermal_zone3: WCSS_PHYA_0 <br/>
/sys/devices/virtual/thermal/thermal_zone4: WCSS_PHYA_1 <br/>
/sys/devices/virtual/thermal/thermal_zone10: WCSS_PHYB <br/>
/sys/devices/virtual/thermal/thermal_zone11: WCSS_PHYA_2 <br/>

### Enable ThermalD logging ###
thermald -c <config_file_path> -d 

### Fix MCS rate ###
iwpriv athN novap_reset 1
iwpriv athN nss 8
iwpriv athN he_mcs 11

### Set busybox date ###
date 2018.04.09-13:00 --> 2018-04-09 13:00
