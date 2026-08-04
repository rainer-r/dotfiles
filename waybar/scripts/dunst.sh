#!/usr/bin/env bash
# ~/.config/waybar/scripts/dunst.sh
# Shows bell icon; turns muted when dunst is paused

PAUSED=$(dunstctl is-paused 2>/dev/null)

if [ "$PAUSED" = "true" ]; then
    echo "󰂛"   # muted bell
else
    echo "󰂚"   # normal bell
fi
