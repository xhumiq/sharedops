#!/usr/bin/env bash
set -e

sudo pacman -Syuuu

sudo pacman -S --needed pciutils lshw pacman-contrib reflector ranger polkit udiskie udisks2 gvfs-smb vim exfat-utils

reflector --latest 200 --number 5 --sort rate --save /etc/pacman.d/mirrorlist &
#--noconfirm -- Kedenlive
sudo pacman -S --needed i3-gaps i3lock i3status alsa-utils alsa-card-profiles 
sudo pacman -S --needed pipewire-pulse pulsemixer pipewire-x11-bell
sudo pacman -S --needed pcmanfm udiskie base-devel zip unzip
sudo pacman -S --needed openssh picom polybar chromium go firefox
sudo pacman -S --needed adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts
sudo pacman -S --needed bpytop ttf-firacode-nerd ttf-iosevka-nerd rtkit
sudo pacman -S --needed dnsutils tcpdump feh rustup cargo ripgrep lxsession
sudo pacman -S --needed bat exa fd procs hexyl sd iftop nload nmon bmon iptraf-ng alacritty
sudo pacman -S --needed opendesktop-fonts yq broot sd traceroute pavucontrol
sudo pacman -S --needed vlc zstd python pygmentize ttf-hack-nerd xorg-xrandr
sudo pacman -S --needed jq bash-completion keychain mlocate wget curl words lsof which
sudo pacman -S --needed noto-fonts ttf-ubuntu-font-family
sudo pacman -S --needed ttf-droid ttf-terminus-nerd ttf-font-awesome ttf-dejavu ttf-freefont
sudo pacman -S --needed rxvt-unicode rofi urxvt-perls arandr udisks2
sudo pacman -S --needed conky atool highlight elinks mediainfo w3m ffmpegthumbnailer mupdf
sudo pacman -S --needed dmenu perl-json-xs perl-anyevent-i3 gtk-engines docker docker-compose
sudo pacman -S --needed nmap p7zip rsync codeblocks dust exa tmux tmuxp
sudo pacman -S --needed perl-async-interrupt perl-ev perl-guard perl-json perl-json-xs perl-net-ssleay
sudo pacman -S --needed bridge-utils virt-manager qemu vde2 ebtables dnsmasq

sudo usermod -aG wheel,audio,video,storage $USER

#sudo pacman -S nvidia-utils nvidia-settings xorg-server xorg-apps xorg-xinit i3gaps numlockx -noconfirm -needed

#sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed

[[ ! -f /usr/bin/yay ]] && (
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
)

yay -Syuuu

ysy() {
  yay -S --overwrite --redownloadall --removemake --rebuildall --noeditmenu --nodiffmenu --cleanafter --answerclean a --answerupgrade a $@
}

ysy --needed aur/teamviewer aur/nordvpn-bin aur/visual-studio-code-bin community/capitaine-cursors aur/mint-themes aur/plasma5-themes-breath

if [ ! -d "$HOME/.nvm" ]; then
	  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -s "$NVM_DIR/nvm.sh" ] && nvm install 18.12.1

if [ ! -f "/home/mchu/.gvm" ]; then
	  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
fi

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && gvm install go1.19

if [ ! -f "/home/mchu/.jabba/jabba.sh" ]; then
  curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

  [ -s "/home/mchu/.jabba/jabba.sh" ] && source "/home/mchu/.jabba/jabba.sh"
  jabba install zulu@1.8
fi

pip3 install importlib_resources j2cli s4cmd jq yq linode-cli
