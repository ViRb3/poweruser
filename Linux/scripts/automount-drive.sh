#!/bin/bash
#
# Automount drive using fstab
#

sudo apt install ntfs-3g -y

sudo mkdir /mnt/foo
sudo bash -c "echo 'LABEL=foo /mnt/foo ntfs-3g defaults,nofail 0 0' >> /etc/fstab"