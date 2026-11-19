hl.config({
	input = {
		-- Keyboard
		kb_layout = "us",
		kb_variant = "altgr-intl",
		kb_options = "",
		repeat_rate = 35,
		repeat_delay = 300,
		numlock_by_default = true,

		-- Mouse & Touchpad
		sensitivity = 0.5,
		scroll_factor = 1.0, -- Closest mapping for scroll_wheel_step

		touchpad = {
			natural_scroll = true,
			["tap-to-click"] = true,
		},

		-- Focus & Behavior
		follow_mouse = 1, -- Maps from focus.follows_mouse = true
		middle_click_paste = true,
	},
	cursor = {
		no_hardware_cursors = false, -- Maps from hardware_cursor = true
		inactive_timeout = 0.51, -- Maps from hide_timeout_ms = 510 (in seconds)
		hide_on_key_press = true, -- Maps from hide_when_typing = true
	},
})
