-- Global applications
local appList = {
	"quickshell -p ~/Projects/quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

-- Start applications
local function startApplications()
	-- Stop existing instances to avoid duplicates
	hl.exec_cmd("pkill -x quickshell")
	hl.exec_cmd("pkill -x awww-daemon")
	hl.exec_cmd("pkill -x swayidle")
	hl.exec_cmd("pkill -x wl-paste")

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
