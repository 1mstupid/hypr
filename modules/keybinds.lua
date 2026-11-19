-- Modifier configuration
local mod = "SUPER"

-- Helper to register a binding.
-- Accepts modifiers like "SUPER SHIFT" or "ALT CTRL".
local function bind(modifiers, key, dispatcher, opts)
	local prefix = modifiers:gsub("%s+", " + ")
	local chord = prefix ~= "" and (prefix .. " + " .. key) or key

	hl.bind(chord, dispatcher, opts or {})
end

-- Helper for executable commands
local function exec(modifiers, key, command, opts)
	bind(modifiers, key, hl.dsp.exec_cmd(command), opts)
end

-- Applications & Quickshell IPC
exec(mod, "RETURN", "alacritty")
exec(mod, "T", "quickshell ipc call applauncher toggle")
exec(mod .. " SHIFT", "V", "quickshell ipc call clipboard toggle")
exec(mod, "E", "quickshell ipc call drawer toggle")
exec(mod .. " CTRL", "S", "quickshell ipc call settings toggle")
exec("ALT CTRL", "L", "quickshell ipc call lock lock")
exec(mod .. " SHIFT", "C", "quickshell ipc call colorschemes toggle")
exec(mod .. " SHIFT", "N", "quickshell ipc call notifications toggle")
exec(mod .. " SHIFT", "O", "quickshell ipc call layout toggle")
exec(mod .. " SHIFT", "U", "quickshell ipc call dashboard toggle")
exec(mod, "W", "quickshell ipc call wallpapers toggle")
exec(mod .. " SHIFT", "B", "quickshell ipc call network toggle")
exec(mod .. " SHIFT", "P", "quickshell ipc call powermenu toggle")

-- Media & Volume Keys
-- locked = true allows these bindings while an input inhibitor is active.
exec("", "XF86AudioPlay", "playerctl play-pause", { locked = true })

exec("", "XF86AudioRaiseVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+", { locked = true })

exec("", "XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-", { locked = true })

exec("", "XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true })

-- Window Focus
bind(mod, "TAB", hl.dsp.exec_cmd("hyprctl dispatch hyprexpo:expo toggle"))

bind(mod, "H", hl.dsp.focus({ direction = "left" }))
bind(mod, "LEFT", hl.dsp.focus({ direction = "left" }))

bind(mod, "L", hl.dsp.focus({ direction = "right" }))
bind(mod, "RIGHT", hl.dsp.focus({ direction = "right" }))

bind(mod, "UP", hl.dsp.focus({ direction = "up" }))
bind(mod, "DOWN", hl.dsp.focus({ direction = "down" }))

bind("ALT", "TAB", hl.dsp.window.cycle_next())

-- Woomer (Screen Zoom)
exec(mod, "Z", "woomer")

-- Layout Controls
-- Switch layouts independently for each workspace.

local layouts = {
	"dwindle",
	"master",
	"scrolling",
	"monocle",
}

local function get_active_workspace()
	return hl.get_active_special_workspace() or hl.get_active_workspace()
end

local function set_layout(layout)
	local workspace = get_active_workspace()
	if not workspace then
		return
	end

	hl.workspace_rule({
		workspace = workspace.special and tostring(workspace.name) or "name:" .. tostring(workspace.name),
		layout = layout,
	})
end

-- Cycle layouts
bind(mod .. " SHIFT", "L", function()
	local workspace = get_active_workspace()
	if not workspace then
		return
	end

	local current = workspace.tiled_layout
	local index = 1

	for i, layout in ipairs(layouts) do
		if layout == current then
			index = (i % #layouts) + 1
			break
		end
	end

	set_layout(layouts[index])
end)

-- Direct layout selection
bind(mod .. " SHIFT", "D", function()
	set_layout("dwindle")
end)

bind(mod .. " SHIFT", "S", function()
	set_layout("scrolling")
end)

bind(mod .. " SHIFT", "M", function()
	set_layout("master")
end)

-- Window Actions
bind(mod, "Q", hl.dsp.window.close())

bind(mod, "SPACE", hl.dsp.window.float({ action = "toggle" }))

-- Original fullscreen 1 = maximize, fullscreen 0 = fullscreen.
bind(
	mod,
	"F",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "set",
	})
)

bind(
	mod .. " CTRL",
	"F",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "set",
	})
)

-- Workspaces (1-9)
for i = 1, 9 do
	local key = tostring(i)

	bind(mod, key, hl.dsp.focus({ workspace = i }))

	-- Move window without following to destination workspace.
	bind(
		mod .. " CTRL",
		key,
		hl.dsp.window.move({
			workspace = i,
			follow = false,
		})
	)
end

-- Workspace navigation
bind(mod, "K", hl.dsp.focus({ workspace = "e-1" }))
bind(mod, "J", hl.dsp.focus({ workspace = "e+1" }))

-- Mouse binds for moving/resizing windows
bind(mod, "mouse:272", hl.dsp.window.drag(), { mouse = true })

bind(mod, "mouse:273", hl.dsp.window.resize(), { mouse = true })
