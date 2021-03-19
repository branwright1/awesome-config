pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

-- Error on startup notification:
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "An error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)


-- Initialize selected theme.
local themes_path = gfs.get_configuration_dir()
beautiful.init(themes_path .. "settings/themes/tlou2.lua")


-- garbage collector
collectgarbage("step", 1024)
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)


-- modifiers
modkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"


-- Load external modules.
local bling = require("bling")
local walls = gfs.get_configuration_dir()
bling.module.wallpaper.setup {
    wallpaper = { 
        walls .. "assets/wallpapers/house-wall.png"
    },
    position = maximized,
}

bling.module.flash_focus.enable()
bling.module.window_swallowing.start()


-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("code", {
        gap = 0,
        screem = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("tinywl", {
        gap = 0,
        screem = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("home", {
        gap = 0,
        screen = s,
        selected = true,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("web", {
        gap = 0,
        screen = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("extra", {
        gap = 0,
        screem = s,
        layout = awful.layout.suit.floating,
    })
end)

-- Focus on click
client.connect_signal("focus",
    function(c)
        c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
end)


-- Load modules
require("settings")
