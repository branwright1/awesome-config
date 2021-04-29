local awful = require("awful")

-- Drag to the top to maximize
awful.mouse.resize.add_leave_callback(function(c, _, args)
    if (not c.floating) and awful.layout.get(c.screen) ~= awful.layout.suit.floating
    then
        return
    end

    local coords = mouse.coords()
    local sg = c.screen.geometry
    local snap = awful.mouse.snap.default_distance

    if coords.x > snap + sg.x and coords.x < sg.x + sg.width - snap and coords.y <= snap + sg.y and coords.y >= sg.y
    then
        awful.placement.maximize(c, {honor_workarea=true})
    end
end, "mouse.move")