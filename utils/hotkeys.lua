local awful = require("awful")
local apps = require("apps")
local gears = require("gears")

local client_screen = {}
client_screen = require("utils.helpers").getClientScreenHotkeys(client_screen, apps)

local layout = {
	awful.key({ apps.alt, }, ".",
    function()
        awful.layout.set(awful.layout.suit.max)
    end, {description = "set max layout", group = "layout"}),

	awful.key({ apps.alt, }, "/",
    function()
        awful.layout.set(awful.layout.suit.tile)
    end, {description = "set tile layout", group = "layout"}),
}

local client = {
	awful.key({ apps.alt, }, "Return",
	function (c) 
		c:move_to_screen() 
	end, {description = "move to screen", group = "client"}),
}

local spawner = {	
	awful.key({ apps.modkey, "Shift" }, "Return",
	function () awful.spawn(apps.emacs) 
	end, {description = "open a emacs", group = "spawner"}),
	
	awful.key({ apps.modkey, }, "Return",
	function () awful.spawn(apps.terminal) 
	end, {description = "open a terminal", group = "spawner"}),
	
	awful.key({ apps.modkey, } , "e",
    	function() 
	    	awful.spawn(apps.file_manager_cmd .. " /home/gustavolozada/.config/awesome/") 
    	end, {description="open awesome dir", group="spawner"}),
	
	awful.key({ apps.modkey, } , "b",
    	function() 
	    awful.util.spawn(apps.browser)
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

local clientkeys = gears.table.join(
	table.unpack(client)
)

local result = {
	hotkeys = hotkeys,
	ckeys = clientkeys
}
return result
