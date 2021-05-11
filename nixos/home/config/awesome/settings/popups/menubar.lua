local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- apps menu
discord = "Discord"
telegram = "telegram-desktop"
spotify = "spotify"
browser = "qutebrowser"

-- tools menu
shoot = "flameshot gui"
editor = "nvim"
terminal = "alacritty"
editor_cmd = terminal .. " -e " .. editor
virtmgr = "virt-manager"

-- system menu
switch = "home-manager switch"
reboot = "doas reboot"
shutdown = "doas shutdown now"

-- apps table
apps = {
    { "discord", discord },
    { "telegram", telegram },
    { "spotify", spotify },
    { "browser", browser }
}

-- tools table
tools = {
    { "shoot", shoot },
    { "editor", editor_cmd },
    { "virtmgr", virtmgr },
    { "terminal", terminal }
}

-- system table
system = {
    { "switch", switch },
    { "reboot", reboot },
    { "shutdown", shutdown }
}

--- table of awesome
awesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", function() awesome.restart() end },
    { "quit", function() awesome.quit() end }
}


mymainmenu = awful.menu({
    items = {
        { "Apps", apps },
        { "Tools", tools },
        { "System", system },
        { "Awesome", awesomemenu, beautiful.awesome_icon }
    }
})


mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})


-- Menubar configuration
menubar.utils.terminal = terminal
