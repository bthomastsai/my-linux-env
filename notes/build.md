# Notes to build several systems #

## Build BCM968580 ##
make PROFILE=96858GWO clean
make PROFILE=96858GWO menuconfig
make PROFILE=96858GWO BRCM_MAX_JOBS=1






## Build RTL9607 ##
check vendor/Realtek/luna/config2630/...
make preconfig3180_....


## Build RTL9606 ##
### Build a specific user package only ###
make user/xmlconfig_only --> build package
make user/xmlconfig_clean --> clean package
make user/xmlconfig_romfs --> install package to romfs
make user/xmlconfig_menuconfig --> do menuconfig for package which has menuconfig

