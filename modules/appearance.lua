hl.config({
	general = {
		border_size = 0, -- Maps from border_width = 0
		gaps_in = 5,
		gaps_out = 10,
		["col.active_border"] = _G.colors.active_border,
		["col.inactive_border"] = _G.colors.inactive_border,
		layout = "master",
	},
	decoration = {
		rounding = 20, -- Maps from corner_radius = 20
		active_opacity = 1.0, -- Maps from drag_opacity = 1.0
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0, -- Ensures opaque fullscreen behavior

		blur = {
			enabled = true,
			size = 13, -- Hyprland's equivalent to blur radius
			passes = 2, -- passes = 2
			noise = 0.0, -- noise = 0
			brightness = 0.8,
			contrast = 2.0,
			vibrancy = 0.95, -- Maps closely to saturation adjustment
		},

		shadow = {
			enabled = true,
			range = 30, -- Maps from softness = 30
			render_power = 3,
			color = "#000000FF",
		},
	},
})
