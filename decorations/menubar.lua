local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

apps = {
    { "discord", discord },
    { "telegram", telegram },
    { "spotify", spotify },
    { "browser", browser },
    { "terminal", terminal },
    { "editor", editor_cmd },
    { "shoot", shoot }
}

awesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ 
    items = {
        { "Apps", apps },
        { "Awesome", awesomemenu, beautiful.awesome_icon }
    }
})

mylauncher = awful.widget.launcher({ 
    image = beautiful.awesome_icon,
    menu = mymainmenu 
})

-- Menubar configuration
menubar.utils.terminal = terminal
