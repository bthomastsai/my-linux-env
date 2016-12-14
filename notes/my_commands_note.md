nmcli dev wifi con "myssid" password "myssidpassword"

=== Gstreamer notes ===
gst-launch-1.0 filesrc location=./2b7c75958f0449f465d3ea588e86be85.jpg ! jpegdec ! imagefreeze ! timeoverlay text="Time goes" ! autovideosink

** Play MP4 file
gst-launch-1.0 filesrc location=./SampleVideo_1280x720_5mb.mp4 ! qtdemux ! h264parse ! vpudec ! autovideosink

** Mixer
gst-launch-1.0 -e videotestsrc pattern=0 ! capsfilter caps="video/x-raw,width=200,height=150" ! videomixer name=mix ! videoconvert ! overlaysink ! videotestsrc pattern=22 ! capsfilter caps="video/x-raw,width=640,height=360" ! mix.

gst-launch-1.0 -e filesrc location=./SampleVideo_1280x720_5mb.mp4 ! capsfilter caps="video/x-raw,width=200,height=150" ! videomixer name=mix ! overlaysink filesrc location=./0.jpg ! jpegdec ! imagefreeze ! mix.

gst-launch-1.0 -e videotestsrc pattern=0 ! capsfilter caps="video/x-raw,width=200,height=150" ! videomixer name=mix sink_1::xpos=20 sink_1::alpha=0.5 sink_1::zorder=3  ! overlaysink videotestsrc pattern=22 ! capsfilter caps="video/x-raw,width=640,height=360" ! mix.

** VideoBox
gst-launch-1.0 -e videotestsrc pattern=0 ! capsfilter caps="video/x-raw,width=200,height=150" ! videomixer name=mix sink_1::xpos=20 sink_1::alpha=0.5 sink_1::zorder=3  ! overlaysink videotestsrc pattern=22 ! capsfilter caps="video/x-raw,width=640,height=360" ! mix.

** Video in background picture
gst-launch-1.0 -e videomixer name=mix ! overlaysink filesrc location=./SampleVideo_1280x720_5mb ! capsfilter caps="video/x-raw,framerate=25/1,width=350,height=250" ! filesrc location=./0.jpg ! jpegdec ! mix.

gst-launch-1.0 multifilesrc location="jpeg%04d.jpg" num-buffers=1000 caps=image/jpeg,framerate=1/1 ! jpegdec ! autovideoconvert ! vpuenc_h264 ! qtmux ! filesink location="jjj.mp4"

gst-launch-1.0 multifilesrc loop=true location="jpeg%04d.jpg" ! jpegdec ! identity sleep-time=1000000 ! videoconvert ! autovideosink
 
gst-launch-1.0 imxcompositor_g2d name=comp sink_1::xpos=160 sink_1::ypos=120 sink_1::width=640 sink_1::height=480 ! overlaysink multifilesrc location="jpeg%04d.jpg" loop=0 ! jpegdec ! imagefreeze ! comp.sink_0 filesrc location=./SampleVideo_1280x720_5mb.mp4 ! qtdemux ! h264parse ! vpudec ! comp.sink_1

gst-launch-1.0 imxcompositor_g2d name=comp sink_0::xpos=0 sink_0::ypos=0 sink_0::width=320 sink_0::height=240 sink_1::xpos=320 sink_1::ypos=240 sink_1::width=640 sink_1::height=480 ! overlaysink multifilesrc location="jpeg%04d.jpg" loop=true ! jpegdec ! identity sleep-time=100000 ! videoconvert ! comp.sink_0 filesrc location=./SampleVideo_1280x720_5mb.mp4 ! qtdemux ! h264parse ! vpudec ! comp.sink_1

gst-launch-1.0 imxcompositor_g2d name=comp sink_1::xpos=160 sink_1::ypos=120 sink_1::width=640 sink_1::height=480 ! overlaysink multifilesrc location="jpeg%04d.jpg" loop=true ! jpegdec ! comp.sink_0 filesrc location=./SampleVideo_1280x720_5mb.mp4 ! qtdemux ! h264parse ! vpudec ! comp.sink_1


gst-launch-1.0 imxcompositor_g2d name=comp sink_0::xpos=0 sink_0::ypos=0 sink_0::width=480 sink0_height=360 sink_1::xpos=480 sink_1::ypos=360 sink_1::width=480 sink_1::height=360 ! overlaysink multifilesrc location="jpeg%04d.jpg" start_index=4 loop=true caps=image/jpeg,framerate=1/1 ! jpegdec ! comp.sink_0 multifilesrc loop=true location="./SampleVideo_1280x720_5mb.mp4" ! qtdemux ! h264parse ! vpudec ! comp.sink_1


==== UDOO ====
## WEBCAM encode/decode playback
gst-launch-1.0 v4l2src device=/dev/video2 ! video/x-raw,width=640,height=480 ! imxvpuenc_h264 gop-size=30 ! h264parse ! imxvpudec ! imxg2dvideosink

==== WEBCAM Streaming ====
-> On EVB, receiver (ip:10.10.10.5)
gst-launch-1.0 udpsrc port=9001 ! h264parse ! vpudec ! autovideosink
-> On Udoo, sender(ip:10.10.10.1)
gst-launch-1.0 v4l2src device=/dev/video2 ! video/x-raw,width=640,height=480 ! imxvpuenc_h264 bitrate=1000 ! udpsink host=10.10.10.5 port=9001

=== Multiple Displays ====
-> U-Boot kernel command option
setenv smp 'video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:dev=hdmi,1920x1080M@60,if=RGB24'
-> Linux command
gst-launch-1.0 playbin uri=file:///home/root/video/test.mp4 video-sink="\"imxv4l2sink device=/dev/video18\"" udpsrc port=9001 ! h264parse ! vpudec ! imxv4l2sink device=/dev/video17

=== NMCLI command ===
**nmcli dev wifi con "myssid" password "myssidpassword"**
**nmcli con up mi**


=== How to build gstreamer pipeline application ===
gcc loop_play.c -o player `pkg-config --cflags --libs gstreamer-1.0`
--> Check GStreamer SDK tutorial : http://docs.gstreamer.com/display/GstSDK/Installing+on+Linux <--
gcc basic-tutorial-1.c -o basic-tutorial-1 `pkg-config --cflags --libs gstreamer-0.10`

=== Play local webcam and remote ip cam ===
gst-launch-1.0 v4l2src device=/dev/video2 ! video/x-raw,width=1280,height=720 ! imxg2dvideosink window-x-coord=0 window-y-coord=0 window-width=1080 window-height=640 playbin uri=http://10.1.13.72:8081 video-sink="imxg2dvideosink window-x-coord=1080 window-y-coord=640 window-width=640 window-height=480"


=== Gstreamer RTSP Laptop(RTSP server) to UDOO(RTSP client) ===
On Laptop, build and install gst-rtsp-server (from https://github.com/GStreamer/gst-rtsp-server.git), and change to examples folder, run
./test-mp4 ~/Videos/test.mp4

On UDOO, run
gst-launch-1.0 rtspsrc location=rtsp://192.168.50.28:8554/test ! rtph264depay ! h264parse ! imxvpudec ! autovideosink

IMX6 android multiple display
bootargs=console=ttymxc0,115200 androidboot.console=ttymxc0 consoleblank=0 vmalloc=256M init=/init lvds_num=0 video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:dev=hdmi,1920x1080M@60,bpp=32 video=mxcfb2:off video=mxcfb3:off androidboot.hardware=freescale cma=384M

#### Yocto built rootfs ####
> /home/thomas/projects/fsl/fsl-release-bsp/build-x11/tmp/work/imx6qpsabresd-poky-linux-gnueabi/fsl-image-qt5/1.0-r0/rootfs


## Gitlab with Https ##
echo -n | openssl s_client -showcerts -connect www.bthomastsai.idv.tw:443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> ~/1
sudo sh -c 'cat ~/1 >> /etc/ssl/cert/ca_certificates.crt

## CURL post command ##
=== Mongoose restful server as example ===
curl --data "n1=700&n2=110" http://127.0.0.1:8000/api/v1/sum

=== curl POST REST API with JSON format ===
* Add
> curl -X POST "http://10.10.10.111:8888/timers/v1/add" -i -H "Content-Type:application/json" -d '{"days":[true,false,true,false,true,false,true], "time":36400, "mac":"9c:65:f9:1b:e3:ec", "type":"on", "active":true}'

* Edit
>curl -X POST "http://localhost:8888/timers/v1/edit" -i -H "Content-Type:application/json" -d '{"id":1, "days":[true,true,false,false,true,true,false], "time":66763, "type":"on", "active":true}'

== curl GET REST API with JSON format ==
curl -X GET "http://127.0.0.1:8888/timers/v1/list"

== SQL command to query days_bitmask & 4 ==
select * from timers where days_bitmask&4;

== NetworkManager configure IP alias ==
sudo vim /etc/NetworkManager/system-connections/eth0

== mzclient command ==
mzclient -t '_blcs._tcp' -r

== SSH without password setting ==
cat ~/.ssh/id_rsa.pub | ssh -l thomas 2.1.1.119 'cat >> ~/.ssh/authorized_keys'

== How to setup wxWidget on Windows ==
1. Download [TDM-GCC](http://tdm-gcc.tdragon.net)
1. Set TDM-GCC to path (Set PATH=C:\TDM-GCC\bin;C:\TDM-GCC\mingw32\bin)
1. cd /D c:\wxWidget\build\msw
1. mingw32-make -f makefile.gcc MONOLITHIC=1 SHARED=0 UNICODE=1 CXXFLAGS="-std=gnu++11" BUILD=release clean
1. mingw32-make -f makefile.gcc MONOLITHIC=1 SHARED=0 UNICODE=1 CXXFLAGS="-std=gnu++11" BUILD=release
1. mingw32-make -f makefile.gcc MONOLITHIC=1 SHARED=0 UNICODE=1 CXXFLAGS="-std=gnu++11" BUILD=debug clean
1. mingw32-make -f makefile.gcc MONOLITHIC=1 SHARED=0 UNICODE=1 CXXFLAGS="-std=gnu++11" BUILD=debug

== VirtualBox serial pipe notes ==
1. Setup serial port to host pipe, like /tmp/myvbox
1. socat UNIX-CONNECT:/tmp/myvbox TCP-LISTEN:8040
1. telnet localhost 8040, --> Host can communicate with guest OS serial port.

== Serial port monitor ==
socat -x /dev/ttyUSB0,raw,echo=0,nonblock,min=0,b115200 PTY,link=/tmp/ttyV0,raw,echo=0,waitslave,nonblock,min=0,b115200,onlcr=0,iexten=0,eof=01,echoe=0,echok=0,noflsh=1,echoctl=0,echoke=0
socat /dev/ttyUSB0,raw,echo=0,b115200 SYSTEM:'tee input.txt | socat - "PTY,link=/tmp/ttyV0,raw,echo=0,b115200,waitslave" | tee output.txt'
