source ./data/packages.sh
source ./data/repositories.sh

install_aur_helper() {
    if ! command -v "yay" > /dev/null ;then
        git clone https://aur.archlinux.org/yay-bin /tmp/yay-bin
        makepkg -si /tmp/yay-bin
    else
        echo "yay already installed!"
    fi
    yay -Syu
}

install_system_packages() {
    for package in ${system_packages[@]}
    do
        if ! command -v $package > /dev/null; then
            $AUR_HELPER $AUR_HELPER_FLAGS $package
        fi
    done
}

install_user_packages() {
    for package in ${user_packages}
    do
        if ! command -v $package > /dev/null; then
            $AUR_HELPER $AUR_HELPER_FLAGS $package
        fi
    done
}

setup_ssh_keys_and_configs() {
    ansible-vault decrypt ../.ssh/id_ed25519
    if ! [ $? -eq 0 ]; then
        echo "FAILED to decrypt the ssh key!"
        exit -1
    fi

    mv ../.ssh ~/.ssh
    chmod 400 ~/.ssh/id_ed25519

    # clone the .dotfiles repo
    git clone git@github.com:printfdebugging/.dotfiles.git ~/.dotfiles
    rm -rf ~/.ssh
    cd ~/.dotfiles && stow . --no-folding
    cd
}

clone_git_repositories() {

    if ! [ -d $GIT_REPOSITORIES_PATH ] > /dev/null; then
        mkdir -p $GIT_REPOSITORIES_PATH
    fi

    for $repository in ${git_repositories[@]} do
        cd $GIT_REPOSITORIES_PATH
        if ! [ -d $GIT_REPOSITORIES_PATH/$repository ]; then
            git clone $repository 
        fi
    done
}

setup_shells_and_dwm() {
    sudo echo "/usr/bin/zsh" >> /etc/shells
    chsh -s $(which zsh)
    sudo chsh -s $(which zsh)

    # symlink thunderbird and brave
    ln -s $GIT_REPOSITORIES_PATH/thunderbird /home/$USER/.thunderbird
    ln -s $GIT_REPOSITORIES_PATH/brave /home/$USER/.config/BraveSoftware/Brave-Browser

    # Clone TPM (tmux plugin manager)
    [[ -d  "~/.tmux" ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    /home/$USER/repos/github/bin/buildsuckless

    sudo cp /usr/share/fontconfig/conf.avail/75-twemoji.conf /etc/fonts/conf.d/
    rm -rf ~/stdout
}
