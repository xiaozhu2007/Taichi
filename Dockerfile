FROM debian
COPY root /
RUN dpkg --add-architecture i386 ; apt update ; apt install wine xdotool dbus-x11  xfce4 xfce4-terminal firefox-esr busybox fonts-wqy-zenhei npm locales pulseaudio -y; \
    wget -O /a/kasm.deb https://github.com/kasmtech/KasmVNC/releases/download/v1.3.1/kasmvncserver_bookworm_1.3.1_amd64.deb; \
    apt install -y -f /a/kasm.deb; \
    apt clean ; rm /a/kasm.deb; \
    useradd user ; mkdir /home/user ; echo 'user:user' | chpasswd \
    adduser user ssl-cert; adduser user pulse ; adduser user pulse-access ; mkdir -p /home/user/.vnc  ; touch /home/user/.vnc/.de-was-selected ; cp -f /a/kasmvnc.yaml  /home/user/.vnc/ \
    chown user:user /a -R ; chown user:user /home/user -R ; chmod 755 /1.sh ; chmod 755 /run.sh
CMD ["/run.sh"]
