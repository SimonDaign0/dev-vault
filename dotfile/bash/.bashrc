# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias z='zeditor'
alias zconf='z ~/.config/zed && exit'
alias conf='z ~/.config/hypr/ && exit'
alias barconf='z ~/.config/waybar/ && exit'
alias mkalias='z ~/.bashrc && exit'
alias age="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort -n"
alias discord='webcord --password-store=gnome-libsecret --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-gpu --disable-gpu-sandbox --disable-software-rasterizer & exit'
alias silent='cd /usr/share/sddm/themes/silent'
alias py='python'
alias fileshare="echo Ip adress: $(ip route get 1.1.1.1 | awk '{print $7; exit}' || 'Disconnected') && python -m http.server"

parse_git_branch() {
    git branch --show-current 2> /dev/null
}

export PS1='\[\e[0m\][\u \[\e[38;5;209m\]\W$(BRANCH=$(parse_git_branch); [[ -n "$BRANCH" ]] && echo " \[\e[33m\]($BRANCH)")\[\e[0m\]]\$ '
