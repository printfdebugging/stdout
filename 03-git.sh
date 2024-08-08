#!/bin/bash

# Setup Git Repositories from the mentioned URLs in the
if [ ! -d "$HOME/repos" ]; then
    mkdir -p $HOME/repos
fi

echo "$(ssh-keyscan -t rsa github.com)" > $HOME/.ssh/known_hosts

gitrepos=(
    "git@github.com:printfdebugging/files.git"
    "git@github.com:printfdebugging/stdout.git"
    "git@github.com:printfdebugging/notes.git"
)

cd $HOME/repos

# clone all the repos
for repo in "${gitrepos[@]}"
do
    git clone $repo
done

# setup brave and thunderbird
git clone git@github.com:printfdebugging/brave.git          $HOME/.config/BraveSoftware/Brave-Browser
git clone git@github.com:printfdebugging/thunderbird.git    $HOME/.thunderbird
git clone git@github.com:printfdebugging/.dotfiles.git      $HOME/.dotfiles # dotfiles


# also clone tpm git repo for tmux
if [ ! -d "$HOME/.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
