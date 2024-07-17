#!/bin/bash

sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils \
    openbsd-netcat ebtables iptables libguestfs

# uncomment these
# unix_sock_group = "libvirt" 
# unix_sock_rw_perms

# if the file is deleted/corrupted for some reason, then remove it and reinstall the
# package owning the file

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt

clear
echo "reboot now!"
