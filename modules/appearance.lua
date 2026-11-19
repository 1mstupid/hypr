hl.config({
	general = {
		border_size = 0, -- Maps from border_width = 0
		gaps_in = 5,
		gaps_out = 10,
		layout = "master",
	},
	decoration = {
		rounding = 18,
		rounding_power = 2.0,
		active_opacity = 0.8,
		inactive_opacity = 0.4,
		dim_inactive = false,
		dim_strength = 0.045,
		dim_special = 0.07,

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			noise = 0.125,
			vibrancy = 0.2,
			brightness = 0.85,
			contrast = 1.3,
			special = true,
			new_optimizations = true,
			popups = true,
			ignore_opacity = true,
			xray = false,
		},

		shadow = {
			enabled = true,
			range = 50,
			render_power = 4,
			color = "0x48000000",
		},
	},
})
