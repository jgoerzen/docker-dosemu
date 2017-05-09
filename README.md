# DOSEMU for Docker Server

This image can be used standalone, or as a base for other images.
It provides a nice DOS environment using DOSEMU (similar to DOSBox
or VirtualBox).

It also provides a qemu environment and a VNC console for it, running on
port 5901.  This can be used for various guest OSs.

# Install and run

You can install with:

    docker pull jgoerzen/dosemu

And run with:

    docker run -d -p 5901:5901 --name mydosemu jgoerzen/dosemu

This image uses supervisor; please see the supervisor/ directory for
examples.  Adding your own processes is very simple.  The supervisor
support is provided by [jgoerzen/supervisor](https://github.com/jgoerzen/docker-supervisor).

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
can be found at <https://github.com/jgoerzen/docker-dosemu>

# Copyright

Docker scripts, etc. are
Copyright (c) 2017 John Goerzen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Additional software copyrights as noted.

