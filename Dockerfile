FROM jgoerzen/supervisor
MAINTAINER John Goerzen <jgoerzen@complete.org>
# dosemu is in contrib
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
# VNC doesn't start without xfonts-base
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install wget tightvncserver xfonts-base \
            lwm xterm vim-tiny less ca-certificates balance \
            zip unzip pwgen xdotool telnet nano \
            dosemu mtools dosfstools dos2unix inetutils-telnetd openbsd-inetd \
            xvnc4viewer tcpser ser2net socat liblockfile-bin && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY scripts/ /usr/local/bin/
COPY supervisor/ /etc/supervisor/conf.d/
COPY setup/ /tmp/setup/
COPY autoexec.bat /etc/dosemu/freedos/autoexec.bat
RUN /tmp/setup/setup.sh && rm -r /tmp/setup

EXPOSE 5901
CMD ["/usr/local/bin/boot-supervisord"]

