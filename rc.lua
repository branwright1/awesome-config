pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local menubar = require("menubar")
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


-- Define layouts
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        bling.layout.centered,
    })
end)

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({ "1", "2", "3" }, s, awful.layout.layouts[1])

end)
-- }}}

-- Load wallpaper from themes folder
gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "themes/wallhaven-5weoz7.png", s, false, nil)


-- Focus on click
client.connect_signal("focus", 
    function(c) 
        c.border_color = beautiful.border_focus 
end)
client.connect_signal("unfocus", 
    function(c) c.border_color = beautiful.border_normal 
end)

-- Load modules
require("keys") -- keybindings
require("rules") -- rules for clients and notifs
require("autostart") -- Stolen from JavaCafe01 :)
require("decorations") -- bars, menus, titlebars etc.
