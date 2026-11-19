hl.config({
	windowrulev2 = {
		-- Global opacity / defaults (handled via general/decoration or fallback rules)
		{ "opacity 0.9 override 0.9 override", "class:^(.*)$" },

		-- Picture-in-Picture
		{ "float, title:^(Picture-in-Picture|Picture in picture)$" },
		{ "size 25% 25%, title:^(Picture-in-Picture|Picture in picture)$" },
		{ "move 10-10, title:^(Picture-in-Picture|Picture in picture)$" }, -- Or anchor positioning
		{ "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture|Picture in picture)$" },
		{ "pin, title:^(Picture-in-Picture|Picture in picture)$" },
		{ "nofocus, title:^(Picture-in-Picture|Picture in picture)$" },

		-- Yazi File Manager
		{ "float, class:^(yazi\\.filemanager)$" },
		{ "size 55% 55%, class:^(yazi\\.filemanager)$" },
		{ "center, class:^(yazi\\.filemanager)$" },

		-- General Floating Apps
		{
			"float, class:^(dev\\.lemmy\\.swash|Mullvad Browser|Tor Browser|org\\.kde\\.kdeconnect\\.handler|org\\.kde\\.kdeconnect\\.daemon|com\\.rafaelmardojai\\.Blanket\\.qbittorrent-wr)$",
		},

		-- Custom Floating & Sized
		{ "float, class:^(woomer)$" },
		{ "center, class:^(woomer)$" },
		{ "nofocus, class:^(woomer)$" },
		{ "float, class:^(org\\.localsend\\.localsend_app)$" },
		{ "size 40% 50%, class:^(org\\.localsend\\.localsend_app)$" },

		{ "float, class:^(com\\.obsproject\\.Studio)$" },
		{ "size 55% 65%, class:^(com\\.obsproject\\.Studio)$" },

		{ "float, class:^(scrcpy)$" },
		{ "size 30% 90%, class:^(scrcpy)$" },
		{ "opacity 1.0 override 1.0 override, class:^(scrcpy)$" },

		{ "float, class:^(nwg-look)$" },
		{ "size 40% 40%, class:^(nwg-look)$" },

		{ "opacity 1.0 override 1.0 override, class:^(wlfreerdp)$" },

		-- Opaque Floating
		{ "float, class:^(com\\.interversehq\\.qView|mpv)$" },
		{ "size 90% 60%, class:^(com\\.interversehq\\.qView|mpv)$" },
		{ "opacity 1.0 override 1.0 override, class:^(com\\.interversehq\\.qView|mpv)$" },

		-- Open Maximized
		{
			"maximize, class:^(org\\.qutebrowser\\.qutebrowser|equibop|chrome-web\\.whatsapp\\.com__-Default|org\\.telegram\\.desktop|dev\\.zed\\.Zed)$",
		},

		-- Browser Floating Popups (Bitwarden)
		{ "float, title:^(.*Bitwarden.*)$" },
		{ "size 26% 47%, title:^(.*Bitwarden.*)$" },
		{ "center, title:^(.*Bitwarden.*)$" },

		-- Firefox Library
		{ "float, title:^(Library)$" },
		{ "size 55% 60%, title:^(Library)$" },
		{ "center, title:^(Library)$" },

		-- Downloads Dialogs
		{ "float, title:^(.*(Downloads|Opening).*)$" },
		{ "size 55% 60%, title:^(.*(Downloads|Opening).*)$" },
		{ "center, title:^(.*(Downloads|Opening).*)$" },

		-- Steam Notification Toasts
		{ "float, class:^(steam)$, title:^(notificationtoasts_\\d+_desktop)$" },
		{ "nofocus, class:^(steam)$, title:^(notificationtoasts_\\d+_desktop)$" },
	},
	layerrule = {
		-- Add blur to quickshell layers/surfaces
		{ "blur, quickshell" },
		{ "ignorezero, quickshell" },
		-- Skip open/close animations for quickshell layers
		{ "noanim, quickshell" },
	},
})
