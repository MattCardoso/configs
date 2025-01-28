# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="obraum"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000000
SAVEHIST=10
HIST_EXPIRE_DUPS_FIRST="true"
HIST_IGNORE_ALL_DUPS="true"
HIST_IGNORE_SPACE="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/configs/ohmyzsh/custom
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# eval "$(rbenv init - zsh)"



plugins=(
	git
	# gitignore
	python
#	pyenv
	pip
	golang
	kubectl
	kube-ps1
	minikube
	docker
	docker-compose
	colorize
	wd
#	gcloud
  aws
	zsh-completions
	brew
	thefuck
	history
	fzf
	zsh-interactive-cd
	# vault
	ruby
	rbenv
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_PREFIX="\n ↳ <"
KUBE_PS1_SUFFIX=">%{${fg_no_bold[blue]}%} $ %{$reset_color%}"
PROMPT=$PROMPT'$(kube_ps1)'
SHOW_AWS_PROMPT=true

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias getzsh="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias py="python3.10"
alias cpyenv="py -m venv env"
alias apyenv="source env/bin/activate"
alias upgrade="sudo apt update && sudo apt upgrade"
alias gclist="gcloud config configurations list"
alias gcldev="gcloud config configurations activate devcluster"
alias gclprod="gcloud config configurations activate prodcluster"
# alias k9s="$HOME/work/ops/k9s/execs/k9s"
# alias docker="sudo docker"
alias xcopy="xclip -sel clip"
alias mongostart=""
# alias vpnu="nmcli connection up mateus.cardoso@getninjas.com.br"
# alias vpnd="nmcli connection down mateus.cardoso@getninjas.com.br"
alias exercism="$HOME/exercism/exercism"
alias kns="kubens"
alias kcx="kubectx"
alias kg="kubectl get"
alias kge="kubectl get events"
alias awsume=". awsume"
alias tg="terragrunt"
alias tgi="tg init"
alias tgp="tg plan"
alias tgpf="tgp -out=tfplan"
alias tga="tg apply"
alias tgap="tga 'tfplan'"
#alias aws='docker run --rm -it public.ecr.aws/aws-cli/aws-cli'
function myip(){ curl -S ifconfig.me }

source /etc/zsh_command_not_found

function suscj(){kubectl patch cronjobs.batch $1 -p '{"spec": {"suspend": true}}'}

export KUBE_EDITOR="/usr/bin/subl -w"

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

function addgi() { curl -sLw '\n' https://www.toptal.com/developers/gitignore/api/$@ ;}
function gi() { curl -fLw '\n' https://www.toptal.com/developers/gitignore/api/"${(j:,:)@}" }

_gitignoreio_get_command_list() {
  curl -sfL https://www.toptal.com/developers/gitignore/api/list | tr "," "\n"
}

_gitignoreio () {
  compset -P '*,'
  compadd -S '' `_gitignoreio_get_command_list`
}

compdef _gitignoreio gi



# PATH=$PATH:$HOME/work/ops/ops-scripts
# PATH=$PATH:$HOME/.istioctl/bin 
# PATH=$PATH:$HOME/work/ops/istio-1.11.0/bin
PATH=$PATH:$HOME/go/bin
# PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$HOME/.linuxbrew/bin
PATH=$PATH:$HOME/configs/bin
PATH=$PATH:$HOME/neovim/bin
PATH=$PATH:/usr/local/go/bin
# PATH=$PATH:$HOME/exercism
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOMEBREW_PREFIX/bin/terraform terraform
# eval "$(register-python-argcomplete pipx)"

# Created by `pipx` on 2022-02-03 11:51:25
export PATH="$PATH:/home/mateus-cardoso/.local/bin"
export MYVIMRC="$HOME/configs/vim/.vimrc"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export AWS_EC2_METADATA_DISABLED=true


complete -o nospace -C /home/linuxbrew/.linuxbrew/bin/vault vault
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
# bun completions
[ -s "/home/mateus-cardoso/.oh-my-zsh/completions/_bun" ] && source "/home/mateus-cardoso/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


fix_wifi() {
    service network-manager stop
    modprobe -r r8169
    modprobe r8169
    service network-manager start 
}

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
. "/home/mateus-cardoso/.deno/env"
