# Transfer Materials #
### My Laptop account(Virtual Machines) ###
> **username** : thomas <br/>
> **passwrod** : 1qaz@WSX

### Gstreamer commands ###
1. #### Two Displays on EVB ####
	- **Uboot command option**
	> *setenv smp 'video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:dev=hdmi,1920x1080M@60,if=RGB24'*

	- **Gstreamer command to play local MP4 and receive remote IPCAM stream on I.MX6 EVB(IP:10.10.10.5)**
	> *gst-launch-1.0 playbin uri=file:///home/root/video/test.mp4 video-sink="\"imxv4l2sink device=/dev/video18\"" udpsrc port=9001 ! h264parse ! vpudec ! imxv4l2sink device=/dev/video17*
	- **UDOO(IP:10.10.10.1) as IPCAM stream sender**
	> *gst-launch-1.0 v4l2src device=/dev/video2 ! video/x-raw,width=640,height=480 ! imxvpuenc_h264 bitrate=1000 ! udpsink host=10.10.10.5 port=9001*

	- **For overlaysink usage**
	    */usr/share/imx_6q_display_config*
    		
    		[master]
    		device = /dev/video17
    	
    	
    		[slave]
    		device = /dev/video18
    		fmt = RGBP
    		width = 1920
    		height = 1080
	- **Reference document of I.MX6**
		*i.MX_Linux_User's_Guide.pdf, chapter7.5*

1. #### Play Remote IPCAM(located on 3D printer) on UDOO ####
	- **Gstreamer command**
	> *gst-launch-1.0 playbin uri=http://10.1.13.72:8081 video-sink="imxg2dvideosink window-x-coord=1080 window-y-coord=640 window-width=640 window-height=480"*

1. #### Play local WEBCAM and remote IPCAM(located on 3D printer) on UDOO by PIP ####
	- **Gstreamer command**
	> *gst-launch-1.0 v4l2src device=/dev/video2 ! video/x-raw,width=1280,height=720 ! imxg2dvideosink window-x-coord=0 window-y-coord=0 window-width=1080 window-height=640 playbin uri=http://10.1.13.72:8081 video-sink="imxg2dvideosink window-x-coord=1080 window-y-coord=640 window-width=640 window-height=480"*

1. #### Play HTTP MP4 file ####
	- **Setup Apache HTTP Server on Laptop**
	> run command: *sudo apt-get install apache2*
	>
	> Put MP4 files into */var/www/html/video*
	
	- **Gstreamer command**
	> *gst-launch-1.0 playbin uri=http://192.168.50.28/video/test.mp4*

1. ### Play IPCAM and HTTP MP4 file at the same time ###
	- **Gstreaner command**
	> gst-launch-1.0 souphttpsrc location=http://10.1.13.30/video/ds2.mp4 ! qtdemux ! h264parse ! vpudec ! imxv4l2sink device=/dev/video18 &
	> gst-launch-1.0 souphttpsrc location=http://10.1.13.72:8081/ ! jpegdec ! autovideosink &

1. ### Play IPCAM on a background jpeg and HTTP MP4 file at the same time ###
	- **Gstreamer command**
	>  gst-launch-1.0 filesrc location=./Tulips.jpg ! jpegdec ! imagefreeze ! overlaysink souphttpsrc location=http://10.1.13.72:8081/ ! jpegdec ! overlaysink overlay-left=320 overlay-top=240 overlay-width=640 overlay-height=480 zorder=1 &
	>  gst-launch-1.0 souphttpsrc location=http://10.1.13.30/video/ds2.mp4 ! qtdemux ! h264parse ! vpudec ! imxv4l2sink device=/dev/video18 &
 
### Yocto related stuffs ###
1. #### Build X11 with Qt5 image ####
   	- **First time to setup environment**
	> *DISTRO=fsl-imx-x11 MACHINE=imx6qpsabresd source fsl-setup-release.sh -b build-x11*
	
	- **After build-x11 folder had been created**
	> *source setup-environment build-x11*
	
	- **Run bitbake command to build Qt5**
	> *bitbake fsl-image-qt5*

	- **bitbake command to clean a specific package**
	> *bitbake -c clean <receipe_name>*, like
	> *bitbake -c clean qtmultimedia*

	- **bitbake command to rebuild a specific package forcely**
	> *bitbake -f <receipe_name>*, like *bitbake -f qtmultimedia*

1. #### Build qtmultimedia application ####
	1. Refer [How to use qtmultimedia(QML) with Gstreamer 1.0](https://community.nxp.com/docs/DOC-330047)
	2. Can use qmlvideo as reference to play video 

1. #### Where is X windows application and icons located ####
	1. **application desktop entry:** */usr/share/applications*
	2. **application icon:** */usr/share/pixmaps*


### LibModbus ###
1. Using test/unit-test-server.c, or test/unit-test-client.c
2. Change port number from 1502 to 502
3. **To buiild libmodbus on UDOO**
	1. ./configure
	2. make
	3. make install

### Disk images ###
#### Stored in Ubuntu64 virtual machine####
1. *Ubuntu on UDOO:* located in /home/thomas/DiskImage/udoo.sdcard
1. *Yocto Linux on EVB:* location in /home/thomas/DiskImage/imx6qp_evb_linux.sdcard

### Qt5 QML ###
1. **[QML Book and several examples](http://qmlbook.github.io/assets/index.html)**
2. **QML marquee example:** *Ubuntu64 VirtualMachine, <br/>/home/thomas/projects/qt_project/oneMarquee*
