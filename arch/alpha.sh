#!/usr/bin/env zsh
set -e
src_path=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp ${src_path}/20-nvidia.conf /etc/X11/xorg-conf.d/
cp ${src_path}/i3.config ~/.config/i3/config
cp ${src_path}/.xinitrc to ~/
cp ${src_path}/.zshrc to ~/
chsh -s /usr/bin/zsh mchu
