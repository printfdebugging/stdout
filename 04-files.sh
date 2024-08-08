#!/bin/bash


# I cannot prefer anything but gnu stow at this point


cd $HOME/.dotfiles && stow -R --no-dirs .


cd $HOME/.dotfiles/.local/src
sudo cp 00-keyboard.conf    /etc/X11/xorg.conf.d/00-keyboard.conf
sudo cp 30-touchpad.conf    /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp dwm.desktop         /usr/share/xsessions/dwm.desktop