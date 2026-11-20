local function startApplications()
	hl.print("Starting background applications...")

	hl.exec_cmd("quickshell -p ~/Projects/quickshell/")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true' &")
	hl.exec_cmd("wl-paste --type text --watch cliphist store &")
end

hl.on("hyprland.start", startApplications)
hl.on("config.reloaded", startApplications)
