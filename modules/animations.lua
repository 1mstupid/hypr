hl.config({
	animations = {
		enabled = true,
		bezier = {
			-- the shell's OutCubic: in-place movement and fades (carousel, pulls, pill width)
			"shellOut, 0.33, 1.0, 0.68, 1.0",
			-- the shell's InOutCubic: growing or shrinking from a corner (the pill morph)
			"shellInOut, 0.65, 0.0, 0.35, 1.0",
		},
		animation = {
			-- Windows: open a little slower than they close
			"windowsIn, 1, 3, shellOut, slide", -- 300 ms
			"windowsOut, 1, 2, shellInOut, popin 92%", -- 200 ms
			"windowsMove, 1, 2, shellOut", -- 200 ms

			-- Workspaces: same curve as the morph, so switching feels like the panels
			"workspaces, 1, 3, shellInOut, slide", -- 300 ms

			-- Border & Layers
			"border, 1, 2, shellOut", -- 200 ms, eased like the shell's colour changes
			"fade, 1, 2, shellOut", -- 200 ms
			"layers, 1, 3, shellInOut", -- 300 ms, matches the panels growing from the pill
		},
	},
})
