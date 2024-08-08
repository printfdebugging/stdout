#!/bin/bash

# this is a script to seutp dotfiles on a fresh computer.  This basically divides all the parts of a computer into various
# modules, like the packages, git repositories, credentials, system shell setup etc.

# setup credentials
sh ./01-credentials.sh
sh ./02-packages.sh
sh ./03-git.sh
sh ./04-files.sh
sh ./05-system.sh
