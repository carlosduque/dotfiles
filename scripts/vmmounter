#!/usr/bin/env sh
echo "mounting shared folders"
#sudo mount -t vboxvfs -o rw,gid=1001,uid=1001 dev ~/dev
sudo mount -t vboxvfs -o rw,gid=1001,uid=1001 refs ~/refs
#sudo mount -t vboxvfs -o rw,gid=1001,uid=1001 Documents ~/docs
#sudo mount -t vboxvfs -o rw,gid=1001,uid=1001 downloads ~/Downloads
sudo mount -t vboxvfs -o rw,gid=1001,uid=1001 vmshare $HOME/vmshare
echo "shared folders mounted"

