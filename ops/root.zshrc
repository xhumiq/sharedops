# File: ${HOME}/.zshrc

export TERM=rxvt-unicode-256color
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="smt"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export BACK_END_ENV="remote"
export PROJ_STAGE=PROD

PROMPT='
%{$fg[red]%}%m%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%} %{$fg[gray]%}%t %{$reset_color%}$(git_prompt_short_sha)$(git_prompt_info) [%{$fg[red]%}${CURRENT_PROJ}%{$reset_color%}_${AWS_PROFILE}/${PROJ_STAGE} @${AWS_REGION}] $(prompt_docker_machine_name)
%{$fg[red]%}%!%{$reset_color%} $(prompt_char) : '

alias du="dust"
alias dk="sudo docker"
alias media_ak="sudo vim /home/media/.ssh/authorized_keys"
alias deb~="sudo apt-get install debconf-utils"
alias deb~="sudo debconf-show --listowners"
alias version="cat /etc/motd"
alias qhosts="sudo vim /etc/hosts"
alias qweb="sudo vim /etc/nginx/site-enabled/"
alias web#="sudo tail /var/log/nginx/"
alias web!="sudo systemctl status nginx"
alias web~="sudo systemctl restart nginx"
alias web+="sudo systemctl start nginx"
alias web-="sudo systemctl stop nginx"

#jitsi-meet-prosody
#jitsi-videobridge2
#jicofo
#jitsi-meet-web-config
#jitsi-meet-turnserver

function tailsl(){
  sudo tail /var/log/syslog -n 200 -f
}

function dkssh(){
  if [[ -z $2 ]]; then
    sudo docker exec -it $1 /bin/sh
  else
    shift
    sudo docker exec -it $1 $@
  fi
}

function qctab(){
  sudo vim /etc/cron.d/$1
}

function qhosts(){
  sudo vim /etc/hosts
}

function qssh(){
  vim ~/.ssh/config
}

function qkhosts(){
  vim ~/.ssh/known_hosts
}

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%}±%{$reset_color%}" && return
  echo "%{$fg[cyan]%}.%{$reset_color%}"
}

function prompt_docker_machine_name(){
  [ ! -z "$DOCKER_MACHINE_NAME" ] && echo "%{$fg[red]%}[$DOCKER_MACHINE_NAME]%{$reset_color%}"
}

function baketc(){
  sudo (
    cd /etc
    tar -czf /home/mchu/baketc.tgz /etc/jitsi /etc/prosody /etc/nginx
    chown mchu:mchu /home/mchu/baketc.tgz
    chmod 640 /home/mchu/baketc.tgz
  )
}

. "$HOME/.cargo/env"
