#!/usr/bin/env bash
set -exuo pipefail

sudo pacman -Syuuu

sudo pacman -S --needed --noconfirm pop-icon-theme pop-gtk-theme

ysy() {
  yay -S --overwrite --redownloadall --removemake --rebuildall --noeditmenu --nodiffmenu --cleanafter --answerclean a --answerupgrade a $@
}

yay -Syuuu

ysy --needed aur/system76-driver aur/system76-keyboard-configurator aur/system76-power 
ysy --needed aur/system76-firmware-daemon aur/system76-firmware aur/pop-sound-theme-bin
ysy --needed aur/gnome-shell-extension-system76-power-git aur/system76-dkms 
ysy --needed aur/system76-scheduler aur/system76-acpi-dkms aur/system76-io-dkms 
ysy --needed aur/system76-scheduler-git aur/system76-kbd-led-git
