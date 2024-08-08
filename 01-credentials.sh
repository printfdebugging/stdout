#!/bin/bash

# install git if not present
if ! command -v git; then
    sudo pacman -S git --noconfirm
fi

git clone https://github.com/printfdebugging/.credentials.git ~/.credentials 
cd ~/.credentials/

# install ansible if not present
if ! command -v ansible-vault; then
    sudo pacman -S ansible
fi

ansible-playbook -i localhost -c local main.yml --ask-vault-pass

# Hurray, I have my credentials setup.
