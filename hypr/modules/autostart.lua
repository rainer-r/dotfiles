-------------------
---- AUTOSTART ----
-------------------

-- ~/.config/hypr/modules/autostart.lua
-- Programs to launch on Hyprland startup
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	-- Application Launcher
	hl.exec_cmd("hyprlauncher -d")

	-- Status bar (only if not already running)
	hl.exec_cmd("pgrep -x waybar || waybar")

	-- NetworkManager.service
	hl.exec_cmd(
		"systemctl is-active --quiet NetworkManager.service || sudo systemctl enable --now NetworkManager.service"
	)

	-- Notification daemon
	hl.exec_cmd("dunst")

	-- Network tray applet
	-- hl.exec_cmd("nm-applet")

	-- Bluetooth applet
	-- hl.exec_cmd("blueman-applet")

	-- Polkit authentication agent
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- screenshot tool
	-- changed to: hyprshot no need for exec_cmd
	-- hl.exec_cmd("flameshot")

	-- XDG portal setup (staggered to avoid race conditions)
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY XAUTHORITY")
	hl.exec_cmd("sleep 2 && systemctl --user restart xdg-desktop-portal-hyprland")
	hl.exec_cmd("sleep 4 && systemctl --user restart xdg-desktop-portal")

	-- keyring for VSCode-Code OSS / Secrets
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

	-- sunshine (game streaming) — delayed to let compositor settle
	hl.exec_cmd("sleep 3 && systemctl --user restart sunshine")

	-- Optional:
	-- hl.exec_cmd("wayvnc 127.0.0.1 5900")

	-- wallpaper
	hl.exec_cmd("pgrep -x hyprpaper || hyprpaper")

	-- screen lock
	hl.exec_cmd("hyprlock")
end)
