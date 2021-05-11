local naughty = require("naughty")
local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")
local helpers = require("modules.helpers")
local dpi = beautiful.xresources.apply_dpi

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = { },
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.config.padding = dpi(24)

naughty.config.defaults.timeout = 10
naughty.config.defaults.text = ""
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.ontop = true
naughty.config.defaults.margin = 14
naughty.config.defaults.border_width = 2
naughty.config.defaults.position = "top_middle"

naughty.notify({ title = "Config reloaded", message = "No errors found!", timeout = 5 })