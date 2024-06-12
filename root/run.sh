#!/bin/bash
rm -r /tmp/* /tmp/.*
service dbus restart
chmod 777 /dev/dri/renderD128
su user -l -c '/1.sh'
