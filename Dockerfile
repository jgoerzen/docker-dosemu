FROM debian:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
# VNC doesn't start without xfonts-base
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install tightvncserver xfonts-base \
            lwm xterm vim-tiny less wget ca-certificates balance \
            supervisor zip unzip pwgen xdotool telnet mtools nano \
            qemu qemu-system-x86 qemu-utils build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY download.sh /tmp/download.sh
RUN /tmp/download.sh
COPY startvnc /usr/local/bin
COPY dosboxconsole /usr/local/bin
COPY supervisor/ /etc/supervisor/conf.d/
COPY setup/ /tmp/setup/
RUN /tmp/setup/setup.sh

# Dosemu was just used to grab FreeDOS stuff.
RUN dpkg --purge build-essential && apt-get -y --purge autoremove && rm -r /tmp/download.sh /tmp/setup

EXPOSE 5901
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

