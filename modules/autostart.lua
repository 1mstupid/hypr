hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = true, -- Maps to xwayland_native_resolution = true
	},
	exec_once = {
		"quickshell",
		"steam -silent",
		"awww-daemon",
		"swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true'",
		"wl-paste --type text --watch cliphist store",
	},
})
