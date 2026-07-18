-- kwallet
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("brightnessctl -set 50%")
    hl.exec_cmd("bluetoothctl power off")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
end)
