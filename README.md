# qemu for Docker Server

This image can be used standalone, or as a base for other images.

It provides a qemu environment and a VNC console for it, running on
port 5901.  This can be used for various guest OSs.  If you are
interested in running DOS as a guest OS, I have a nice 
image for you at [jgoerzen/qemu-dos](https://github.com/jgoerzen/docker-qemu-dos).

# Install and run

You can install with:

    docker pull jgoerzen/qemu

And run with:

    docker run -d -p 5901:5901 --name myqemu jgoerzen/qemu

This image uses supervisor; please see the supervisor/ directory for
examples.  Adding your own processes is very simple.

# Environment variable

 - `VNCPASSWORD` can set the password for the VNC console
   (maximum 8 characters, a limitation of tightvncserver).  If you do not set
   one, a random password will be assigned on each start of the container, and
   logged in the docker logs.

# VNC-based console

VNC is exposed on port 5901.  You can connect to this port.  You will see, by default,
an xterm (white) running here, though
child images may alter these defaults. 

# Source

This is prepared by John Goerzen <jgoerzen@complete.org> and the source
can be found at https://github.com/jgoerzen/docker-bbs/tree/master/qemu

