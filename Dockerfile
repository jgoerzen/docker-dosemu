FROM debian:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
# VNC doesn't start without xfonts-base
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install wget tightvncserver xfonts-base \
            lwm xterm vim-tiny less ca-certificates balance \
            supervisor zip unzip pwgen xdotool telnet nano \
            qemu-system-x86 qemu-utils \
            xvnc4viewer tcpser ser2net && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY scripts/ /usr/local/bin/
COPY supervisor/ /etc/supervisor/conf.d/
COPY setup/ /tmp/setup/
RUN /tmp/setup/setup.sh

RUN apt-get -y --purge autoremove && rm -r /tmp/setup

EXPOSE 5901
CMD ["/usr/local/bin/boot-supervisord"]

