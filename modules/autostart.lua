local appList = {
	"quickshell -p ~/Projects/quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc -p ~/Projects/quickshell call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

-- Start applications
local function startApplications()
	-- Stop existing instances by matching the full command pattern
	for _, command in ipairs(appList) do
		-- Extract the main binary name (first word) to kill safely
		local binary = command:match("^%S+")
		if binary then
			hl.exec_cmd("pkill -9 -x " + binary + " 2>/dev/null || true")
		end
	end

	-- Alternative: If pkill -x fails, target specific base names directly
	hl.exec_cmd("pkill -9 -f quickshell")
	hl.exec_cmd("pkill -9 -x awww-daemon")
	hl.exec_cmd("pkill -9 -x swayidle")
	hl.exec_cmd("pkill -9 -x wl-paste")

	-- Small delay to let OS release sockets/resources
	hl.exec_cmd("sleep 0.1")

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
