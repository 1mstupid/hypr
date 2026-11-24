local appList = {
	"quickshell -p ~/Projects/quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc -p ~/Projects/quickshell call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

local function startApplications()
	for _, command in ipairs(appList) do
		local binary = command:match("^%S+")
		if binary then
			hl.exec_cmd("pkill -f " .. binary)
		end
	end

	for _, command in ipairs(appList) do
		hl.exec_cmd(command)
	end
end

hl.on("hyprland.start", startApplications)

hl.on("config.reloaded", startApplications)

hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})
