#qemu-system-i386 -localtime  FreeDOS1.2net.qcow2 -boot c  -netdev user,id=user.0,smb=/dos -device pcnet,netdev=user.0 -name console -vnc :10  &
