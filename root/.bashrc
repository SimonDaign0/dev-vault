alias cls='clear'

if [ "$EUID" -eq 0 ]; then
    PS1='\[\e[0m\][\u@\h \[\e[38;5;209m\]\W \[\e[0m\]]\[\e[1;31m\]\$ '
fi
