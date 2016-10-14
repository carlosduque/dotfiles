#!/usr/bin/env sh
echo "mounting shared folders"
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 dev ~/dev
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 refs ~/refs
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 documents ~/documents
#sudo mount -t vboxsf -o rw,gid=1000,uid=1000 downloads ~/Downloads
sudo mount -t vboxsf -o rw,gid=1000,uid=1000 share ~/Desktop/share
echo "shared folders mounted"

