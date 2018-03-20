# Notes to build several systems #

## Build BCM968580 ##
make PROFILE=96858GWO clean
make PROFILE=96858GWO menuconfig
make PROFILE=96858GWO BRCM_MAX_JOBS=1






## Build RTL9607 ##
check vendor/Realtek/luna/config2630/...
make preconfig3180_....
