# Note for QCA IPQ8074 debugging #

## Uboot upgrade image via USB ##
usb start
fatload usb 0:1 0x44000000 norplusnand-ipq807x-single.img
imgaddr=0x44000000
source $imgaddr:script

## Thermal Sensors Reading ##
/sys/devices/virtual/thermal/thermal_zone3: WCSS_PHYA_0
/sys/devices/virtual/thermal/thermal_zone4: WCSS_PHYA_1
/sys/devices/virtual/thermal/thermal_zone10: WCSS_PHYB
/sys/devices/virtual/thermal/thermal_zone11: WCSS_PHYA_2

### Enable ThermalD logging ###
thermald -c <config_file_path> -d 

