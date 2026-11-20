-- Global applications
local appList = {
	"quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

-- Start applications
local function startApplications()
	hl.exec_cmd("pkill -x quickshell; pkill -x awww-daemon; pkill -x swayidle; pkill -x wl-paste; sleep 0.5")

	for _, command in ipairs(appList) do
		hl.exec_cmd(command)
	end
end

-- Initial startup
hl.on("hyprland.start", startApplications)

-- Configuration reload
hl.on("config.reloaded", function()
	hl.exec_cmd("sleep 1; " .. table.concat(appList, " & "))
end)

-- XWayland configuration
hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})
