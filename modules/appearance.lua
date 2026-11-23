hl.config({
	general = {
		border_size = 0,
		gaps_in = 8,
		gaps_out = 20,
		layout = "master",
	},
	decoration = {
		rounding = 18,
		rounding_power = 2.0,
		active_opacity = 0.92,
		inactive_opacity = 0.85,
		dim_inactive = true,
		dim_strength = 0.12,

		blur = {
			enabled = true,
			size = 8,
			passes = 3,
			noise = 0.015,
			vibrancy = 0.45,
			vibrancy_darkness = 0.25,
			brightness = 0.65,
			contrast = 0.85,
			special = true,
			new_optimizations = true,
			variant = "acrylic",

			acrylic = {
				aberration = 0.1,
				bulb = 10,
				clarity = 0.15,
				refraction = 8,
				tint = 0x08000000,
			},
		},
	},
})
