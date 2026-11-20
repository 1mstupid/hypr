-- Animation curves
local beziers = {
	{
		name = "specialWorkSwitch",
		points = { 0.05, 0.9, 0.1, 1 },
	},
	{
		name = "emphasizedAccel",
		points = { 0.3, 0, 0.8, 0.15 },
	},
	{
		name = "emphasizedDecel",
		points = { 0.05, 0.9, 0.1, 1 },
	},
	{
		name = "standard",
		points = { 0.25, 1, 0.5, 1 },
	},
	{
		name = "shellBounce",
		points = { 0.34, 1.56, 0.64, 1 },
	},
	{
		name = "shellSettle",
		points = { 0.33, 1, 0.68, 1 },
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
		speed = 1.8,
		bezier = "shellBounce",
		style = "slide",
	},
	{
		leaf = "layersOut",
		speed = 1.8,
		bezier = "shellBounce",
		style = "slide",
	},
	{
		leaf = "fadeLayers",
		speed = 1.2,
		bezier = "shellSettle",
	},

	-- Windows
	{
		leaf = "windowsIn",
		speed = 1.8,
		bezier = "shellBounce",
	},
	{
		leaf = "windowsOut",
		speed = 1.8,
		bezier = "shellBounce",
	},
	{
		leaf = "windowsMove",
		speed = 1.8,
		bezier = "shellSettle",
	},

	-- Workspaces
	{
		leaf = "workspaces",
		speed = 5,
		bezier = "standard",
		style = "slidefadevert 15%",
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
		speed = 5,
		bezier = "standard",
	},
	{
		leaf = "fadeDim",
		speed = 5,
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
