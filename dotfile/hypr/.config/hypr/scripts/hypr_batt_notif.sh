#!/bin/bash
# hyprctl notify [ICON] [TIME_MS] [COLOR] [MESSAGE]

# WARNING = 0
# INFO = 1
# HINT = 2
# ERROR = 3
# CONFUSED = 4
# OK = 5

sleep 0.4 # Give the system time to write the state to the files

LOW_THRESHOLD=20
CRITICAL_THRESHOLD=10

LOW_STATE_FILE=/tmp/battery_low_notified.lock
CRITICAL_STATE_FILE=/tmp/battery_critical_notified.lock

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$STATUS" == "Discharging" ]]; then
    if [[ $CAPACITY -le $CRITICAL_THRESHOLD ]] && [[ ! -f $CRITICAL_STATE_FILE ]]; then
        hyprctl -q notify 0 10000 "rgb(FF0000)" "fontsize:35 Battery critical $CAPACITY% "
        brightnessctl -qs set 5%
        touch "$CRITICAL_STATE_FILE" "$LOW_STATE_FILE"
    elif [[ $CAPACITY -le $LOW_THRESHOLD ]] && [[ ! -f $LOW_STATE_FILE ]]; then
        hyprctl -q notify 0 10000 "rgb(FFFF00)" "fontsize:20 Battery low $CAPACITY% "
        touch "$LOW_STATE_FILE"
    fi
elif [[ "$STATUS" == "Charging" ]] || [[ $CAPACITY -gt $LOW_THRESHOLD ]]; then
    if [[ -f $CRITICAL_STATE_FILE ]]; then
        rm -f $CRITICAL_STATE_FILE $LOW_STATE_FILE
        brightnessctl -qr > /dev/null #-q flag does not work..
        hyprctl -q notify 1 10000 "rgb(0000FF)" "fontsize:20 Charging "
    elif [[ -f $LOW_STATE_FILE ]]; then
        rm -f $LOW_STATE_FILE
        hyprctl -q notify 1 10000 "rgb(0000FF)" "fontsize:20 Charging "
    fi
fi
