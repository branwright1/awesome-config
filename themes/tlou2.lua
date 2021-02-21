local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gcolor = require("gears.color")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local naughty = require("naughty")
local theme = {}
-- local theme = dofile(themes_path .. "default/theme.lua") -- inherit default theme
local config_path = os.getenv("HOME") .. "/.config/awesome/"


-- Wallpaper
theme.wallpaper = "~/Wallpapers/wallhaven-5weoz7.png"

-- Global font
theme.font = "Dina 9"

-- Wibar Settigs
theme.wibar_height = dpi(27)
theme.wibar_margin = dpi(0)
-- theme.wibar_border_width = dpi(2)
-- theme.wibar_border_color = "#443a36"

-- Wibox Background
theme.bg_normal     = "#201e1a"
theme.bg_focus      = "#272520"
theme.bg_urgent     = "#79695a"
theme.bg_minimize   = "#201e1a"

-- Wibox Foreground
theme.fg_normal     = "#696055"
theme.fg_focus      = "#5d6051"
theme.fg_urgent     = "#201e1a"
theme.fg_minimize   = "#443a36"

-- Taglist
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel( taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel( taglist_square_size, theme.fg_normal)

theme.taglist_bg          = theme.bg_normal
theme.taglist_bg_focus    = theme.bg_focus
theme.taglist_fg_focus    = theme.fg_focus
theme.taglist_bg_occupied = transparent
theme.taglist_fg_occupied = theme.fg_normal
theme.taglist_bg_empty    = transparent
theme.taglist_fg_empty    = theme.fg_minimize

-- Tasklist
theme.tasklist_spacing = dpi(0)
theme.tasklist_align   = "center"
theme.tasklist_disable_icon = false

-- Layout list 
theme.layoutlist_border_color = theme.fg_normal
theme.layoutlist_border_width = dpi(2)

-- Systray
theme.systray_icon_spacing = dpi(8)
theme.bg_systray = theme.bg_normal
theme.systray_icon_size = dpi(16)

-- Titlebars
theme.titlebar_bg_focus  = "#3E2D23"
theme.titlebar_bg_normal = "#3c2b22"
theme.titlebar_fg_focus  = "#473428"
theme.titlebar_fg_normal = "#3c2b22"
theme.titlebar_size = dpi(40)

-- Windows
theme.useless_gap   = dpi(12)
theme.border_width  = dpi(3)
theme.border_radius = dpi(8)
theme.border_focus = "#3E2D23"
theme.border_normal  = "#3c2b22"
theme.border_marked = "#3c2b22"
theme.snap_border_width = dpi(3)

-- hotkeys
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font
theme.hotkeys_border_width = dpi(3)
theme.hotkeys_border_color = "#79695a"
theme.hotkeys_group_margin = dpi(5)

-- Calendar widget
theme.calendar_month_padding = dpi(18)
theme.calendar_month_border_width = dpi(3)
theme.calendar_month_border_color = "#79695a"

-- mouse menu
theme.menu_height       = dpi(26)
theme.menu_width        = dpi(120)
theme.menu_font         = "Dina 9"
theme.menu_border_width = dpi(3)
theme.menu_border_color = "#443a36"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_normal, theme.fg_normal
)

-- floating layout icon
theme.layout_floating = config_path.."icons/layouts/floatingw.png"

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Bling tabbar settings
theme.tabbed_spawn_in_tab = true
theme.tabbar_style = "boxes"
theme.tabbar_size = dpi(43)
theme.tabbar_ontop  = true
theme.tabbar_position = "bottom"
theme.tabbar_color_close = "#674441"
theme.tabbar_color_min = "#84694e"
theme.tabbar_color_float = "#545e5e"
theme.tabbar_bg_normal = "#272520"
theme.tabbar_fg_normal = theme.fg_normal
theme.tabbar_bg_focus  = theme.bg_normal
theme.tabbar_fg_focus  = theme.fg_normal

-- Bling mstab settings
theme.mstab_bar_height = dpi(35) -- 35
theme.mstab_font = theme.font
theme.mstab_bar_padding = dpi(0) -- 35
theme.mstab_tabbar_position = "right" -- bottom
theme.mstab_tabbar_style = "boxes" -- default
theme.mstab_tabbar_ontop = true
theme.mstab_bg_focus = theme.bg_focus
theme.mstab_fg_focus = theme.fg_focus
theme.mstab_bg_normal = theme.bg_normal
theme.mstab_fg_normal = theme.fg_normal

-- Collision

theme.collision_focus_fg = theme.fg_normal
theme.collision_focus_border_width = theme.border_width
theme.collision_focus_border_color = theme.border_normal

theme.collision_focus_bg_center = theme.fg_focus

return theme
