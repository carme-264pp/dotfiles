# LANG
export LANG=ja_JP.UTF-8

# history setting
HISTFILE=~/.zsh_histfile
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history

# basics
autoload -Uz colors
colors
autoload is-at-least

# 補完設定
# load completions
autoload -Uz compinit
compinit
if [ -d /usr/share/zsh-autosuggestions ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -d /usr/share/zsh-highlighting ]; then
    source /usr/share/zsh-highlighting/zsh-highlighting.zsh
fi

zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=31'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:processes' menu yes select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

setopt list_packed
setopt correct

# alias
case ${OSTYPE} in
	darwin*)
		alias ls='ls -G'
		;;
	linux*)
		alias ls='ls --color'
		;;
esac
alias l='ls'
alias ll='ls -lhF'
alias la='ls -aF'
alias lla='ls -alhF'
alias less='less -R'
alias df='df -h'
alias du='du -h'

# cd setting
setopt auto_cd
setopt auto_pushd
setopt mark_dirs
setopt auto_param_slash

functon chpwd() { ls }

# バージョン管理表示
if is-at-least 4.3.10; then
	autoload -Uz vcs_info
	zstyle ':vcs_info:*' formats '(%s)-[%b]'
	zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
	precmd () {
		psvar=()
		LANG=en_US.UTF-8 vcs_info
		[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
	}
fi

# prompt setting
PROMPT="%(!.%{${fg[red]}%}.%{${fg[yellow]}%})%B[%n@%m]%b%{${reset_color}%}%# "
PROMPT2="%_%% "
RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}[%*]"
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

# keybind
bindkey -e

# no beep sound
setopt nolistbeep

# アーカイバ  thank itchyny
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
      *.tar.xz) tar Jxvf $1;;
      *.zip) unzip $1;;
      *.lzh) lha e $1;;
      *.tar.bz2|*.tbz) tar xjvf $1;;
      *.tar.Z) tar zxvf $1;;
      *.gz) gzip -dc $1;;
      *.bz2) bzip2 -dc $1;;
      *.Z) uncompress $1;;
      *.tar) tar xvf $1;;
      *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
