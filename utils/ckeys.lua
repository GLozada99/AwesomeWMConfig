local awful = require("awful")
local gears = require("gears")
local constants = require("utils.constants")

local client = {
	awful.key({ constants.alt, }, "Return",
	function (c) 
		c:move_to_screen() 
	end, {description = "move to screen", group = "client"}),
}

local ckeys = gears.table.join(
	table.unpack(client)
)

return ckeys
