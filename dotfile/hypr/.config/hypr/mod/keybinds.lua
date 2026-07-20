-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local super = "SUPER"
local ctrl_super_alt = "CONTROL + SUPER + ALT"
local terminal = "kitty"
local browser = "firefox"
local fileManager = "dolphin"
local tglbar = "killall waybar || waybar"
local printScreen = "hyprshot --mode region -o ~/Pictures/screenshots"

local move_window_smart

-- logout
hl.bind(super .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(super .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(super .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + B", hl.dsp.exec_cmd(tglbar))
hl.bind(super .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(super .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(super .. " + PRINT", hl.dsp.exec_cmd(printScreen))
hl.bind(super .. " + 1", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + 2", hl.dsp.exec_cmd(browser))

hl.bind(super .. " + C", hl.dsp.window.close())
hl.bind(super .. " + W", hl.dsp.window.fullscreen())

hl.bind(super .. " + ALT + LEFT", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(super .. " + ALT + RIGHT", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(super .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(ctrl_super_alt .. " + right", function() move_window_smart("r") end, { description = "Smart move right" })
hl.bind(ctrl_super_alt .. " + left", function() move_window_smart("l") end, { description = "Smart move left" })
hl.bind(ctrl_super_alt .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(ctrl_super_alt .. " + down", hl.dsp.window.move({ direction = "down" }))


hl.bind(super .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(super .. " + J", hl.dsp.layout("togglesplit"))

--------------
---- MISC ----
--------------
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(super .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(super .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(super .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--hl.bind(super .. " + R", hl.dsp.exec_cmd(menu))
--hl.bind(super .. " + P", hl.dsp.window.pseudo())
-- hl.bind(super .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(super .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-------------------
---- FUNCTIONS ----
-------------------
-- Helper function to move a window, or shift workspaces if at the edge
function move_window_smart(dir)
    local w = hl.get_active_window()
    local m = hl.get_active_monitor()

    -- Defensive check: ensure both window and monitor objects exist
    if not w or not m then return end

    -- Ensure the geometry tables exist before indexing '.x' or '.y'
    local w_at = w.at or { x = 0, y = 0 }
    local w_size = w.size or { x = 0, y = 0 }

    local m_pos = m.position or { x = 0, y = 0 }
    local m_width = m.size and (m.size.x or m.size.width) or 0

    if w_at.x == 0 and w_size.x == 0 then
        hl.dispatch(hl.dsp.window.move({ direction = dir }))
        return
    end

    local threshold = 80
    local at_edge = false

    if dir == "r" or dir == "right" then
        -- Check if the window's right edge is near the monitor's right edge
        if (w_at.x + w_size.x) >= (m_pos.x + m_width) - threshold then
            at_edge = true
        end
    elseif dir == "l" or dir == "left" then
        -- Check if the window's left edge is near the monitor's left edge
        if w_at.x <= m_pos.x + threshold then
            at_edge = true
        end
    end

    if at_edge then
        local target_ws = (dir == "r" or dir == "right") and "r+1" or "r-1"
        hl.dispatch(hl.dsp.window.move({ workspace = target_ws, follow = true }))
    else
        hl.dispatch(hl.dsp.window.move({ direction = dir }))
    end
end
