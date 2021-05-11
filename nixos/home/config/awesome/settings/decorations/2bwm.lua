local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


client.connect_signal("request::titlebars", function(c)

local top_border = awful.titlebar(c, {
    size = dpi(3),
    position = "top"
})

local bottom_border = awful.titlebar(c, {
    size = dpi(3),
    position = "bottom"
})

local left_border = awful.titlebar(c, {
    size = dpi(3),
    position = "left"
})

local right_border = awful.titlebar(c, {
    size = dpi(3),
    position = "right"
})

end)
