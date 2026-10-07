# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom Shell scripts
export PATH="$HOME/.local/bin:$PATH"

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
alias vault='z ~/dev-vault && exit'
alias kt='java -jar'
alias studio='QT_QPA_PLATFORM=xcb android-studio & exit'
alias calc='qalc'
# alias xamp='xhost +si:localuser:root && sudo /opt/lampp/manager-linux-x64.run'
alias xamp='sudo xampp restart all'
alias serv='cd /opt/lampp/htdocs'
alias phpconf='sudo nano /opt/lampp/etc/httpd.conf'
alias horaire='imv ~/Pictures/horaire.png'
alias shark='xhost +si:localuser:root && sudo -E wireshark'
alias replay='sudo tcpreplay -i wlo1'
alias trans='z /app-php && exit'

parse_git_branch() {
    git branch --show-current 2> /dev/null
}

export PS1='\[\e[0m\][\u \[\e[38;5;209m\]\W$(BRANCH=$(parse_git_branch); [[ -n "$BRANCH" ]] && echo " \[\e[33m\]($BRANCH)")\[\e[0m\]]\$ '
export PATH="$HOME/.cargo/bin:$PATH"
