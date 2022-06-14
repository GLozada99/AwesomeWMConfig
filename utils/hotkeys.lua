local awful = require("awful")
local gears = require("gears")

local constants = require("utils.constants")

local client_screen = {}
client_screen = require("utils.helpers").getClientScreenHotkeys(client_screen, constants)

local layout = {
	awful.key({ constants.alt, }, ".",
    function()
        awful.layout.set(awful.layout.suit.max)
    end, {description = "set max layout", group = "layout"}),

	awful.key({ constants.alt, }, "/",
    function()
        awful.layout.set(awful.layout.suit.tile)
    end, {description = "set tile layout", group = "layout"}),
}

local spawner = {	
	awful.key({ constants.modkey, "Shift" }, "Return",
	function () awful.spawn(constants.emacs)
	end, {description = "open a emacs", group = "spawner"}),
	
	awful.key({ constants.modkey, }, "Return",
	function () awful.spawn(constants.terminal)
	end, {description = "open a terminal", group = "spawner"}),
	
	awful.key({ constants.modkey, } , "e",
    	function() 
	    	awful.spawn(constants.file_manager_cmd .. " /home/gustavolozada/.config/awesome/")
    	end, {description="open awesome dir", group="spawner"}),
	
	awful.key({ constants.modkey, } , "b",
    	function() 
	    awful.util.spawn(constants.browser)
    	end, {description="open browser", group="spawner"}),
}

local misc = {
    awful.key({}, "#123", function() volume_widget:inc(5) end),
    awful.key({}, "#122", function() volume_widget:dec(5) end),
    awful.key({}, "#121", function() volume_widget:toggle() end),
}


local hotkeys = gears.table.join(
	table.unpack(layout)
)

hotkeys = gears.table.join(
	hotkeys,
	table.unpack(client_screen)
)

hotkeys = gears.table.join(
	hotkeys,
	table.unpack(spawner)
)

hotkeys = gears.table.join(
	hotkeys,
	table.unpack(misc)
)

return hotkeys
