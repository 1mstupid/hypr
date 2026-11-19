-- Animation curves
local beziers = {
	{
		name = "instant",
		points = { 0, 0, 1, 1 },
	},
	{
		name = "smooth",
		points = { 0.2, 0, 0, 1 },
	},
	{
		name = "easeInExpo",
		points = { 0.7, 0, 0.84, 0 },
	},
	{
		name = "easeOutExpo",
		points = { 0.16, 1, 0.3, 1 },
	},
	{
		name = "softEase",
		points = { 0.26, 0.26, 0.15, 1 },
	},
	{
		name = "mediumEase",
		points = { 0.4, 0, 0.2, 1 },
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
		speed = 3,
		bezier = "easeOutExpo",
		style = "popin",
	},
	{
		leaf = "layersOut",
		speed = 3,
		bezier = "easeOutExpo",
		style = "popin",
	},
	{
		leaf = "windows",
		speed = 3,
		bezier = "easeOutExpo",
		style = "popin",
	},
	{
		leaf = "windowsIn",
		speed = 3,
		bezier = "easeOutExpo",
		style = "slide",
	},
	{
		leaf = "windowsOut",
		speed = 3,
		bezier = "easeOutExpo",
		style = "slide",
	},

	-- Workspaces
	{
		leaf = "workspaces",
		speed = 3,
		bezier = "easeOutExpo",
		style = "slide",
	},
	{
		leaf = "specialWorkspace",
		speed = 3,
		bezier = "easeOutExpo",
		style = "slidevert",
	},

	-- Border & Fade
	{
		leaf = "border",
		enabled = false,
		speed = 3,
		bezier = "smooth",
	},
	{
		leaf = "fade",
		enabled = false,
		speed = 3,
		bezier = "easeOutExpo",
	},
	{
		leaf = "fadeLayersIn",
		enabled = false,
		speed = 3,
		bezier = "easeOutExpo",
	},
	{
		leaf = "fadeLayersOut",
		enabled = false,
		speed = 3,
		bezier = "easeOutExpo",
	},
	{
		leaf = "monitorAdded",
		enabled = false,
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
		workspace_wraparound = false,
	},
})
