-- kwallet
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("brightnessctl -s set 50%")
    hl.exec_cmd("waybar")
    hl.exec_cmd("sh $HOME/.config/hypr/scripts/power_listener.sh")
end)
