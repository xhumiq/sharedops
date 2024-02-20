mkdir -p ${HOME}/.local/.env/configs/
chown -R mchu:mchu ${HOME}/.local/.env

xcode-select --install
brew update
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install byobu ranger alacritty brave dust eza mercurial nvm
export JABBA_VERSION=17.0.10
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | zsh && . ~/.jabba/jabba.sh
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

gvm install go1.21
nvm install 20.6.1
jabba install zulu@1.8

brew install pnpm
mkdir -p /plive/starg/
