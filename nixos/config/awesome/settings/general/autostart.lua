local awful = require("awful")

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
    if  firstspace 
    then findme = cmd:sub(0, firstspace - 1)  end
    awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd), false)
end

-- NetowrkManager Applet (Systray)
run_once("nm-applet")

-- Screen layout
run_once("sh ~/.screenlayout/herbstluftwm.sh")

-- Compositor
run_once("picom -b --experimental-backends")

-- Flameshot
run_once("flameshot")

return autostart
