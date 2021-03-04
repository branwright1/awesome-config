local naughty = require("naughty")
local ruled = require("ruled")
local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

naughty.config.padding = "10"
naughty.config.defaults.position = "bottom_left"
naughty.config.defaults.margin = 8
naughty.config.defaults.border_width = 2
