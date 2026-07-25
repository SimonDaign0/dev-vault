hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user restart xdg-desktop-portal")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11,ssh")

    -- 4. Background services
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("brightnessctl -s set 50%")
    hl.exec_cmd("waybar")
    hl.exec_cmd("$HOME/.config/hypr/scripts/power_listener")
    hl.exec_cmd("hyprsunset")
end)
