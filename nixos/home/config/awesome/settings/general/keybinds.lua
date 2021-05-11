local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")


-- Mouse keybinds
awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function() mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)


-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "s",
        group = "awesome",
        description = "Show help",
        on_press = hotkeys_popup.show_help,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "r",
        group = "awesome",
        description = "Restart awesome",
        on_press = awesome.restart,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "e",
        group = "awesome",
        description = "Quit awesome",
        on_press = awesome.quit,
    },
    awful.key {
        modifiers = { modkey },
        key = "Return",
        group = "Launcher",
        description = "Open terminal",
        on_press = function()
            awful.spawn(terminal)
        end,
    },
    awful.key {
        modifiers = { },
        key = "Print",
        group = "Launcher",
        description = "Open flameshot gui",
        on_press = function()
            awful.spawn(shoot)
        end,
    },
    awful.key {
        modifiers = { shiftkey },
        key = "space",
        group = "Launcher",
        description = "Run menubar",
        on_press = function()
            awful.spawn("rofi -show")
        end,
    },
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "j",
        group = "Client",
        description = "Focus next by index",
        on_press = function ()
            awful.client.focus.byidx( 1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "k",
        group = "Client",
        description = "Focus previous by index",
        on_press = function ()
            awful.client.focus.byidx(-1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "Tab",
        group = "Client",
        description = "Go back",
        on_press = function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    },
    awful.key{
        modifiers = { modkey, controlkey },
        key = "j",
        group = "Screen",
        description = "Focus next screen",
        on_press = function()
            awful.screen.focus_relative( 1)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "k",
        group = "Screen",
        description = "focus the previous screen",
        on_press = function()
            awful.screen.focus_relative(-1)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "h",
        group = "Screen",
        description = "restore minimized",
        on_press = function()
            local c = awful.client.restore()
            -- Focus restored client
                if c then
                c:activate { raise = true, context = "key.unminimize" }
            end
        end,
    },
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "j",
        group = "Client",
        description = "swap with next client by index",
        on_press = function()
            awful.client.swap.byidx(  1)
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "k",
        group = "Client",
        description = "swap with previous client by index",
        on_press = function()
            awful.client.swap.byidx( -1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "u",
        group = "Client",
        description = "jump to urgent client",
        on_press = awful.client.urgent.jumpto,
    },
    awful.key {
        modifiers = { modkey },
        key ="l",
        group = "Layout",
        description = "increase master width factor",
        on_press = function()
            awful.tag.incmwfact( 0.5)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "h",
        group = "Layout",
        description = "decrease master width factor",
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "h",
        group = "Layout",
        description = "increase the number of master clients",
        on_press = function()
            awful.tag.incnmaster( 1, nil, true)
        end,
    },
    awful.key {
        modifiers ={ modkey, shiftkey },
        key = "l",
        group = "Layout",
        description = "decrease the number of master clients",
        on_press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "h",
        group = "Layout",
        description = "increase the number of columns",
        on_press = function()
            awful.tag.incncol( 1, nil, true)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "l",
        group = "Layout",
        description = "decrease the number of columns",
        on_press = function()
            awful.tag.incncol(-1, nil, true)
        end,
    },
})

-- Tags
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, controlkey },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, controlkey, shiftkey },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey, shiftkey}, "q",      function (c) c:kill() end,
            {description = "close", group = "client"}),
        awful.key({ modkey, controlkey }, "f",  awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}),
        awful.key({ modkey, controlkey }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen() end,
            {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "x",      function (c) c.ontop = not c.ontop end,
            {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, controlkey }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, shiftkey }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)