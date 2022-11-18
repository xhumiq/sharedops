#!/usr/bin/env bash
set -e

sudo pacman -Syuuu

sudo pacman -S --needed --noconfirm pciutils lshw pacman-contrib rsync reflector ranger polkit udiskie udisks2 gvfs-smb vim exfat-utils

[[ ! pgrep -x reflector ]] && reflector --latest 200 --number 5 --sort rate --save /etc/pacman.d/mirrorlist  > /dev/null &
#--noconfirm -- Kedenlive
sudo pacman -S --needed --noconfirm i3-gaps i3lock i3status alsa-utils alsa-card-profiles 
sudo pacman -S --needed --noconfirm pipewire-pulse pulsemixer pipewire-x11-bell python
sudo pacman -S --needed --noconfirm pcmanfm udiskie base-devel zip unzip bpytop
sudo pacman -S --needed --noconfirm openssh picom polybar chromium go firefox alacritty
sudo pacman -S --needed --noconfirm dnsutils tcpdump feh rustup cargo ripgrep lxsession
sudo pacman -S --needed --noconfirm bat exa fd procs hexyl sd iftop nload nmon bmon iptraf-ng 
sudo pacman -S --needed --noconfirm opendesktop-fonts yq broot sd traceroute pavucontrol
sudo pacman -S --needed --noconfirm vlc zstd python-pip pygmentize ttf-hack-nerd xorg-xrandr
sudo pacman -S --needed --noconfirm jq bash-completion keychain mlocate wget curl words lsof which
sudo pacman -S --needed --noconfirm rxvt-unicode rofi urxvt-perls arandr keepassxc
sudo pacman -S --needed --noconfirm conky atool highlight elinks mediainfo w3m ffmpegthumbnailer mupdf
sudo pacman -S --needed --noconfirm dmenu perl-json-xs perl-anyevent-i3 gtk-engines docker docker-compose
sudo pacman -S --needed --noconfirm nmap p7zip codeblocks dust exa tmux tmuxp qemu-full
sudo pacman -S --needed --noconfirm perl-async-interrupt perl-ev perl-guard perl-json perl-json-xs perl-net-ssleay
sudo pacman -S --needed --noconfirm bridge-utils virt-manager vde2 ebtables dnsmasq
sudo pacman -S --needed --noconfirm noto-fonts ttf-ubuntu-font-family
sudo pacman -S --needed --noconfirm ttf-droid ttf-terminus-nerd ttf-font-awesome ttf-dejavu ttf-freefont
sudo pacman -S --needed --noconfirm adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts
sudo pacman -S --needed --noconfirm ttf-firacode-nerd ttf-iosevka-nerd rtkit

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
