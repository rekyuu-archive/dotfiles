# ~/.zshrc

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# Compinit
zstyle :compinstall filename '/home/bowan/.zshrc'
autoload -Uz compinit
compinit

# Paths
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/bowan/bin:/home/dev/go/bin"
export GOPATH="/home/bowan/dev/go"

# Aliases
alias ls='ls -Ahl --color=auto --group-directories-first'
alias py='python'

# Prompt customization
autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats "%B%F{2}%u%f %B%b%f"
zstyle ':vcs_info:*' formats "%B%F{2}%u%f %B%b%f"

precmd() { vcs_info }

PROMPT="%{$fg[cyan]%}%B%2~%b %B»%b "
RPROMPT='${vcs_info_msg_0_}'
