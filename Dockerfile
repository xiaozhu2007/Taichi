FROM debian
COPY root /
RUN dpkg --add-architecture i386 ; apt -qq update ; apt -qq install wget wine xdotool dbus-x11 curl xfce4 xfce4-terminal firefox-esr busybox fonts-wqy-zenhei npm locales pulseaudio -y; \
    wget https://github.com/kasmtech/KasmVNC/releases/download/v1.3.1/kasmvncserver_bookworm_1.3.1_amd64.deb -O /a/kasm.deb ; \
    cd /a/ ; apt -qq install -y ./kasm.deb; cd ~ ; \
    apt clean ; rm /a/kasm.deb; \
    useradd user ; mkdir /home/user ; echo 'user:user' | chpasswd \
    adduser user ssl-cert; adduser user pulse ; adduser user pulse-access ; mkdir -p /home/user/.vnc  ; touch /home/user/.vnc/.de-was-selected ; cp -f /a/kasmvnc.yaml  /home/user/.vnc/ \
    chown user:user /a -R ; chown user:user /home/user -R ; chmod 755 /1.sh ; chmod 755 /run.sh
CMD ["/run.sh"]
