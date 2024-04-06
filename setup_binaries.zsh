#!/usr/bin/env zsh

if grep -q 'Ubuntu' /etc/os-release; then
  echo "This is Ubuntu."
#   Update apt and add necesary repositories
#   Install binaries (apt install <package>)
elif grep -q 'Arch Linux' /etc/os-release; then
  echo "This is Arch Linux."
#   Update pacman
#   Install binaries (pacman -Sy <package>)
else
  echo "Unknown distribution. Nothing do here"
fi

# TODO: binaries to install
# - nvim
# - lazygit
# - ripgrep
# - bat
# - gh (github CLI)
# - node
# - python
# - fzf
# - zoxide
# - fd-find

# TODO repositories to clone
# - astronvim: https://github.com/AstroNvim/AstroNvim
# - lazyvim
