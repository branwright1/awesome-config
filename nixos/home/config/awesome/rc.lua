pcall(require, "luarocks.loader")

local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local helpers = require("modules.helpers")
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
beautiful.init(themes_path .. "settings/themes/gruvbox-material.lua")


-- garbage collector
collectgarbage("step", 1024)
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)


-- modifiers
modkey = "Mod1"
winkey = "Mod4"
shiftkey = "Shift"
controlkey = "Control"


-- Load external modules
local bling = require("modules.bling")

-- setup wallpaper
local walls = gfs.get_configuration_dir()
bling.module.wallpaper.setters.simple_schedule {
    wallpaper = {
        ["08:00:00"] = walls .. "assets/wallpapers/birb-wall.png",
        ["17:00:00"] = walls .. "assets/wallpapers/2021-05-07-172843_1920x1080_scrot.png",
    },
    position = fit,
}

bling.module.flash_focus.enable()

local floating = awful.layout.suit.floating
local tile = awful.layout.suit.tile
local vertical = bling.layout.vertical
local centered = bling.layout.centered

awful.layout.layouts = {
    floating, tile, vertical, centered
}

local gap_size = beautiful.useless_gap

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("code", {
        gap = gap_size,
        screem = s,
        layout = tile,
    })
    awful.tag.add("river", {
        gap = gap_size,
        screem = s,
        layout = floating,
    })
    awful.tag.add("home", {
        gap = gap_size,
        screen = s,
        selected = true,
        layout = floating,
    })
    awful.tag.add("web", {
        gap = gap_size,
        screen = s,
        layout = tile,
    })
    awful.tag.add("netbsd", {
        gap = gap_size,
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
require("settings")
require("modules.savefloats")
require("modules.placement")
require("modules.autostart")
