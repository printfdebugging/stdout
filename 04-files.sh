#!/bin/bash


# I cannot prefer anything but gnu stow at this point


cd $HOME/.dotfiles && stow -R --no-folding .


cd $HOME/.dotfiles/.local/src
sudo cp 00-keyboard.conf    /etc/X11/xorg.conf.d/00-keyboard.conf
sudo cp 30-touchpad.conf    /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp dwm.desktop         /usr/share/xsessions/dwm.desktop

sudo cp /usr/share/fontconfig/conf.avail/75-twemoji.conf /etc/fonts/conf.d/75-twemoji.conf

# build suckless
sh $HOME/.dotfiles/.local/bin/buildsuckless
