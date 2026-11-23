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
			size = 12,
			passes = 4,
			noise = 0,
			vibrancy = 0.5,
			vibrancy_darkness = 0.25,
			brightness = 0.9,
			contrast = 0.9,
			special = true,
			new_optimizations = true,
			variant = "acrylic",

			acrylic = {
				aberration = 0.025,
				bulb = 48.0,
				clarity = 0.90,
				refraction = 12.0,
				tint = 0x08000000,
			},
		},
	},
})
