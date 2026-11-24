-- Global applications
local appList = {
	"quickshell -p ~/Projects/quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc -p ~/Projects/quickshell call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

-- Start applications
local function startApplications()
	-- Stop existing instances cleanly in one atomic command
	hl.exec_cmd("killall -q quickshell awww-daemon swayidle wl-paste")

	-- Brief pause to ensure ports/sockets release (optional, adjust if needed)
	-- hl.exec_cmd("sleep 0.1")

	-- Start applications
	for _, command in ipairs(appList) do
		hl.exec_cmd(command)
	end
end

-- Start applications when Hyprland starts
hl.on("hyprland.start", startApplications)

-- Restart applications when config reloads
hl.on("config.reloaded", startApplications)

-- XWayland configuration
hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})
