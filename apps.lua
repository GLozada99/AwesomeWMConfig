
-- The default applications that we will use in keybindings and widgets
local default = {
	-- Keys
	modkey = 'Mod4',
	alt = 'Mod1',
	-- Default terminal emulator
	terminal = 'alacritty',
	-- Default web browser
	browser = 'brave',
	-- Default text editor
	editor = 'nvim',
	-- Editor on cmd
	editor_cmd = 'alacritty -e nvim',
	-- Default file manager
	file_manager = 'nemo',
	-- Default media player
	multimedia = 'vlc',
	-- Default network manager
	network_manager = 'alacritty iwctl',
	-- Default bluetooth manager
	bluetooth_manager = 'blueman-manager',
	-- Default power manager
	power_manager = 'tlp',
	-- Default GUI package manager
	package_manager = 'pamac-manager',
}

return default
