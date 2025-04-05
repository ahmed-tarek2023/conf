#!/bin/bash
while true; do
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [[ $BATTERY_LEVEL -le 20 && "$STATUS" == "Discharging" ]]; then
        notify-send -u critical "⚠ Low Battery" "Battery level is at $BATTERY_LEVEL%. Please plug in the charger."
        sleep 180  # Wait for 5 minutes before checking again
    fi

    sleep 60  # Check battery status every 60 seconds
done
