# Notes on lubuntu (LXDE) #

## Useful comamnds ##
- [***Disable Lenovo T430s touch pad***](http://askubuntu.com/questions/65951/how-to-disable-the-touchpad)
	xinput list

	You will get an output that looks like this:

	⎡ Virtual core pointer                          id=2    [master pointer  (3)]
	⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
	⎜   ↳ SynPS/2 Synaptics TouchPad                id=12   [slave  pointer  (2)]
	⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    		↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    		↳ Power Button                              id=6    [slave  keyboard (3)]
    		↳ Video Bus                                 id=7    [slave  keyboard (3)]
    		↳ Power Button                              id=8    [slave  keyboard (3)]
    		↳ Sleep Button                              id=9    [slave  keyboard (3)]
    		↳ Laptop_Integrated_Webcam_1.3M             id=10   [slave  keyboard (3)]
    		↳ AT Translated Set 2 keyboard              id=11   [slave  keyboard (3)]
    		↳ Dell WMI hotkeys                          id=13   [slave  keyboard (3)]

	It displays all the input devices connected. Note that they all have an id. Since 12 is the id for my touchpad, running the following command will disable it.

	xinput set-prop 12 "Device Enabled" 0


## How to build a specific kernel modules from source code ##
    - Download source codes
    - make oldconfig
    - make prepare
    - make scripts
    - cp -v /usr/src/linux-headers-$(uname -r)/Module.symvers .
        * This to prevent the message "no symbol version for module_layout" when loading the module with insmod or modprobe.
    - mv -v /lib/modules/$(uname -r)/kernel/drivers/net/wireless/ath.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/ath.ko.backup
        * This will rename the original (Ubuntu build) kernel module to make sure that the custom patched one will load.
    - make -C /lib/modules/$(uname -r)/build M=$(pwd)/drivers/net/wireless/ath modules

## How to get Hardware information ##
    - lshw -short -C memory
    - sudo dmidecode --type 17
    - sudo dmidecode --type memory | grep Speed

## Show station inactive time by using iw command ##
    - iw dev wlp1s0 station dump
