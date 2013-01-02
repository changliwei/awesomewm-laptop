-- blue, awesome3 theme, by: bioe007 perrydothargraveatgmaildotcom

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'HeldustryFTVBasic Black 8'
theme.taglist_font = 'HeldustryFTVBasic Black 10'
theme.border_width = '1'

if home_path ~= nil then
	config        = home_path .. '.config/awesome'
	shared        = '/usr/share/awesome'
	if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
	    shared    = '/usr/share/local/awesome'
	end
	sharedicons   = shared .. '/icons'
	sharedthemes  = shared .. '/themes'
	themes        = config .. '/themes'
	name = 'blue'
	themename     = '/' .. name
	theme.theme_name = name
	if not awful.util.file_readable(themes .. themename .. '/theme.lua') then
	       themes = sharedthemes
	end
	themedir      = themes .. themename

	if script_options.font ~= nil then
		theme.font = script_options.font
	end

	if script_options.taglist_font ~= nil then
		theme.taglist_font = script_options.taglist_font
	end

	theme.border_width = script_options.border_width
--}}}
end

theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

white      = '#ffffff'
blue_dark  = '#486274'
blue_light = '#839ab1'
nearwhite  = '#efffff'

theme.bg_normal     = blue_dark
theme.bg_focus      = blue_light
theme.bg_urgent     = '#288ef6'
theme.fg_normal     = '#b9b9dd'
theme.fg_focus      = nearwhite
theme.fg_urgent     = white
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

-- {{{ Widgets
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = theme.fg_urgent
theme.bg_widget        = theme.bg_normal
theme.border_widget    = theme.bg_normal
-- }}}

theme.bg_bottom     = blue_dark -- bottom panel color
theme.fg_bottom     = '#b9b9dd' -- bottom panel text color
theme.bg_graphs     = '#374B59' -- graphs background color

theme.border_normal = '#000124'
theme.border_focus  = '#4148ea'
theme.border_marked = '#0000f0'

-- calendar settings
theme.calendar_w  = 160
theme.calendar_fg = nearwhite
theme.calendar_bg = blue_dark

-- menu settings
theme.menu_height = 15
theme.menu_width = 100

theme.titlebar_bg_focus = blue_light
theme.titlebar_bg_normal = blue_dark

if home_path ~= nil then
	  -- Display the taglist squares
	theme.taglist_squares = true
	theme.taglist_squares_sel = themedir .. '/taglist/squarefw.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/squarew.png'

	theme.tasklist_floating_icon = themedir .. '/tasklist/float.gif'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

	  -- Display close button inside titlebar
	theme.titlebar_close_button = true

	  -- Define the image to load
	  -- @ (if titlebar_close_button_[normal|focus] these values are ignored)
	theme.titlebar_close_button_normal = themedir .. '/titlebar/close-inactive.png'
	theme.titlebar_close_button_focus  = themedir .. '/titlebar/close-active.png'

	  -- You can use your own layout icons like this:
	theme.layout_dwindle    = themedir .. '/layouts/dwindlew.png'
	theme.layout_fairh      = themedir .. '/layouts/fairhw.png'
	theme.layout_fairv      = themedir .. '/layouts/fairvw.png'
	theme.layout_floating   = themedir .. '/layouts/floatingw.png'
	theme.layout_magnifier  = themedir .. '/layouts/magnifierw.png'
	theme.layout_max        = themedir .. '/layouts/maxw.png'
	theme.layout_spiral     = themedir .. '/layouts/spiralw.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottomw.png'
	theme.layout_tileleft   = themedir .. '/layouts/tileleftw.png'
	theme.layout_tile       = themedir .. '/layouts/tilew.png'
	theme.layout_tiletop    = themedir .. '/layouts/tiletopw.png'
end

return theme
-- vim:set filetype=lua textwidth=80 fdm=marker tabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent: --
