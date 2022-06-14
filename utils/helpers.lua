local awful = require("awful")

function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

function getClientScreenHotkeys (arr, apps)
  local positions = {"up", "down", "left", "right"}
  local x_positions = {"left", "right"}

  for _, position in ipairs(positions) do -- Swap clients by direction
    table.insert(arr,
      awful.key({ apps.modkey, }, firstToUpper(position),
      function ()
        awful.client.swap.bydirection(position)
      end, {description = "Swap " .. position, group = "client"}))
  end

  for _, position in ipairs(positions) do -- Focus clients by direction
    table.insert(arr,
      awful.key({ apps.alt }, firstToUpper(position),
        function ()
          awful.client.focus.bydirection(position)
      end, {description = "Focus" .. position, group = "client"}))
  end

  for index, position in ipairs(x_positions) do -- Increment/decrement client width
    table.insert(arr,
      awful.key({ apps.modkey, "Shift" }, firstToUpper(position),
      function ()
        awful.tag.incmwfact(0.05 * ((-1) ^ index))
      end, {description = "Increment width " .. position, group = "client"}))
  end

  for index, position in ipairs(x_positions) do -- Focus screens by index
    table.insert(arr,
      awful.key({ apps.modkey, "Control" }, firstToUpper(position),
      function ()
        awful.screen.focus_relative(1 * (-1 ^ (index - 1)))
      end, {description = "focus the next screen", group = "screen"}))
  end

  table.insert(arr,
    awful.key({ apps.alt, }, "Tab",
    function ()
      awful.client.focus.byidx(1)
    end, {description = "focus next by index", group = "client"}))

  return arr

end

return {
  getClientScreenHotkeys = getClientScreenHotkeys
}
