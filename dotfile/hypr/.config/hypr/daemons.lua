-- kwallet
hl.on("hyprland.start", function()
    hl.exec_cmd(
        "/usr/lib/pam_kwallet_init & \
        brightnessctl -set 50% & \
        bluetoothctl power off & \
        hyprpaper"
    )
end)
