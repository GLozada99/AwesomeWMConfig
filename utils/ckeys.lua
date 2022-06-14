local awful = require("awful")
local apps = require("apps")

local client = {
	awful.key({ apps.alt, }, "Return",
	function (c) 
		c:move_to_screen() 
	end, {description = "move to screen", group = "client"}),
}

local ckeys = gears.table.join(
	table.unpack(client)
)

return ckeys
