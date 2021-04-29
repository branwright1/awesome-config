local awful = require("awful")

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then findme = cmd:sub(0, firstspace - 1) end
    awful.spawn.easy_async_with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
end

autostart = {
    "nm-applet",
    "xset -b",
    "~/.screenlayout/herbstluftwm.sh",
    "picom -b --experimental-backends"
}

for app = 1, #autostart do run_once(autostart[app]) end