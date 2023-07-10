#!/usr/bin/env zsh
set -e
src_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp ${src_path}/20-nvidia.conf /etc/X11/xorg.conf.d/
cp ${src_path}/i3.config ~/.config/i3/config
cp ${src_path}/.xinitrc ~/
cp ${src_path}/.zshrc ~/
chsh -s /usr/bin/zsh mchu
