-- Global applications
local appList = {
	"quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

-- Start applications
local function startApplications()
	for _, command in ipairs(appList) do
		hl.exec_cmd(command)
	end
end

-- Start applications when Hyprland starts
hl.on("hyprland.start", startApplications)

-- Restart applications when configuration reloads
hl.on("hyprland.reload", startApplications)

-- XWayland configuration
hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})
