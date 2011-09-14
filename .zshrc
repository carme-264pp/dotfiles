# LANG
export LANG=ja_JP.UTF-8

# history setting
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# 補完設定
autoload -Uz compinit
compinit

zstyle ':completion:*' list-colors ''

# cd setting
setopt auto_cd
setopt auto_pushd

# プロント設定
PROMPT="%{${fg[red]}%}[%n@%m] %{${reset_color}%}"
PROMPT2="%{${fg[red]}%}[%n@%m] %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}%~ %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

# keybind
bindkey -e

# no beep sound
setopt nolistbeep

# alias
alias l='ls'
alias ls='ls --color'
alias ll='ls -laF | more'
alias la='ls -aF'
