local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local create_theme = require("actionless.common_theme").create_theme
local helpers = require("actionless.helpers")
local color_utils = require("utils").color
local parse = require("utils.parse")

local gtk_util = require("utils.gtk")


local theme_name = "twmish"
local theme_dir = awful.util.getdir("config").."/themes/"..theme_name
--local theme = dofile("/usr/share/awesome/themes/xresources/theme.lua")
local theme = {}

theme.skip_rounding_for_crazy_borders = true

local gsc = gtk_util.get_theme_variables()
theme.gtk = gsc

local gtk = {}

pcall(function()
  if OOMOX_SEL_BG then
    gsc.selected_bg_color = OOMOX_SEL_BG
  end
end)


local MAIN_COLOR = gsc.selected_bg_color
if oomox_theme_name == 'retro/uzi' then
  MAIN_COLOR = gsc.button_bg_color
end


theme.fg = gsc.selected_fg_color
theme.fg_normal = gsc.selected_fg_color
theme.bg = gsc.selected_bg_color
theme.bg_normal = gsc.selected_bg_color
theme.fg_focus		= gsc.selected_bg_color
theme.bg_focus		= gsc.selected_fg_color

theme.theme = gsc.selected_fg_color

theme.panel_fg = gsc.selected_fg_color
theme.panel_bg = gsc.selected_bg_color

theme.panel_widget_bg = gsc.base_color
theme.panel_widget_fg = gsc.text_color
theme.panel_widget_fg_warning = theme.panel_widget_fg

log(gsc)
theme.border_radius = dpi(gsc.border_radius*2)
theme.panel_widget_border_radius = dpi(gsc.border_radius*0.7)
--theme.border_radius = dpi(5)
--theme.panel_widget_border_radius = dpi(5)
theme.panel_widget_border_width = dpi(2)
--theme.panel_widget_border_color = color_utils.mix(gsc.menubar_fg_color, gsc.menubar_bg_color, 0.5)
theme.panel_widget_border_color = color_utils.mix(gsc.menubar_fg_color, gsc.menubar_bg_color, 0.3)
theme.notification_border_color = gsc.selected_fg_color

theme.widget_close_bg = gsc.selected_fg_color
theme.widget_close_fg = gsc.selected_bg_color

theme.tasklist_fg_focus  = gsc.selected_fg_color
theme.tasklist_bg_focus  = gsc.selected_bg_color
theme.tasklist_fg_normal = gsc.selected_fg_color
theme.tasklist_bg_normal = gsc.selected_bg_color
theme.tasklist_fg_minimize = gsc.selected_bg_color
theme.tasklist_bg_minimize = gsc.selected_fg_color

--theme.taglist_squares_sel       = "theme.null"
--theme.taglist_squares_unsel     = "theme.null"
--theme.taglist_fg_focus		= "theme.theme"
theme.taglist_fg_focus		= gsc.base_color
theme.taglist_bg_focus		= gsc.text_color
theme.taglist_fg_occupied	= gsc.text_color
theme.taglist_bg_occupied	= gsc.base_color


theme.xrdb = xresources.get_current_theme()

theme.dir = theme_dir
theme.icons_dir = theme.dir .. "/icons/"

--theme.error = theme.xrdb.color1
--theme.warning = theme.xrdb.color2


-- TERMINAL COLORSCHEME:
--
theme.color = xresources.get_current_theme()

-- PANEL COLORS:
--
theme.panel_taglist = gsc.base_color
theme.panel_close = MAIN_COLOR
--theme.panel_tasklist = gsc.menubar_bg_color
theme.panel_media = MAIN_COLOR
theme.panel_info = theme.xrdb.color13
theme.panel_layoutbox = theme.xrdb.color7
--theme.widget_layoutbox_bg = theme.panel_layoutbox
--theme.widget_layoutbox_fg = theme.panel_widget_fg

-- WALLPAPER:
-- Use nitrogen:
theme.wallpaper = nil
theme.wallpaper_cmd     = "nitrogen --restore"
--theme.wallpaper = os.getenv("HOME").."/images/diagonals.png"
-- Use wallpaper tile:
--theme.wallpaper = theme_dir .. '/umbreon_pattern.png'

-- PANEL DECORATIONS:
--
theme.show_widget_icon = false
--theme.widget_decoration_arrl = ''
--theme.widget_decoration_arrr = ''

-- deprecated :
--theme.widget_decoration_arrl = ''
--theme.widget_decoration_arrr = ''

theme.widget_decoration_arrl = '퟾'
theme.widget_decoration_arrr = '퟿'
theme.widget_decoration_arrl = '퟼'
theme.widget_decoration_arrr = '퟽'

theme.revelation_fg = theme.xrdb.color13
theme.revelation_border_color = theme.xrdb.color13
theme.revelation_bg = theme.panel_bg
theme.revelation_font = "Monospace Bold 24"
-- FONTS:
--theme.font = "Monospace Bold "..tostring(dpi(10))
--theme.small_font = "Monospace "..tostring(dpi(7))
--theme.sans_font = "Sans Bold "..tostring(dpi(10))
theme.font = "Monospace Bold 10"
--theme.font = "Sans Bold 10"
theme.tasklist_font = theme.font
theme.small_font = "Monospace 7"
theme.sans_font = "Sans Bold 10"
-- Don't use sans font:
--theme.sans_font	= "theme.font"

--theme.font = "Roboto Condensed Bold "..tostring(dpi(10))
--theme.sans_font = "Roboto Condensed Bold "..tostring(dpi(10))

--
--MISC:
--

theme.basic_panel_height = dpi(18)
theme.panel_padding_bottom = dpi(3)

--theme.border_width = dpi(3)
--theme.useless_gap = dpi(6)

theme.border_width = dpi(4)
theme.useless_gap = dpi(5)

theme.border_width = dpi(5)
theme.useless_gap = dpi(4)

theme.border_width = dpi(3)
theme.border_shadow_width = dpi(5)


theme.base_border_width = theme.border_width
theme.border_width = 0

theme.panel_height = theme.basic_panel_height + theme.panel_padding_bottom
theme.titlebar_height = theme.basic_panel_height + theme.base_border_width*2


theme.left_panel_internal_corner_radius = dpi(30)

theme.left_panel_width = dpi(120)
theme.left_widget_min_height = dpi(120)

theme.menu_height		= dpi(16)
theme.menu_width		= dpi(150)
theme.menu_border_color = gsc.selected_fg_color


--theme.apw_fg_color = MAIN_COLOR
--theme.apw_bg_color = color_utils.darker(gsc.menubar_bg_color, 40)
theme.apw_fg_color = gsc.text_color
theme.apw_bg_color = gsc.base_color
theme.apw_mute_bg_color = "theme.xrdb.color1"
theme.apw_mute_fg_color = "theme.xrdb.color9"


theme.desktop_bg = "#888888"
local TODO_BORDER = "#708090"
--theme.border_normal = gsc.menubar_bg_color
theme.border_normal = TODO_BORDER
--theme.border_normal = "#70809000"
theme.border_focus = MAIN_COLOR
--theme.border_normal = "#00000000"
--theme.border_focus = "#00000000"
--theme.titlebar_border = gsc.menubar_bg_color
--theme.titlebar_border = TODO_BORDER
theme.titlebar_border = TODO_BORDER.."00"
--theme.titlebar_border = "#70809000"
--theme.titlebar_fg_normal	= color_utils.mix(gsc.menubar_fg_color, gsc.menubar_bg_color)
theme.titlebar_shadow_focus = gsc.fg_color.."cc"
--theme.titlebar_shadow_normal = gsc.fg_color.."32"
theme.titlebar_shadow_normal = gsc.fg_color.."38"
theme.titlebar_bg_normal	= "theme.titlebar_border"
theme._titlebar_bg_normal	= TODO_BORDER
if theme.border_radius > 0 then
  theme.titlebar_fg_focus		= gsc.menubar_fg_color
  theme.titlebar_bg_focus		= "theme.titlebar_bg_normal"
else
  --theme.titlebar_fg_focus		= theme.titlebar_border
  --theme.titlebar_bg_focus		= theme.bg_focus
  theme.titlebar_fg_focus		= gsc.selected_fg_color
  theme.titlebar_bg_focus		= gsc.selected_bg_color
  theme.titlebar_bg_focus		= gsc.selected_bg_color.."00"
  theme._titlebar_bg_focus		= gsc.selected_bg_color
end
theme.titlebar_fg_normal	= "theme.titlebar_fg_focus"
pcall(function()
  if OOMOX_BORDER then
    theme.border_normal = OOMOX_BORDER
    theme.titlebar_border = OOMOX_BORDER
  end
end)
pcall(function()
  if OOMOX_SEL_BORDER then
    theme.border_focus = OOMOX_SEL_BORDER
    theme.titlebar_bg_focus = OOMOX_SEL_BORDER
  end
end)



--if color_utils.is_dark(theme.xrdb.background) then
  --theme.border_normal = color_utils.darker(theme.xrdb.background, -20)
--else
  --theme.border_normal = color_utils.darker(theme.xrdb.background, 20)
--end
--theme.titlebar_border           = theme.border_normal

theme.panel_widget_spacing = dpi(10)
theme.panel_widget_spacing_medium = dpi(8)
theme.panel_widget_spacing_small = dpi(4)

--theme.panel_widget_bg		= theme.xrdb.color3
theme.panel_widget_bg_error = theme.xrdb.color1
theme.panel_widget_fg_error = theme.xrdb.color15

--theme.widget_music_bg = color_utils.mix(MAIN_COLOR, gsc.menubar_fg_color, 0.6)
--theme.widget_music_bg = MAIN_COLOR
theme.widget_music_bg = gsc.selected_fg_color
--theme.widget_music_fg = MAIN_COLOR


theme = create_theme({ theme_name=theme_name, theme=theme, })

--theme.titlebar_bg_normal = theme.titlebar_bg_normal .."66"
--theme.border = theme.border .."66"
--theme.border_normal = theme.border_normal .."66"
--theme.border_focus = theme.border_focus .."66"

-- Recolor titlebar icons:
local theme_assets = require("beautiful.theme_assets")
theme = theme_assets.recolor_layout(theme, theme.fg_normal)
theme = theme_assets.recolor_titlebar_normal(theme, theme.titlebar_fg_normal)
theme = theme_assets.recolor_titlebar_focus(theme, theme.titlebar_fg_focus)

return theme
