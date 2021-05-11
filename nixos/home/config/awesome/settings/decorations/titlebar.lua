local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


client.connect_signal("request::titlebars", function(c)
local top_titlebar = awful.titlebar(c, {
    size = dpi(29),
})
-- buttons for the titlebar
local buttons = gears.table.join(
    awful.button({ }, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)
top_titlebar : setup {
    { -- Left
        buttons = buttons,
        layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
        { -- Title
            align  = 'center',
            widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    },
    { -- Right
        layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
}
end)
