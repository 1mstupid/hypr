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
exec(mod, "D", "quickshell ipc -p ~/Projects/quickshell call applauncher toggle")
exec(mod .. " SHIFT", "V", "quickshell ipc -p ~/Projects/quickshell call clipboard toggle")
exec(mod, "E", "quickshell ipc -p ~/Projects/quickshell call drawer toggle")
exec(mod .. " CTRL", "S", "quickshell ipc -p ~/Projects/quickshell call settings toggle")
exec("ALT CTRL", "L", "quickshell ipc -p ~/Projects/quickshell call lock lock")
exec(mod .. " SHIFT", "C", "quickshell ipc -p ~/Projects/quickshell call colorschemes toggle")
exec(mod .. " SHIFT", "N", "quickshell ipc -p ~/Projects/quickshell call notifications toggle")
exec(mod .. " SHIFT", "O", "quickshell ipc -p ~/Projects/quickshell call layout toggle")
exec(mod .. " SHIFT", "U", "quickshell ipc -p ~/Projects/quickshell call dashboard toggle")
exec(mod, "W", "quickshell ipc -p ~/Projects/quickshell call wallpapers toggle")
exec(mod .. " SHIFT", "B", "quickshell ipc -p ~/Projects/quickshell call network toggle")
exec(mod .. " SHIFT", "P", "quickshell ipc -p ~/Projects/quickshell call powermenu toggle")

-- Neru
exec(mod .. " SHIFT", "H", "neru hints")
exec(mod .. " SHIFT", "G", "neru grid")
exec(mod .. " SHIFT", "T", "neru scroll")

-- Media & Volume Keys
-- locked = true allows these bindings while an input inhibitor is active.
exec("", "XF86MonBrightnessUp", "ddcutil --display 1 setvcp 10 + 10", { locked = true })
exec("", "XF86MonBrightnessDown", "ddcutil --display 1 setvcp 10 - 10", { locked = true })
exec("", "XF86AudioPlay", "playerctl --player=mpd,%any play-pause", { locked = true })
exec("", "XF86AudioNext", "playerctl --player=mpd,%any next", { locked = true })
exec("", "XF86AudioPrev", "playerctl --player=mpd,%any previous", { locked = true })
exec("", "XF86AudioRaiseVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+", { locked = true })
exec("", "XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-", { locked = true })
exec("", "XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true })

-- Focus Navigation
bind(mod, "H", hl.dsp.focus({ direction = "left" }))
bind(mod, "LEFT", hl.dsp.focus({ direction = "left" }))

bind(mod, "L", hl.dsp.focus({ direction = "right" }))
bind(mod, "RIGHT", hl.dsp.focus({ direction = "right" }))

bind(mod, "K", hl.dsp.focus({ direction = "up" }))
bind(mod, "UP", hl.dsp.focus({ direction = "up" }))

bind(mod, "J", hl.dsp.focus({ direction = "down" }))
bind(mod, "DOWN", hl.dsp.focus({ direction = "down" }))

bind("ALT", "TAB", hl.dsp.window.cycle_next())

-- Woomer (Screen Zoom)
exec(mod, "Z", "woomer")

-- ==========================================
-- Window Resizing (Tiled & Floating)
-- ==========================================
-- Using SUPER + CTRL + [H, J, K, L] or arrow keys for resizing active windows.
-- Automatically handles floating vs tiled constraints via dispatchers.

local resize_amount = 30

-- Resize Left
bind(mod .. " CTRL", "H", hl.dsp.window.resize({ x = -resize_amount, y = 0 }))
bind(mod .. " CTRL", "LEFT", hl.dsp.window.resize({ x = -resize_amount, y = 0 }))

-- Resize Right
bind(mod .. " CTRL", "L", hl.dsp.window.resize({ x = resize_amount, y = 0 }))
bind(mod .. " CTRL", "RIGHT", hl.dsp.window.resize({ x = resize_amount, y = 0 }))

-- Resize Up
bind(mod .. " CTRL", "K", hl.dsp.window.resize({ x = 0, y = -resize_amount }))
bind(mod .. " CTRL", "UP", hl.dsp.window.resize({ x = 0, y = -resize_amount }))

-- Resize Down
bind(mod .. " CTRL", "J", hl.dsp.window.resize({ x = 0, y = resize_amount }))
bind(mod .. " CTRL", "DOWN", hl.dsp.window.resize({ x = 0, y = resize_amount }))

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

-- Build the selector Hyprland expects for a workspace rule.
local function workspace_selector(workspace)
	if workspace.special then
		return tostring(workspace.name)
	end

	local name = tostring(workspace.name)
	if name ~= tostring(workspace.id) then
		return "name:" .. name
	end

	return tostring(workspace.id)
end

local function set_layout(layout)
	local workspace = get_active_workspace()
	if not workspace then
		return
	end

	hl.workspace_rule({
		workspace = workspace_selector(workspace),
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
	local next_layout = layouts[1]

	for i, layout in ipairs(layouts) do
		if layout == current then
			next_layout = layouts[(i % #layouts) + 1]
			break
		end
	end

	set_layout(next_layout)
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

-- Restore focused window to current workspace (Super + Ctrl + Backspace)
bind(mod .. " CTRL", "BACKSPACE", function()
	local workspace = hl.get_active_workspace()
	if not workspace then
		return
	end

	hl.dispatch("movetoworkspace", tostring(workspace.id))
end)

-- Original fullscreen 1 = maximize, fullscreen 0 = fullscreen.
bind(
	mod,
	"F",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	})
)

bind(
	mod .. " CTRL",
	"F",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	})
)

-- Workspaces (1-9)
for i = 1, 9 do
	local key = tostring(i)

	-- Switch workspace
	bind(mod, key, hl.dsp.focus({ workspace = i }))

	-- Move window without following
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
bind(mod, "P", hl.dsp.focus({ workspace = "e-1" }))
bind(mod, "N", hl.dsp.focus({ workspace = "e+1" }))

-- Config reload / Restart Hyprland
exec(mod .. " SHIFT", "R", "hypr-reload")

-- Mouse binds for moving/resizing windows
bind(mod, "mouse:272", hl.dsp.window.drag(), { mouse = true })
bind(mod, "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Window movement / workspace cycling with super + scroll
bind(mod, "mouse_up", hl.dsp.focus({ workspace = "e-1" }), { mouse = true })
bind(mod, "mouse_down", hl.dsp.focus({ workspace = "e+1" }), { mouse = true })
