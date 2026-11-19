-- Animation curves
local beziers = {
	{
		name = "specialWorkSwitch",
		points = { 0.05, 0.7, 0.1, 1 },
	},
	{
		name = "emphasizedAccel",
		points = { 0.3, 0, 0.8, 0.15 },
	},
	{
		name = "emphasizedDecel",
		points = { 0.05, 0.7, 0.1, 1 },
	},
	{
		name = "standard",
		points = { 0.2, 0, 0, 1 },
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
	-- Windows & Layers
	{
		leaf = "layersIn",
		speed = 5,
		bezier = "emphasizedDecel",
		style = "slide",
	},
	{
		leaf = "layersOut",
		speed = 4,
		bezier = "emphasizedAccel",
		style = "slide",
	},
	{
		leaf = "fadeLayers",
		speed = 5,
		bezier = "standard",
	},

	-- Windows
	{
		leaf = "windowsIn",
		speed = 5,
		bezier = "emphasizedDecel",
	},
	{
		leaf = "windowsOut",
		speed = 3,
		bezier = "emphasizedAccel",
	},
	{
		leaf = "windowsMove",
		speed = 6,
		bezier = "standard",
	},

	-- Workspaces
	{
		leaf = "workspaces",
		speed = 5,
		bezier = "standard",
	},
	{
		leaf = "specialWorkspace",
		speed = 4,
		bezier = "specialWorkSwitch",
		style = "slidefadevert 15%",
	},

	-- Border & Fade
	{
		leaf = "fade",
		speed = 6,
		bezier = "standard",
	},
	{
		leaf = "fadeDim",
		speed = 6,
		bezier = "standard",
	},
	{
		leaf = "border",
		speed = 6,
		bezier = "standard",
	},
}

-- Register animations
for _, anim in ipairs(animations) do
	hl.animation({
		leaf = anim.leaf,
		enabled = anim.enabled ~= false,
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
