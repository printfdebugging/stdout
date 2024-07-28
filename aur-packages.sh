#!/bin/bash

cd /tmp 
git clone https://aur.archlinux.org/dmg2img.git
cd dmg2img && makepkg -si

cd /tmp 
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si

cd /tmp 
git clone https://aur.archlinux.org/par.git
cd par && makepkg -si
