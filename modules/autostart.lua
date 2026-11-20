local appList = {
	"quickshell",
	"awww-daemon",
	"swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true'",
	"wl-paste --type text --watch cliphist store",
}

local function restartApplications()
	hl.print("Restarting background applications")

	hl.exec_cmd("pkill -x quickshell")
	hl.exec_cmd("pkill -x awww-daemon")
	hl.exec_cmd("pkill -x swayidle")
	hl.exec_cmd("pkill -x wl-paste")

	hl.exec_cmd(
		"sleep 1; quickshell & awww-daemon & swayidle timeout 600 'quickshell ipc call lock lock' before-sleep 'true' & wl-paste --type text --watch cliphist store &"
	)
end

hl.on("hyprland.start", restartApplications)
hl.on("config.reloaded", restartApplications)
