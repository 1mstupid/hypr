local apps = {
	{ name = "quickshell", cmd = "quickshell &" },
	{ name = "awww-daemon", cmd = "awww-daemon &" },
	{ name = "swayidle", cmd = "swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true' &" },
	{ name = "wl-paste", cmd = "wl-paste --type text --watch cliphist store &" },
}

local function restartApplications()
	hl.print("Restarting background applications...")

	-- Kill existing instances safely using pattern matching
	for _, app in ipairs(apps) do
		hl.exec_cmd("pkill -f " .. app.name)
	end

	-- Give the compositor a brief moment to release Wayland sockets
	hl.exec_cmd("sleep 0.5")

	-- Launch each application individually
	for _, app in ipairs(apps) do
		hl.exec_cmd(app.cmd)
	end
end

hl.on("hyprland.start", restartApplications)
hl.on("config.reloaded", restartApplications)
