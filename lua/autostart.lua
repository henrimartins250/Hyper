hl.on("hyprland.start", function()
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img ~/media/images/hyprbg/blackcube.png")
	hl.exec_cmd("quickshell -p ~/.config/quickshell/")

	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd(
		"systemctl --user start xdg-desktop-portal.service xdg-desktop-portal-hyprland.service xdg-desktop-portal-gtk.service"
	)
end)

-- debugging
--
-- systemctl --user is-active graphical-session.target hyprland-session.target
--
-- manually starting
-- systemctl --user start xdg-desktop-portal.service
-- systemctl --user status xdg-desktop-portal.service
