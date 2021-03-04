pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local beautiful = require("beautiful")

-- Error on startup notification:
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "An error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)


-- Initialize selected theme.
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/tlou2.lua")


-- Load external modules.
local bling = require("bling")
require("collision")()

bling.module.flash_focus.enable()

-- Variables for keys.lua
modkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"

-- Variables for /decorations/menubar.lua
terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
shoot = "flameshot gui"
browser = "qutebrowser"
spotify = "spotify"
discord = "Discord"
telegram = "telegram-desktop"


-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("1", {
        gap = 12,
        screem = s,
        layout = bling.layout.vertical,
    })
    awful.tag.add("2", {
        gap = 0,
        screen = s,
        selected = true,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("3", {
        gap = 12,
        screen = s,
        layout = bling.layout.equalarea,
    })
end)


-- Load wallpaper from themes folder
gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "assets/wallpapers/house-wall.png", s, false, nil)


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
require("keys") -- keybindings
require("rules") -- rules for clients and notifs
require("windows") -- extended window placement
require("autostart") -- Stolen from JavaCafe01 :)
require("decorations") -- bars, menus, titlebars etc.
