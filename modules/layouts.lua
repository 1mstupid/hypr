hl.config({
	general = {
		layout = "master", -- Default layout mode
	},
	master = {
		new_on_top = true,
		mfact = 0.55,
	},
	scrolling = {
		default_extent_fraction = 0.5,
		center_underfull_strip = true,
		center_focused = "never",
	},
	monocle = {
		-- Monocle layout settings (forces windows to maximize/fullscreen within the workspace view)
		no_border_on_monocle = true,
	},
})
