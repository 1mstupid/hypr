hl.window_rule({
	name = "global-opacity",
	match = { class = ".*" },

	opacity = "0.9 override 0.9 override",
})

-- ── PICTURE-IN-PICTURE ──────────────────────────────────────────────────────

-- · small, pinned in a corner, and never takes focus
hl.window_rule({
	name = "picture-in-picture",
	match = { title = "^(Picture-in-Picture|Picture in picture)$" },

	float = true,
	size = "25% 25%",
	move = { 10, 10 },
	opacity = "1.0 override 1.0 override",
	pin = true,
	no_focus = true,
})

-- ── FLOATING APPS ───────────────────────────────────────────────────────────

hl.window_rule({
	name = "floating-apps",
	match = {
		class = "^(dev\\.lemmy\\.swash|Mullvad Browser|Tor Browser|org\\.kde\\.kdeconnect\\.handler|org\\.kde\\.kdeconnect\\.daemon|com\\.rafaelmardojai\\.Blanket\\.qbittorrent-wr)$",
	},

	float = true,
})

hl.window_rule({
	name = "yazi-filemanager",
	match = { class = "^(yazi\\.filemanager)$" },

	float = true,
	size = "55% 55%",
	center = true,
})

hl.window_rule({
	name = "woomer",
	match = { class = "^(woomer)$" },

	float = true,
	center = true,
	no_focus = true,
})

-- ── SIZED FLOATERS ──────────────────────────────────────────────────────────

hl.window_rule({
	name = "localsend",
	match = { class = "^(org\\.localsend\\.localsend_app)$" },

	float = true,
	size = "40% 50%",
})

hl.window_rule({
	name = "obs-studio",
	match = { class = "^(com\\.obsproject\\.Studio)$" },

	float = true,
	size = "55% 65%",
})

hl.window_rule({
	name = "scrcpy",
	match = { class = "^(scrcpy)$" },

	float = true,
	size = "30% 90%",
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	name = "nwg-look",
	match = { class = "^(nwg-look)$" },

	float = true,
	size = "40% 40%",
})

hl.window_rule({
	name = "wlfreerdp-opaque",
	match = { class = "^(wlfreerdp)$" },

	opacity = "1.0 override 1.0 override",
})

-- ── OPAQUE FLOATERS ─────────────────────────────────────────────────────────

-- · media viewers float at 90% by 60% and stay fully opaque
hl.window_rule({
	name = "opaque-media-floaters",
	match = { class = "^(com\\.interversehq\\.qView|mpv)$" },

	float = true,
	size = "90% 60%",
	opacity = "1.0 override 1.0 override",
})

-- ── MAXIMIZED ───────────────────────────────────────────────────────────────

hl.window_rule({
	name = "open-maximized",
	match = {
		class = "^(org\\.qutebrowser\\.qutebrowser|equibop|chrome-web\\.whatsapp\\.com__-Default|org\\.telegram\\.desktop|dev\\.zed\\.Zed)$",
	},

	maximize = true,
})

-- ── BROWSER & DIALOG POPUPS ─────────────────────────────────────────────────

-- · Bitwarden's popup
hl.window_rule({
	name = "bitwarden-popup",
	match = { title = "^(.*Bitwarden.*)$" },

	float = true,
	size = "26% 47%",
	center = true,
})

-- · Firefox's Library window
hl.window_rule({
	name = "firefox-library",
	match = { title = "^(Library)$" },

	float = true,
	size = "55% 60%",
	center = true,
})

-- · download and opening dialogs
hl.window_rule({
	name = "download-dialogs",
	match = { title = "^(.*(Downloads|Opening).*)$" },

	float = true,
	size = "55% 60%",
	center = true,
})

-- · Steam's notification toasts stay out of focus
hl.window_rule({
	name = "steam-toasts",
	match = {
		class = "^(steam)$",
		title = "^(notificationtoasts_\\d+_desktop)$",
	},

	float = true,
	no_focus = true,
})

-- ── LAYERS ──────────────────────────────────────────────────────────────────

-- · every shell surface: blurred behind, with no open or close animation.
--   The shell runs its own morph, so Hyprland's slide would stack on top.
--
-- ignore_alpha keeps the blur to the painted card. The full-screen panels
-- (control drawer, power menu, layout editor, history) would otherwise blur
-- the whole wallpaper. 0.12 is the value Impasto uses.
hl.layer_rule({
	name = "quickshell-layers",
	match = { namespace = "^(quickshell.*|qs-.*)$" },

	blur = false,
	no_anim = true,
})
hl.layer_rule({
	name = "qs-strip",
	match = { namespace = "qs-strip" },

	blur = true,
	no_anim = true,
	ignore_alpha = 0.05,
})
hl.layer_rule({
	name = "no-anim-for-selection",
	match = {
		namespace = "qs_screenshot",
	},
	no_anim = true,
})
