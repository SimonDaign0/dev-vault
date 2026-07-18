#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias cls='clear'
alias z='zeditor'
alias zconf='z ~/.config/zed && exit'
alias conf='z ~/.config/hypr/ && exit'
alias barconf='z ~/.config/waybar/ && exit'
alias mkalias='z ~/.bashrc && exit'
alias age="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort -n"
alias discord='webcord --password-store=kwallet6 --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-gpu --disable-gpu-sandbox --disable-software-rasterizer & exit'
alias sconf='z ~/Documents/configs && exit'
