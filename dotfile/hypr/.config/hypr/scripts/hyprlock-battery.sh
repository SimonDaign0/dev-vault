#!/usr/bin/env bash
BATTERY_DIR="/sys/class/power_supply/BAT0"
if [ ! -d "$BATTERY_DIR" ]; then
    BATTERY_DIR="/sys/class/power_supply/BAT1"
fi
capacity=$(cat "$BATTERY_DIR/capacity")
status=$(cat "$BATTERY_DIR/status")

ICON=""
if [ "$capacity" -lt 5 ]; then
    ICON=""
elif [ "$capacity" -lt 20 ]; then
    ICON=""
elif [ "$capacity" -lt 50 ]; then
    ICON=""
elif [ "$capacity" -lt 80 ]; then
    ICON=""
fi


if [ "$status" = "Charging" ]; then
    echo "$capacity% "
else
    echo "$capacity% ${ICON}"
fi
