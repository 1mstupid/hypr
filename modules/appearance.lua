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
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		dim_inactive = true,
		dim_strength = 0.12,

		blur = {
			enabled = true,
			size = 20,
			passes = 8,
			noise = 0,
			vibrancy = 0.35,
			vibrancy_darkness = 0.35,
			brightness = 0.8,
			contrast = 1.0,
			special = true,
			new_optimizations = true,
			variant = "acrylic",
			acrylic = {
				aberration = 0.485,
				bulb = 120,
				clarity = 0.20,
				refraction = 55,
				tint = 0x14EEF5FF,
			},
		},

		shadow = {
			enabled = true,
			range = 28,
			render_power = 3,
			color = 0x920a0a0a,
		},
	},
})
