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
alias ls='ls --color=auto -Aghl'

# Prompt customization
autoload -U colors && colors

function git_changes {
	[[ $(git status 2> /dev/null | tail -n1) != "no changes added to commit (use \"git add\" and/or \"git commit -a\")" ]] && echo "*"
}

function get_git {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(git_changes))/"
}

# [user@host directory] (git branch)
# $ prompt
PROMPT="[%{$fg_bold[cyan]%}%n@%{$fg[cyan]%}%m %{$fg_bold[white]%}%1~%b] %B$(get_git)%b
$ "
