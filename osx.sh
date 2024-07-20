#!/bin/bash

cd ~
git clone --depth 1 --recursive https://github.com/kholia/OSX-KVM.git
cd OSX-KVM
git pull --rebase

sudo modprobe kvm; echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs
sudo cp kvm_amd.conf /etc/modprobe.d/kvm.conf

sudo usermod -aG kvm $(whoami)
sudo usermod -aG libvirt $(whoami)
sudo usermod -aG input $(whoami)

./fetch-macOS-v2.py
dmg2img -i BaseSystem.dmg BaseSystem.img
qemu-img create -f qcow2 mac_hdd_ng.img 256G

sed "s/CHANGEME/$USER/g" macOS-libvirt-Catalina.xml > macOS.xml
virt-xml-validate macOS.xml

# this might show some error, and installing qemu-full solves that
virsh --connect qemu:///system define macOS.xml

sudo setfacl -m u:libvirt-qemu:rx /home/$USER
sudo setfacl -R -m u:libvirt-qemu:rx /home/$USER/OSX-KVM
