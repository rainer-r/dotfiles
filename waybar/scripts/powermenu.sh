#!/usr/bin/env bash
# ~/.config/waybar/scripts/powermenu.sh
# Lightweight power menu via wofi — no wlogout required

LOCK="󰌾  Lock"
LOGOUT="󰍃  Logout"
SUSPEND="󰤄  Suspend"
REBOOT="󰑓  Reboot"
POWEROFF="󰐥  Shutdown"

CHOICE=$(printf "%s\n%s\n%s\n%s\n%s" \
  "$LOCK" "$LOGOUT" "$SUSPEND" "$REBOOT" "$POWEROFF" |
  wofi \
    --dmenu \
    --prompt "Power" \
    --width 220 \
    --height 210 \
    --no-actions \
    --insensitive \
    --cache-file /dev/null \
    --style "$HOME/.config/wofi/power.css")

case "$CHOICE" in
"$LOCK") swaylock -f ;;
"$LOGOUT") hyprctl dispatch exit ;;
"$SUSPEND") swaylock -f && systemctl suspend ;;
"$REBOOT") hyprshutdown -t 'Restarting...' --post-cmd 'reboot' ;;
"$POWEROFF") hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0' ;;
esac
