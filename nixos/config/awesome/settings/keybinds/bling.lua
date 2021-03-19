local awful = require("awful")
local bling = require("bling")

-- Bling related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "t",
        group = "Bling",
        description = "Enable tabbed mode",
        on_press = function()
            bling.module.tabbed.pick() 
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "t",
        group = "Bling",
        description = "Remove window from tabbed mode",
        on_press = function()
            bling.module.tabbed.pop()
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "Tab",
        group = "Bling",
        description = "Iterate through tabbed windows",
        on_press = function()
            bling.module.tabbed.iter()
        end,
    },
})
