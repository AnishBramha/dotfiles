if [ -z "${XDG_RUNTIME_DIR}" ]; then
	export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
	if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi


if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	echo "Initialising Environment..."
	dbus-run-session sway

	echo ""
	echo "------------------------------------------------------"
	echo "WARNING: Sway session has terminated or failed to start"
	echo "Dropping to secure emergency shell to prevent looping"
	echo "-------------------------------------------------------"
	echo ""
	/bin/bash
fi
