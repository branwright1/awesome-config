local awful = require("awful")
require("awful.autofocus")
local bling = require("modules.bling")
local awestore = require("modules.awestore")

-- editor animation
local editor_anim_y = awestore.tweened(1080, {
    duration = 330,
    easing = awestore.easing.cubic_in_out
})

-- left terminal animation
local left_anim_x = awestore.tweened(-1300, {
    duration = 320,
    easing = awestore.easing.cubic_in_out
})

-- middle terminal animation
local middle_anim_y = awestore.tweened(-1080, {
    duration = 320,
    easing = awestore.easing.cubic_in_out
})

-- right terminal animation
local right_anim_x = awestore.tweened(2000, {
    duration = 320,
    easing = awestore.easing.cubic_in_out
})

-- editor animation
local browser_anim_y = awestore.tweened(-1080, {
    duration = 330,
    easing = awestore.easing.cubic_in_out
})

local wlroots_anim_y = awestore.tweened(-1080, {
    duration = 330,
    easing = awestore.easing.cubic_in_out
})

local edit_scratch = bling.module.scratchpad:new {
    command = "alacritty --class edit",
    rule = { instance = "edit" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = { x=360, y=90, height=900, width=1200 },
    reapply = true,
    dont_focus_before_close  = false,
    awestore = { y = editor_anim_y },
}

local left_scratch = bling.module.scratchpad:new {
    command = "alacritty --class left",
    rule = { instance = "left" },
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = { x=15, y=15, height=1045, width=610 },
    reapply = true,
    dont_focus_before_close  = false,
    awestore = { x = left_anim_x },
}

local middle_scratch = bling.module.scratchpad:new {
    command = "alacritty --class middle",
    rule = { instance = "middle", },
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = { x=655, y=15, height=1045, width=610 },
    reapply = true,
    dont_focus_before_close  = false,
    awestore = { y = middle_anim_y },
}

local right_scratch = bling.module.scratchpad:new {
    command = "alacritty --class right",
    rule = { instance = "right" },
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = { x=1295, y=15, height=1045, width=610 },
    reapply = true,
    dont_focus_before_close = false,
    awestore = { x = right_anim_x },
}

local browser_scratch = bling.module.scratchpad:new {
    command = "qutebrowser",
    rule = { instance = "qutebrowser" },
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = { x=360, y=90, height=900, width=1200 },
    reapply = true,
    dont_focus_before_close  = false,
    awestore = { y = browser_anim_y },
}

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
    awful.key {
        modifiers = { winkey },
        key = "e",
        group = "Bling",
        description = "Toggle editor scratchpad",
        on_press = function()
            edit_scratch:toggle()
        end,
    },
    awful.key {
        modifiers = { winkey },
        key = "a",
        group = "Scratchpad",
        description = "Toggle left",
        on_press = function()
            left_scratch:toggle()
        end,
    },
    awful.key {
        modifiers = { winkey },
        key = "s",
        group = "Scratchpad",
        description = "Toggle middle",
        on_press = function()
            middle_scratch:toggle()
        end,
    },
    awful.key {
        modifiers = { winkey },
        key = "d",
        group = "Scratchpad",
        on_press = function()
            right_scratch:toggle()
        end,
    },
    awful.key {
        modifiers = { winkey },
        key = "b",
        group = "Scratchpad",
        description = "Toggle browser scratchpad",
        on_press = function()
            browser_scratch:toggle()
        end,
    }
})