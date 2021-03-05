local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- variables
terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
shoot = "flameshot gui"
browser = "qutebrowser"
spotify = "spotify"
discord = "Discord"
telegram = "telegram-desktop"

-- table of apps
apps = {
    { "discord", discord },
    { "telegram", telegram },
    { "spotify", spotify },
    { "browser", browser },
}

-- table of tools
tools = {
    { "shoot", shoot },
    { "editor", editor_cmd },
    { "terminal", terminal }
}

--- table of awesome 
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
        { "Tools", tools },
        { "Awesome", awesomemenu, beautiful.awesome_icon }
    }
})

mylauncher = awful.widget.launcher({ 
    image = beautiful.awesome_icon,
    menu = mymainmenu 
})

-- Menubar configuration
menubar.utils.terminal = terminal
