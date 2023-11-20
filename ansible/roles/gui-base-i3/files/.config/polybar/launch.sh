#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar --reload main &

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" != "eDP1" ]; then
        MONITOR=$m polybar --reload side &
    fi
done

echo "Polybar launched..."