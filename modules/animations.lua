-- Animation curves
local beziers = {
	{
		name = "shellOut",
		points = { 0.33, 1.0, 0.68, 1.0 },
	},
	{
		name = "shellInOut",
		points = { 0.65, 0.0, 0.35, 1.0 },
	},
}

-- Register animation curves
for _, bezier in ipairs(beziers) do
	hl.curve(bezier.name, {
		type = "bezier",
		points = {
			{ bezier.points[1], bezier.points[2] },
			{ bezier.points[3], bezier.points[4] },
		},
	})
end

-- Animation definitions
local animations = {
	-- Windows
	{
		leaf = "windowsIn",
		speed = 3,
		bezier = "shellOut",
		style = "slide",
	},
	{
		leaf = "windowsOut",
		speed = 2,
		bezier = "shellInOut",
		style = "popin 92%",
	},
	{
		leaf = "windowsMove",
		speed = 2,
		bezier = "shellOut",
	},

	-- Workspaces
	{
		leaf = "workspaces",
		speed = 3,
		bezier = "shellInOut",
		style = "slide",
	},

	-- Border & Layers
	{
		leaf = "border",
		speed = 2,
		bezier = "shellOut",
	},
	{
		leaf = "fade",
		speed = 2,
		bezier = "shellOut",
	},
	{
		leaf = "layers",
		speed = 3,
		bezier = "shellInOut",
	},
}

-- Register animations
for _, anim in ipairs(animations) do
	hl.animation({
		leaf = anim.leaf,
		enabled = true,
		speed = anim.speed,
		bezier = anim.bezier,
		style = anim.style or "",
	})
end

-- Enable animations globally
hl.config({
	animations = {
		enabled = true,
	},
})
