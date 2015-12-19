#
# ~/.bashrc
#

# If not running interactively, don't do anything
force_color_prompt=yes
[[ $- != *i* ]] && return

# Path variables
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/bowan/bin:/home/dev/go/bin
GOPATH=/home/bowan/dev/go

function git_changes {
	[[ $(git status 2> /dev/null | tail -n1) != "no changes added to commit (use \"git add\" and/or \"git commit -a\")" ]] && echo "*"
}

function get_git {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(git_changes))/"
}

# Colors for the name, hostname, and current folder
PS1='\[\e[0;0m\][\[\e[1;36m\]\u\[\e[0;0m\]@\[\e[0;36m\]\h \[\e[1;33m\]\W\[\e[0;0m\]]\e[1;37m\] $(get_git)\e[0;0m\]\n\$ '

# Aliases
alias ls='ls --color=auto'
