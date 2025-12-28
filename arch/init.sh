#!/usr/bin/env bash
set -exuo pipefail

sudo pacman -Syuuu

sudo pacman -S --needed --noconfirm git pciutils lshw pacman-contrib rsync ranger polkit udiskie udisks2 gvfs-smb vim ntfs-3g

# Arch Linux Build - Not Manjaro
#sudo pacman -S --needed --noconfirm reflector i3status dmenu

#[[ ! `pgrep -x reflector` ]] && reflector --latest 200 --number 5 --sort rate --save /etc/pacman.d/mirrorlist  > /dev/null &
#--noconfirm -- Kedenlive
sudo pacman -S --needed --noconfirm i3-gaps i3lock alsa-utils alsa-card-profiles zsh
sudo pacman -S --needed --noconfirm pipewire-pulse pulsemixer pipewire-x11-bell python gettext rustup
sudo pacman -S --needed --noconfirm pcmanfm udiskie base-devel zip unzip btop rtkit element-desktop
sudo pacman -S --needed --noconfirm openssh picom polybar chromium go firefox alacritty openvpn
sudo pacman -S --needed --noconfirm dnsutils tcpdump feh rustup cargo ripgrep lxsession cuda age
sudo pacman -S --needed --noconfirm bat exa fd procs hexyl sd iftop nload nmon bmon iptraf-ng 
sudo pacman -S --needed --noconfirm opendesktop-fonts yq broot traceroute pavucontrol flameshot
sudo pacman -S --needed --noconfirm vlc zstd python-pip pygmentize ttf-hack-nerd xorg-xrandr
sudo pacman -S --needed --noconfirm jq bash-completion keychain mlocate wget curl words lsof which
sudo pacman -S --needed --noconfirm rxvt-unicode rofi urxvt-perls arandr keepassxc podman netavark
sudo pacman -S --needed --noconfirm conky atool highlight elinks mediainfo w3m ffmpegthumbnailer mupdf
sudo pacman -S --needed --noconfirm perl-json-xs perl-anyevent-i3 gtk-engines aardvark-dns
sudo pacman -S --needed --noconfirm nmap dust exa tmux tmuxp qemu-full remmina freerdp kdiskmark
sudo pacman -S --needed --noconfirm perl-async-interrupt perl-ev perl-guard perl-json perl-json-xs perl-net-ssleay
sudo pacman -S --needed ebtables
sudo pacman -S --needed --noconfirm mpv telegram-desktop krita s3cmd hexedit obsidian bluez bluez-utils blueman
sudo pacman -S --needed --noconfirm bridge-utils virt-manager vde2 dnsmasq thunderbird mtr unrar
sudo pacman -S --needed --noconfirm yubico-pam yubikey-manager-qt yubikey-personalization sysstat gtop nmon bpytop
sudo pacman -S --needed --noconfirm wireshark-qt python-pdftotext xbindkeys strace vultr-cli
sudo pacman -S --needed --noconfirm noto-fonts ttf-ubuntu-font-family lxappearance signal-desktop borg
sudo pacman -S --needed --noconfirm adobe-source-han-sans-cn-fonts adobe-source-han-sans-tw-fonts restic
sudo pacman -S --needed --noconfirm ttf-firacode-nerd ttf-iosevka-nerd ttf-dejavu ttf-freefont gparted
sudo pacman -S --needed --noconfirm pcsc-tools dog miniserve procs ouch bottom dua-cli mdcat helix cheese
sudo pacman -S --needed --noconfirm python-importlib_resources jq python-j2cli s4cmd-python3-git linode-cli

sudo usermod -aG wheel,audio,video,storage $USER

sudo systemctl enable libvirtd.service
#sudo systemctl start libvirtd.service

#sudo pacman -S --needed --noconfirm nvidia-utils nvidia-settings xorg-server xorg-apps xorg-xinit i3gaps numlockx -noconfirm -needed

#sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq

[[ ! -f /usr/bin/yay ]] && (
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
)

#yay -Syuuu

ysy() {
  yay -S --overwrite --redownloadall --removemake --rebuildall --answeredit N --answerdiff N --cleanafter --answerclean a --answerupgrade a $@
}

rustup default stable

[ ! -f /usr/bin/dexios ] && cargo install -f dexios && sudo ln -s /home/mchu/.cargo/bin/dexios /usr/bin/
[ ! -f /usr/bin/rage ] && cargo install -f rage && sudo ln -s /home/mchu/.cargo/bin/rage /usr/bin/
[ ! -f /usr/bin/as-tree ] && cargo install -f --git https://github.com/jez/as-tree && sudo ln -s /home/mchu/.cargo/bin/as-tree /usr/bin/
[ ! -f /usr/bin/fd ] && cargo install fd-find
[ ! -f /usr/bin/7zFM] && ysy --needed --noconfirm aur/p7zip-gui
#[ ! -f /usr/bin/teehee ] && ysy --needed aur/teehee
[ ! -f /usr/bin/code ] && ysy --needed aur/visual-studio-code-bin
[ ! -f /usr/bin/nordvpn ] && ysy --needed aur/nordvpn-bin
[ ! -f /usr/bin/teamviewer ] && ysy --needed aur/teamviewer
[ ! -f /usr/bin/brave ] && ysy --needed aur/brave-bin
[ ! -f /usr/bin/bruno ] && ysy --needed aur/bruno-bin
[ ! -f /usr/bin/teams ] && ysy --needed aur/teams
[ ! -f /usr/bin/pavumeter ] && ysy --needed aur/pavumeter
[ ! -f /opt/OnlyKey/nw ] && ysy --needed aur/onlykey
[ ! -f /usr/bin/anydesk ] && ysy --needed aur/anydesk-bin
[ ! -f /usr/bin/trash ] && ysy --needed aur/trash

#[ ! -f /usr/bin/raysession ] && ysy --needed aur/raysession-git
#[ ! -f /usr/bin/ffmpeg ] && ysy --needed aur/ffmpeg-full
[ ! -f /usr/bin/gcloud ] && ysy --needed --noconfirm aur/google-cloud-cli
[ ! f /usr/bin/s5cmd ] && ysy --needed --noconfirm aur/s5cmd-bin
[ ! f /usr/bin/element-desktop ] && ysy --needed --noconfirm extra/element-desktop
[ ! f /usr/bin/lazygit ] && ysy --needed --noconfirm extra/lazygit
[ ! f /usr/bin/byobu ] && ysy --needed --noconfirm extra/byobu
[ ! f /usr/bin/foxitreader ] && ysy --needed --noconfirm aur/foxitreader
[ ! -d /usr/bin/bfg ] && ysy --needed --noconfirm aur/bfg

# Manjaro Only
#[ ! f /usr/lib/xfce-polkit ] && ysy --needed --noconfirm aur/xfce-polkit

# Arch Only
#[ ! -d /usr/share/icons/capitaine-cursors ] && ysy --needed community/capitaine-cursors
#[ ! -d /usr/share/themes/Mint-X ] && ysy --needed aur/mint-themes
#[ ! -d /usr/share/icons/breeze ] && ysy --needed --noconfirm aur/plasma5-themes-breath

if [ ! -d "$HOME/.nvm" ]; then
	  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" || true  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[ -s "$NVM_DIR/nvm.sh" ] && nvm install 20.14.0 && npm install -g npm@latest && curl -fsSL https://get.pnpm.io/install.sh | sh -

if [ ! -f "/home/mchu/.gvm" ]; then
    rm -rf /home/mchu/.gvm
    # Script fails with ZSH - manually add source entry to .zshrc
	  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    #[[ -s "${HOME}/.gvm/scripts/gvm" ]] && . ${HOME}/.gvm/scripts/gvm || true
fi

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && gvm install go1.22

if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
fi

# sudo chsh -s /usr/bin/zsh mchu

mkdir -p /tmp/s5cmd \
  && jurl=$(curl -s https://api.github.com/repos/peak/s5cmd/releases/latest | grep "browser_download_url.*_Linux-64bit.tar.gz")
  && jurl=$(echo {$jurl} | jq -r ".browser_download_url")
  && curl -Lo /tmp/s5cmd/s5cmd.tar.gz $jurl
  && cd /tmp/s5cmd
  && tar -xvf /tmp/s5cmd/s5cmd.tar.gz
  && sudo mv /tmp/s5cmd/s5cmd /usr/bin/

sudo ln -s /usr/bin/podman /usr/bin/docker    
