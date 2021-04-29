pcall(require, "luarocks.loader")

local awful = require("awful")
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
winkey = "Mod4"
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

local floating = awful.layout.suit.floating
local tile = awful.layout.suit.tile
local vertical = bling.layout.vertical
local centered = bling.layout.centered

awful.layout.layouts = {
    floating, tile, vertical, centered
}

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("code", {
        gap = 10,
        screem = s,
        layout = tile,
    })
    awful.tag.add("river", {
        gap = 0,
        screem = s,
        layout = floating,
    })
    awful.tag.add("home", {
        gap = 0,
        screen = s,
        selected = true,
        layout = floating,
    })
    awful.tag.add("web", {
        gap = 10,
        screen = s,
        layout = tile,
    })
    awful.tag.add("netbsd", {
        gap = 0,
        screem = s,
        layout = floating,
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
require("autostart")
require("settings")
