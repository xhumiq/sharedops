# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

plugins=(
  git
  macos
  golang
  kubectl
  kops
  node
  npm
)

source $ZSH/oh-my-zsh.sh

# User configuration

export APP_ENV="dev"
export BACK_END_ENV="loc"
export PROJ_STAGE=DEV
export RC_SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
export CHROME_BIN_PATH="/usr/bin/chromium"
export CURRENT_PROJ=""
export DOCKER_COMPOSE_PROJ="LOC"

# %{$fg[red]%}%m%{$reset_color%}

PROMPT='
%{$fg[cyan]%}%~%{$reset_color%} %{$fg[gray]%}%t %{$reset_color%}$(git_prompt_short_sha)$(git_prompt_info) [%{$fg[red]%}${CURRENT_PROJ}%{$reset_color%}_${KUBECONFIG:t:r}/${KUBE_NAMESPACE}_${BACK_END_ENV}] $(prompt_docker_machine_name)
%{$fg[red]%}%!%{$reset_color%} $(prompt_char) : '

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%}±%{$reset_color%}" && return
  echo "%{$fg[cyan]%}.%{$reset_color%}"
}

function prompt_docker_machine_name(){
  [ ! -z "$DOCKER_MACHINE_NAME" ] && echo "%{$fg[red]%}[$DOCKER_MACHINE_NAME]%{$reset_color%}"
}

pathadd() {
  newelement=${1%/}
  if [ -d "$1"] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH="$PATH:$newelement"
    else
      PATH="$newelement:$PATH"
    fi
  fi
}

pathrm() {
  PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}

export PATH=$PATH:${HOME}/.local/bin

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx;
fi

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTSIZE=10000
export EDITOR="code"
export FILE="ranger"
export TERMINAL="alacritty"
export BROWSER="firefox"
alias du="dust"
alias ls="exa"
alias la="exa -al"
alias loc~="source $RC_SCRIPTPATH/.loc_rc"
alias loc!="$EDITOR $RC_SCRIPTPATH/.loc_rc"
alias code~="ysy aur/visual-studio-code-bin"
alias myip="ip addr | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | head -n 1"
alias ping+="pw-cat --volume 0.5 ~/Music/alert.wav"
alias services!='systemctl list-units --type=service'
alias tv+='sudo teamviewer --daemon start'
alias tv-='sudo teamviewer --daemon stop'
alias tv~='sudo teamviewer --daemon stop && sudo teamviewer --daemon start'
alias nvpn+='sudo systemctl start nordvpnd && sudo nordvpn login'
alias nvpn-='sudo systemctl stop nordvpnd'
alias nvpn~='sudo nordvpn connect'
alias nvpn!='sudo nordvpn countries'
alias nvpn='sudo nordvpn'
alias kvm-net+='sudo virsh net-start default'
alias fix_dir_mod='find . -type d -exec chmod 755 {} \;'
alias fix_file_mod='find . -type f -exec chmod 644 {} \;'

alias nssh='TERM=xterm-256color ssh "$@"'
alias qhosts="$EDITOR /etc/hosts"
alias qknown="$EDITOR ~/.ssh/known_hosts"
alias qkhosts="$EDITOR ~/.ssh/known_hosts"
alias qkeys="$EDITOR ~/Library/KeyBindings/DefaultKeyBinding.Dict"
alias fcnt='find . -type f | wc -l'
alias ext_ip='curl ifconfig.co'
alias allow_wrap='tput smam'
alias remove_wrap='tput r	mam'
alias mux='tmuxp'
alias mux-='tmux kill-server'
alias kmux="tmux kill-session -t"
alias dps="docker ps --all"
alias dexec="docker exec -it"
alias dlogs="docker logs"
alias dc="docker-compose"
alias dm!="eval $(docker-machine env -u)"
alias dm="docker-machine"
dm_use(){eval $(docker-machine env $1)}

#eval "$(_TMUXP_COMPLETE=source tmuxp)"

pathadd "$HOME/.rvm/bin" after
pathadd "$HOME/Library/Python/2.7/bin" after
pathadd "/var/lib/snapd/snap/bin" after

export PATH

ysy() {
  yay -S --overwrite --redownloadall --removemake --rebuildall --noeditmenu --nodiffmenu --cleanafter --answerclean a --answerupgrade a $@
}

vmnet+(){
  sudo virsh net-start default
}

# eval "$(rbenv init -)"

bakcfg(){
  git --git-dir /run/media/mchu/C055-6D54/config/.git --work-tree /home/mchu/.local/.env add . --all
  git --git-dir /run/media/mchu/C055-6D54/config/.git --work-tree /home/mchu/.local/.env commit -am "daily commit"
}

diffcfg(){
  git --git-dir /run/media/mchu/C055-6D54/config/.git --work-tree /home/mchu/.local/.env diff
}

bkdiff(){
  code -d /run/media/mchu/C055-6D54/config/current/$1 $HOME/$1
}

[ -s "${HOME}/.jabba/jabba.sh" ] && source "${HOME}/.jabba/jabba.sh"

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

#source /home/mchu/.config/broot/launcher/bash/br

alias kcg="kc get"
alias kca="kcg svc,deployment,pods,job,horizontalpodautoscaler,ingress"
alias kcai="kcg svc,deployment,pods,job,horizontalpodautoscaler,ingress,DestinationRule,VirtualService,Gateway"
alias kc+="kc create -f"
alias kc-="kc delete"
alias ke="EDITOR=vim kc edit"
alias kc!="kc describe"
alias kns="kubectl get namespaces"
alias kpall="kubectl get pods --all-namespaces"
alias krcs="kubectl get rc"
alias kings="kubectl get ing"
alias king="kubectl describe ing"
alias kinc="kubectl get pods"
alias krc-="kubectl delete rc"
alias ksvcs='kubectl get service "-o=custom-columns=NAME:.metadata.name,HOST:.status.loadBalancer.ingress[*].hostname,PORT:.spec.ports[*].targetPort"'
alias kexec="kc exec"
alias kcfg="kubectl config view"
alias max_pods="kubectl get nodes -o json | jq '.items[].status.capacity.pods'"

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

func docker_clear_cache(){
  docker kill $(docker ps -q)
  docker rm $(docker ps --filter=status=exited --filter=status=created -q)
  docker rmi $(docker images -a -q)
  docker image prune -a
  docker system prune
}

func qssh(){
	fcfg=~/.ssh/config
	[[ ! -z "$1" ]] && fcfg="$HOME/.ssh/$1/config"
	shift
	code $fcfg $@
}

func kc_remove_app(){
  kc- service/$1
  kc- destinationrule/$1
  kc- gateway/$1-gateway
  kc- virtualservice/$1
}

func kc_remove_svc(){
  kc- service/nl-$1
  kc- destinationrule/$1
  kc- endpoints/nl-$1
  kc- gateway/$1-gateway
  kc- virtualservice/$1
}

func kcsvc!(){
  kc! service/nl-$1
  kc! destinationrule/$1
  kc! endpoints/nl-$1
  kc! gateway/$1-gateway
  kc! virtualservice/$1
}

ovpn(){
	sudo openvpn ${CONFIG_REPO}/configs/.ovpn/$1.ovpn
}

kc(){
	if [ -z ${KUBE_NAMESPACE+x} ]; then echo kubectl $@; else echo kubectl -n $KUBE_NAMESPACE $@; fi
	if [ -z ${KUBE_NAMESPACE+x} ]; then kubectl $@; else kubectl -n $KUBE_NAMESPACE $@; fi
}


kuse(){
	kenv=$1
	[ $kenv = "dev" ] && kenv="development"
	[ $kenv = "prod" ] && kenv="production"
	[ $kenv = "is" ] && kenv="istio-system"
	[ $kenv = "ks" ] && kenv="kube-system"
	export KUBE_NAMESPACE=$kenv
}

ause(){
	export AWS_PROFILE=$1
}

randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-24};echo;}

klogs(){
	pn=$1
	xy=($(kc get po -oname | grep $1))
	shift
	idx=${1:-1}
	shift
	kc logs ${xy[idx]:4:50} $@ --tail 1000 -f
}

klogsc(){
	pn=$1
	xy=($(kc get po -oname | grep $1))
	shift
	idx=${1:-1}
	shift
	kc logs ${xy[idx]:4:50} $@ -c $pn --tail 1000 -f
}

kssh(){
	xy=($(kc get po -oname | grep $1))
	shift
	idx=${1:-1}
	shift
	kexec -it ${xy[1]:4:50} $@ /bin/sh
}

kcd(){
	kubectl describe $@
}

kspods(){
	#kuse $APP_ENV && \
	kubectl get pods -l app=$1
}

use_env(){
	export APP_ENV=$1
	echo APP_ENV=$APP_ENV
}

chrome () {
	open -n -a Chromium --args  --user-data-dir=/Users/mchu/.chrome/$1
}

gchrome () {
	open  -n -a Google\ Chrome\ Canary --args --profile-directory=$1
}

viewcert () {
	openssl x509 -in $1 -text -noout
}

dexecsh () {
	docker exec -it $1 /bin/sh
}

dm+(){
  eval $(docker-machine env $1)
}

cdd(){
	eval tpath=\$1_PATH
	tpath="$(echo "$tpath" | tr /a-z/ /A-Z/)"
	eval cd \$$tpath
}

coded(){
	eval tpath=\$1_PROJ
	tpath="$(echo "$tpath" | tr /a-z/ /A-Z/)"
	eval code \$$tpath
}

rsa_cp(){
	cp ~/.ssh/$1_rsa ~/.ssh/id_rsa
	cp ~/.ssh/$1_rsa.pub ~/.ssh/id_rsa.pub
}

rsa_rst(){
	cp ~/.ssh/id_rsa.org ~/.ssh/id_rsa
	cp ~/.ssh/id_rsa.pub.org ~/.ssh/id_rsa.pub
}

kc_auth(){
	export KUBECONFIG=${CONFIG_REPO}/.kube/configs/$1.config
}

own_local(){
	sudo chown -R mchu:mchu ${CONFIG_REPO}/configs
	sudo chown -R mchu:mchu ${CONFIG_REPO}/projects
}

kdep~(){
	kc- deployment.apps/$1-set
	envsubst < ${1}/deploy.yml | kubectl create -f -
}

ksvc~(){
	kubectl delete service $1
	envsubst < ${1}/service.yml | kubectl create -f -
}

kdepsvc~(){
	kdep~ $@
	ksvc~ $@
}

kc~(){
	kc- deployment.apps/${1}-set
	envsubst < ${2} | kubectl create -f -
}

ksetns(){
	kubectl config set-context $(kubectl config current-context) --namespace=$1
}

ksetctx(){
	kubectl config set-context dev --namespace=development \
		--cluster=${KOPS_CLUSTER_NAME} --user=${KOPS_CLUSTER_NAME}
	kubectl config set-context qa --namespace=staging \
		--cluster=${KOPS_CLUSTER_NAME} --user=${KOPS_CLUSTER_NAME}
	kubectl config set-context prod --namespace=production \
		--cluster=${KOPS_CLUSTER_NAME} --user=${KOPS_CLUSTER_NAME}
}

kview(){ 
	obj=$2
	if [ "$1" = "cmap" ] || [ "$1" = "configmap" ] || [ "$1" = "cfgmap" ]; then
		if [ "$2" = "ingress" ]; then
			obj="ingress-controller-leader-nginx"
		fi
		if [ "$2" = "tcp" ]; then
			obj="tcp-services"
		fi
		if [ "$2" = "udp" ]; then
			obj="udp-services"
		fi
		if [ "$2" = "nginx" ]; then
			obj="nginx-configuration"
		fi
		kubectl get configmap $obj -o yaml
	elif [ "$1" = "acct" ] || [ "$1" = "serviceaccount" ]; then
		if [ "$2" = "ingress" ]; then
			obj="nginx-ingress-serviceaccount"
		fi
		kubectl get serviceaccount $obj -o yaml
	elif [ "$1" = "role" ]; then
		if [ "$2" = "ingress" ]; then
			obj="nginx-ingress-role"
		fi
		kubectl get role $obj -o yaml    
	elif [ "$1" = "rbind" ] || [ "$1" = "rolebinding" ]; then
		if [ "$2" = "ingress" ]; then
			obj="nginx-ingress-role-nisa-binding"
		fi
		kubectl get RoleBinding $obj -o yaml    
	elif [ "$1" = "dep" ] || [ "$1" = "deploy" ] || [ "$1" = "deployment" ]; then
		if [ "$2" = "ingress" ]; then
			obj="nginx-ingress-controller"
		fi
		kubectl get deployment $obj -o yaml    
	elif [ "$1" = "svc" ] || [ "$1" = "srv" ] || [ "$1" = "service" ]; then
		if [ "$2" = "ingress" ]; then
			obj="ingress-nginx"
		fi
		kubectl get service $obj -o yaml
	elif [ "$1" = "ingcfg" ]; then
		kview cmap ingress
		kview cmap tcp
		kview cmap udp
		kview acct ingress
		kview role ingress
		kview rbind ingress
		kview cmap nginx
		kview dep ingress
		kview svc ingress
	fi
}

kingctl-(){
	kc- service/ingress-nginx
	kc- deployment.extensions/nginx-ingress-controller
	kc- rolebinding/nginx-ingress-role-nisa-binding
	kc- role/nginx-ingress-role
	kc- serviceaccount/nginx-ingress-serviceaccount
	kc- configmap/ingress-controller-leader-nginx
	kc- configmap/tcp-services
	kc- configmap/udp-services
	kc- configmap/nginx-configuration
}

create_ssh_keygen(){
	# $1 ~/.ssh/id_rsa
	ssh-keygen -q -t rsa -N '' -f $1 <<<y 2>&1 >/dev/null
}

dk_clean(){
	docker rm $(docker ps -qa --no-trunc --filter "status=created")
	# docker rm $(docker ps -qa --no-trunc --filter "status=paused")
	# docker rm $(docker ps -qa --no-trunc --filter "status=exited")
	# docker rm $(docker ps -qa --no-trunc --filter "status=dead")
	docker rm $(docker ps -qa --no-trunc --filter "status=exited")
	docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
	docker volume rm $(docker volume ls -qf dangling=true)
}

clear_docker(){
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  docker volume rm $(docker volume ls -f dangling=true -q)
}

ss_cert(){
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout nginx-selfsigned.key \
		-out nginx-selfsigned.crt && \
	sudo openssl dhparam -out dhparam.pem 2048
}

dc+(){
  dfile=${1:-docker-compose.yml}
  shift
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile build  || { echo "docker compose build failed";  return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile pull   || { echo "docker compose pull failed";   return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile down   || { echo "docker compose down  failed";  return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile up $@  || { echo "docker compose up    failed";  return 1; }
}

dc~(){
  dfile=${1:-docker-compose.yml}
	shift
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile build  || { echo "docker compose build failed";  return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile pull   || { echo "docker compose pull failed";   return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile down   || { echo "docker compose down  failed";  return 1; }
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile up -d $@  || { echo "docker compose up    failed";  return 1; }
}

dc-(){
  dfile=${1:-docker-compose.yml}
  shift
  docker-compose -p $DOCKER_COMPOSE_PROJ -f $dfile down $@  || { echo "docker compose down  failed";  return 1; }
}

[ -s "${HOME}/.local/.env/configs/.loc_rc" ] && source "$HOME/.local/.env/configs/.loc_rc"