pcall(require, "luarocks.loader")
collectgarbage("step", 1024)

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
beautiful.init(gears.filesystem.get_configuration_dir() .. "settings/themes/tlou2.lua")


-- Load external modules.
local bling = require("bling")
require("collision")()

bling.module.flash_focus.enable()


-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("code", {
        gap = 12,
        screem = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("home", {
        gap = 0,
        screen = s,
        selected = true,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("qemu", {
        gap = 12,
        screen = s,
        layout = bling.layout.vertical,
    })
end)


-- Load wallpaper from assets folder
screen.connect_signal("request::wallpaper", function(s)
--    bling.module.tiled_wallpaper("☘", s, {
--        fg = "#FFFFFF",
--        bg = "#009e60",
--        offset_y = 27,
--        offset_x = 0,
--        font = "Unifont",
--        font_size = 23,
--        padding = 99,
--        zickzack = true
--    })

    gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "assets/wallpapers/house-wall.png", s, false, nil)

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
