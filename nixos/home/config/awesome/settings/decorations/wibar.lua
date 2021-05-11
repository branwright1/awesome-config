local awful = require("awful")
local wibox = require("wibox")

local wb = awful.wibar { position = 'top' }
wb:setup {
    layout = wibox.layout.align.horizontal,
    {
        -- Rotate the widgets with the container
        {
            mytaglist,
            direction = 'west',
            widget = wibox.container.rotate
        },
        layout = wibox.layout.fixed.horizontal,
    },
    mytasklist,
    {
        layout = wibox.layout.fixed.horizontal,
        {
            -- Rotate the widgets with the container
            {
                mykeyboardlayout,
                mytextclock,
                layout = wibox.layout.fixed.horizontal
            },
            direction = 'west',
            widget = wibox.container.rotate
        }
    },
}