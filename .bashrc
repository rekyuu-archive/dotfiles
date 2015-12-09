#
# ~/.bashrc
#

# If not running interactively, don't do anything
force_color_prompt=yes
[[ $- != *i* ]] && return

# Colors for the name, hostname, and current folder
alias ls='ls --color=auto'
PS1='\[\e[0;0m\][\[\e[1;36m\]\u\[\e[0;0m\]@\[\e[0;36m\]\h \[\e[1;33m\]\W\[\e[0;0m\]]\$ '
