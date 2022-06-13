local awful = require("awful")
local apps = require("apps")
local gears = require("gears")
local modkey = apps.modkey
local alt = apps.alt
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')


local layout = {
	awful.key({ alt, }, ".",  
    	function()
    	    awful.layout.set(awful.layout.suit.max)
    	end, {description = "set max layout", group = "layout"}),

	awful.key({ alt, }, "/",  
    	function()
    	    awful.layout.set(awful.layout.suit.tile)
    	end, {description = "set tile layout", group = "layout"}),
        
	    awful.key({ alt,           }, "Tab",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}),

	awful.key({ alt, }, "Left",
        function ()
	    awful.client.focus.bydirection("left")
        end,
        {description = "focus left", group = "client"}),
    	
	awful.key({ alt, }, "Right",
        function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "focus right", group = "client"}),

	awful.key({ alt, }, "Up",
        function ()
	    awful.client.focus.bydirection("up")
        end,
        {description = "focus up", group = "client"}),
    	
	awful.key({ alt, }, "Down",
        function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "focus down", group = "client"}),
}

local client = {
	awful.key({ alt, }, "Return",      
	function (c) 
		c:move_to_screen() 
	end, {description = "move to screen", group = "client"}),
}

local spawner = {	
	awful.key({ modkey,           }, "Return", 
	function () awful.spawn(apps.terminal) 
	end, {description = "open a terminal", group = "spawner"}),
	
	awful.key({ modkey,} , "e", 
    	function() 
	    	awful.util.spawn(apps.editor_cmd .. " " .. awesome.conffile) 
    	end, {description="edit config", group="spawner"}),
	
	awful.key({ modkey,} , "b", 
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
