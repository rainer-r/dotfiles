---------------
---- INPUT ----
---------------

-- ~/.config/hypr/modules/input.lua
-- Keyboard, mouse, touchpad, and gesture configuration
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		accel_profile = "flat",
		sensitivity = 0, -- -1.0 to 1.0, 0 = no modification

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- 3-finger horizontal swipe to switch workspaces
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
