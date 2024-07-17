#!/bin/bash

sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils \
    openbsd-netcat ebtables iptables libguestfs

sed s/#unix_sock_group\ =\ "libvirt"/unix_sock_group\ =\ "libvirt"/g \
    /etc/libvirt/libvirtd.conf > /etc/libvirt/libvirtd.conf

sed s/#unix_sock_rw_perms\ =\ "0770"/unix_sock_rw_perms\ =\ "0770"/g \
    /etc/libvirt/libvirtd.conf > /etc/libvirt/libvirtd.conf

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt

clear
echo "reboot now!"
