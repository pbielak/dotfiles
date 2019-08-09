#!/usr/bin/env bash

set -o xtrace
set -o errexit

# Make link for Nix configuration files
sudo ln -srf ./nix/configuration.nix /etc/nixos/configuration.nix
sudo ln -srf ./nix/modules /etc/nixos/modules
sudo ln -s /etc/nixos/hardware-configuration.nix ./nix/hardware-configuration.nix

# Link ZSH configuration
ln -srf ./zsh/.zshrc $HOME/.zshrc

# Link Vim configuration + install Plug
ln -srf ./.vim/ $HOME/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link .gitconfig
ln -srf ./git/.gitconfig $HOME/.gitconfig

# Link i3 configuration
ln -srf ./i3/ $HOME/.config/i3

# Install Rofi themes
git clone https://github.com/SpotlightKid/rofi-themes.git /tmp/rofi-themes
(
  cd /tmp/rofi-themes
  git checkout bugfix/install-script
  ./install.sh
)
rm -rf /tmp/rofi-themes

# Link dunstrc
ln -srf ./dunst $HOME/.config/dunst

# Link i3status
ln -srf ./i3status $HOME/.config/i3status

# Link .xinitrc (for startx)
ln -srf ./.xinitrc $HOME/.xinitrc

# Link wallpapers
ln -srf ./wallpapers $HOME/wallpapers


set +o xtrace
set +o errexit
