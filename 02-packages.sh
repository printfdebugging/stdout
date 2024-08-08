#!/bin/bash

packages=(
    # Xorg
    "xorg-server"
    "xorg-xinit"
    "xorg-xrandr"
    "xorg-setxkbmap"
    "xorg-xset"
    "xcompmgr"
    "xwallpaper"
    "xclip"
    "xsel"

    # System Packages
    "thunderbird"
    "firefox"
    "chromium"
    "brave-bin"
    "visual-studio-code-bin"
    "lua"
    "cmake"
    "ansible"
    "neofetch"
    "man-db"
    "btop"
    "vim"
    "pasystray"
    "pavucontrol"
    "unzip"
    "network-manager-applet"
    "python-pexpect"
    "ripgrep"
    "thunar"
    "breeze-icons"
    "ocean-sound-theme"
    "go"
    "xdotool"
    "netcat"
    "python-watchdog"
    "libreoffice-fresh"
    "loupe"
    "bear"
    "zola"
    "mtpfs"
    "gvfs-mtp"
    "mpv"
    "python-pip"
    "evince"
    "okular"
    "sfml"
    "gdb"
    "ntfs-3g"
    "obs-studio"
    "glade"
    "dunst"
    "libnotify"
    "flameshot"
    "kitty"
    "neovim"
    "par"               # formatting tool in neovim
    "tmux"
    "yt-dlp"
    "zsh"
    "zsh-syntax-highlighting"
    "zsh-completions"
    "zsh-autosuggestions"
    "openssh"
    "pasystray"
    "stow"

    # Suckless Dependencies
    "base-devel"
    "libx11"
    "libxft"
    "libxinerama"
    "freetype2"
    "ttf-jetbrains-mono-nerd"
    "ttf-iosevka-nerd"
    "ttf-twemoji"
)


if ! command -v yay; then
    cd /tmp
    git clone https://aur.archlinux.org/yay-bin && cd yay-bin && makepkg -si
fi


for package in ${packages[@]}
do
    yay -S $package --noconfirm
done
