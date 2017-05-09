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

# Installed files for DOS

All the fun happens under `/dos`.

By default, nodes start the net image and the console starts the basic image.

Also:

- `/dos/drive_e` through `drive_k` are shared to the net image systems
   as `E:` through `K:`.
   - `E:\BOOTUP.BAT` is called at every boot, and is a nice place to put generic
     AUTOEXEC-typ commands.
   - `G:` is intended to be used for applications (which, in DOS, tend to
     write to their install directories, so this could make an ideal Docker volume)
   - `H:` is intended to be static, and hold utilities, etc.  `H:\UTILS` is
     added to the DOS PATH by the default startup scripts.
   - All drives are mounted in the DOS image by the default startup scripts,
     though it would be easy to mount the others as well.
   - Child images may, but are not required to, follow this convention:

This image uses supervisor; please see the supervisor/ directory for
examples.  Adding your own processes is very simple.

# DOS Session Management

Multi-node BBSs require multiple DOS sessions.  We have to keep the `C:` separate on these,
since it contains `TEMP`.  `/usr/local/bin/startdossession` does the hard work for us.  It is
authoritative on how a DOS session is started.

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

# References and information

- [strace on Docker](https://github.com/moby/moby/issues/21051)
  - magic incantation was: --privileged --cap-add SYS_PTRACE --security-opt seccomp:unconfined
- Dealing with DOS not idling CPU
  - [VirtualBox Heat](http://wiki.freedos.org/wiki/index.php/VirtualBox_-_Heat)
  - [DOSIDLE commands](http://www.scampers.org/steve/vmware/)
- [Dealing with RunTime Error 200](http://www.pcmicro.com/elebbs/faq/rte200.html)

