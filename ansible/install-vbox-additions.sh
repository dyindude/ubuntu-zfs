#!/usr/bin/env bash
mkdir /tmp/vbox
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /tmp/vbox
/tmp/vbox/VBoxLinuxAdditions.run --nox11
umount /tmp/vbox
rm -rf vbox /root/VBoxGuestAdditions.iso
