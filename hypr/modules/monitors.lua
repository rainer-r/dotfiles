------------------
---- MONITORS ----
------------------

-- ~/.config/hypr/modules/monitors.lua
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "0.93",
})

-- Example for named monitors (uncomment and adjust as needed):
-- hl.monitor({ output = "DP-1",   mode = "2560x1440@144", position = "0x0",    scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "2560x0", scale = 1 })

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
	mirror = "eDP-1",
})

-- Assign Workspaces 1 through 10 strictly to the laptop screen
for i = 1, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "eDP-1",
	})
end
