#!/usr/bin/env bash
set -e

sudo pacman -Syuuu

sudo pacman -S --needed --noconfirm git pciutils lshw pacman-contrib rsync reflector ranger polkit udiskie udisks2 gvfs-smb vim exfat-utils ntfs-3g

[[ ! `pgrep -x reflector` ]] && reflector --latest 200 --number 5 --sort rate --save /etc/pacman.d/mirrorlist  > /dev/null &
#--noconfirm -- Kedenlive
sudo pacman -S --needed --noconfirm i3-gaps i3lock i3status alsa-utils alsa-card-profiles zsh
sudo pacman -S --needed --noconfirm pipewire-pulse pulsemixer pipewire-x11-bell python gettext rustup
sudo pacman -S --needed --noconfirm pcmanfm udiskie base-devel zip unzip bpytop rtkit element-desktop
sudo pacman -S --needed --noconfirm openssh picom polybar chromium go firefox alacritty openvpn
sudo pacman -S --needed --noconfirm dnsutils tcpdump feh rustup cargo ripgrep lxsession cuda age
sudo pacman -S --needed --noconfirm bat exa fd procs hexyl sd iftop nload nmon bmon iptraf-ng 
sudo pacman -S --needed --noconfirm opendesktop-fonts yq broot traceroute pavucontrol flameshot
sudo pacman -S --needed --noconfirm vlc zstd python-pip pygmentize ttf-hack-nerd xorg-xrandr
sudo pacman -S --needed --noconfirm jq bash-completion keychain mlocate wget curl words lsof which
sudo pacman -S --needed --noconfirm rxvt-unicode rofi urxvt-perls arandr keepassxc podman netavark
sudo pacman -S --needed --noconfirm conky atool highlight elinks mediainfo w3m ffmpegthumbnailer mupdf
sudo pacman -S --needed --noconfirm dmenu perl-json-xs perl-anyevent-i3 gtk-engines aardvark-dns
sudo pacman -S --needed --noconfirm nmap p7zip dust exa tmux tmuxp qemu-full remmina freerdp kdiskmark
sudo pacman -S --needed --noconfirm perl-async-interrupt perl-ev perl-guard perl-json perl-json-xs perl-net-ssleay
sudo pacman -S --needed --noconfirm bridge-utils virt-manager vde2 ebtables dnsmasq thunderbird
sudo pacman -S --needed --noconfirm yubico-pam yubikey-personalization sysstat ps_mem gtop nmon bpytop
sudo pacman -S --needed --noconfirm dnsutils tcpdump wireshark-qt python-pdftotext xbindkeys strace
sudo pacman -S --needed --noconfirm noto-fonts ttf-ubuntu-font-family lxappearance signal-desktop borg
sudo pacman -S --needed --noconfirm adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts restic
sudo pacman -S --needed --noconfirm ttf-firacode-nerd ttf-iosevka-nerd ttf-dejavu ttf-freefont gparted

sudo usermod -aG wheel,audio,video,storage,docker $USER

sudo systemctl enable libvirtd.service
#sudo systemctl start libvirtd.service

sudo systemctl enable docker.service
#sudo systemctl start docker.service

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

[ ! -f /usr/bin/dexios ] && sudo cargo install dexios && sudo ln -s /home/mchu/.cargo/bin/dexios /usr/bin/
[ ! -f /usr/bin/rage ] && sudo cargo install rage && sudo ln -s /home/mchu/.cargo/bin/rage /usr/bin/
[ ! -f /usr/bin/code ] && ysy --needed aur/visual-studio-code-bin
[ ! -f /usr/bin/nordvpn ] && ysy --needed aur/nordvpn-bin
[ ! -f /usr/bin/teamviewer ] && ysy --needed aur/teamviewer
[ ! -f /usr/bin/brave ] && ysy --needed aur/brave-bin
[ ! -f /usr/bin/skypeforlinux ] && ysy --needed aur/skypeforlinux-stable-bin
[ ! -f /usr/bin/pavumeter ] && ysy --needed aur/pavumeter
[ ! -f /usr/bin/joplin-desktop ] && ysy --needed aur/joplin-appimage 
[ ! -f /usr/bin/joplin-desktop ] && ysy --needed aur/raysession-git
[ ! -f /usr/bin/mpv ] && ysy --needed aur/mpv-full
[ ! -f /usr/bin/ffmpeg ] && ysy --needed aur/ffmpeg-full
[ ! -d /usr/share/icons/capitaine-cursors ] && ysy --needed community/capitaine-cursors
[ ! -d /usr/share/themes/Mint-X ] && ysy --needed aur/mint-themes
[ ! -d /usr/share/icons/breeze ] && ysy --needed --noconfirm aur/plasma5-themes-breath
[ ! -d /usr/bin/bfg ] && ysy --needed --noconfirm aur/bfg

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

if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
fi

pip3 install importlib_resources j2cli s4cmd jq yq linode-cli

# sudo chsh -s /usr/bin/zsh mchu
