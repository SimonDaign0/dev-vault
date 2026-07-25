alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'

if [ "$EUID" -eq 0 ]; then
    PS1='\[\e[0m\][\[\033[01;31m\]\u \[\e[38;5;209m\]\W\[\e[0m\]]\$ '
fi
