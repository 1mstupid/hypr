local mod = "SUPER"

hl.config({
	bind = {
		-- Applications & Quickshell IPC
		{ mod, "Return", "exec", "alacritty" },
		{ mod, "t", "exec", "quickshell ipc call applauncher toggle" },
		{ mod .. " SHIFT", "v", "exec", "quickshell ipc call clipboard toggle" },
		{ mod, "e", "exec", "quickshell ipc call drawer toggle" },
		{ mod .. " CTRL", "s", "exec", "quickshell ipc call settings toggle" },
		{ "ALT CTRL", "l", "exec", "quickshell ipc call lock lock" },
		{ mod .. " SHIFT", "c", "exec", "quickshell ipc call colorschemes toggle" },
		{ mod .. " SHIFT", "n", "exec", "quickshell ipc call notifications toggle" },
		{ mod .. " SHIFT", "o", "exec", "quickshell ipc call layout toggle" },
		{ mod .. " SHIFT", "u", "exec", "quickshell ipc call dashboard toggle" },
		{ mod, "w", "exec", "quickshell ipc call wallpapers toggle" },
		{ mod .. " SHIFT", "b", "exec", "quickshell ipc call network toggle" },
		{ mod .. " SHIFT", "p", "exec", "quickshell ipc call powermenu toggle" },

		-- Media & Volume Keys (Allow when locked)
		{ "", "XF86AudioPlay", "exec", "playerctl play-pause" },
		{ "", "XF86AudioRaiseVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+" },
		{ "", "XF86AudioLowerVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-" },
		{ "", "XF86AudioMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" },

		-- Window Focus
		{ mod, "Tab", "hyprexpo:expo", "toggle" },
		{ mod, "h", "movefocus", "l" },
		{ mod, "Left", "movefocus", "l" },
		{ mod, "l", "movefocus", "r" },
		{ mod, "Right", "movefocus", "r" },
		{ mod, "Up", "movefocus", "u" },
		{ mod, "Down", "movefocus", "d" },
		{ "ALT", "Tab", "cyclenext", "" },

		--  Woomer (Screen Zoom)
		{ mod, "z", "exec", "woomer" },

		-- Layout Controls
		{ mod .. " SHIFT", "l", "workspace-set-layout:toggle" },
		{ mod .. " SHIFT", "d", "workspace-set-layout:monocle" },
		{ mod .. " SHIFT", "s", "workspace-set-layout:scrolling" },
		{ mod .. " SHIFT", "m", "workspace-set-layout:master" },

		-- Window Actions
		{ mod, "q", "killactive", "" },
		{ mod, "Space", "togglefloating", "" },
		{ mod, "f", "fullscreen", "1" }, -- Maximize equivalent
		{ mod .. " CTRL", "f", "fullscreen", "0" }, -- Fullscreen

		-- Workspaces (1-9)
		{ mod, "1", "workspace", "1" },
		{ mod, "2", "workspace", "2" },
		{ mod, "3", "workspace", "3" },
		{ mod, "4", "workspace", "4" },
		{ mod, "5", "workspace", "5" },
		{ mod, "6", "workspace", "6" },
		{ mod, "7", "workspace", "7" },
		{ mod, "8", "workspace", "8" },
		{ mod, "9", "workspace", "9" },

		-- Move window to workspaces (1-9)
		{ mod .. " CTRL", "1", "movetoworkspace", "1" },
		{ mod .. " CTRL", "2", "movetoworkspace", "2" },
		{ mod .. " CTRL", "3", "movetoworkspace", "3" },
		{ mod .. " CTRL", "4", "movetoworkspace", "4" },
		{ mod .. " CTRL", "5", "movetoworkspace", "5" },
		{ mod .. " CTRL", "6", "movetoworkspace", "6" },
		{ mod .. " CTRL", "7", "movetoworkspace", "7" },
		{ mod .. " CTRL", "8", "movetoworkspace", "8" },
		{ mod .. " CTRL", "9", "movetoworkspace", "9" },

		-- Workspace navigation
		{ mod, "K", "workspace", "e-1" },
		{ mod, "J", "workspace", "e+1" },
	},
	bindm = {
		-- Mouse binds for moving/resizing windows
		{ mod, "mouse:272", "movewindow", "" },
		{ mod, "mouse:273", "resizewindow", "" },
	},
})
