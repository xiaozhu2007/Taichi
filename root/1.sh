#!/bin/bash
export PATH=/bin:/sbin:/usr/bin:/usr/sbin
export DISPLAY=:1
cd /a/File
busybox httpd -p 19012
echo -e  "123456\n123456" | vncpasswd   -rw -o -u user
vncserver :1 -SecurityTypes=None  -DisableBasicAuth=1  -publicIP=127.0.0.1 -hw3d -drinode /dev/dri/renderD128  -xstartup 'xhost +'
/usr/bin/pulseaudio --start
/usr/bin/pulseaudio --start
pacmd load-module module-native-protocol-tcp auth-anonymous=1
cd /a/kclient/
node index.js &
cd /
export PULSE_SERVER=tcp:127.0.0.1
xfce4-session
