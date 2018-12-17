#!/usr/bin/env sh
echo "mounting shared folders"
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 dev ~/dev
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 refs ~/refs
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 documents ~/documents
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 downloads ~/Downloads
sudo mount -t vboxsf -o rw,gid=1001,uid=1001 vmshare $HOME/vmshare
echo "shared folders mounted"

