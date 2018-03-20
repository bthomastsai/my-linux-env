# Note for QCA IPQ8074 debugging #

## Uboot upgrade image via USB ##
usb start
fatload usb 0:1 0x44000000 norplusnand-ipq807x-single.img
imgaddr=0x44000000
source $imgaddr:script
