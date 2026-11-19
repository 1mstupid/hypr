hl.env("PATH", "/run/hypr-runtime-env/bin:" .. os.getenv("PATH"))

-- Get hostname from system
local handle = io.popen("hostname")
local hostname = "unknown" -- Default fallback

if handle then
	local result = handle:read("*l")
	handle:close()
	if result then
		hostname = result:gsub("%s+", "")
	end
end

-- Expose hostname globally so modules can use it (e.g., host-specific monitors)
_G.HOSTNAME = hostname

-- Trigger the modular loader
local hyprRoot = os.getenv("HYPRLAND_ROOT") or "."
dofile(hyprRoot .. "/autoload.lua")
