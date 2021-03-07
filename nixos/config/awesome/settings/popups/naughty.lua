local naughty = require("naughty")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(40)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 5
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.margin = dpi(13)
naughty.config.defaults.border_width = 2
naughty.config.defaults.border_color = beautiful.border_normal
naughty.config.defaults.position = "top_right"

naughty.config.padding = dpi(22)
naughty.config.spacing = dpi(10)

