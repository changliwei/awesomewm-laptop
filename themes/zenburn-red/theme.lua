-- zenburn-red, awesome3 theme, by Adrian C. (anrxc), modified by jessor

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'Terminus 8'
theme.taglist_font = 'Terminus 12'
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
	name     = 'zenburn-red'
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

-- {{{ Styles
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

-- {{{ Colors
theme.fg_normal = '#DCDCCC'
theme.fg_focus  = '#FFFFFF'
theme.fg_urgent = '#BC0909'
theme.bg_normal = '#181818'
theme.bg_focus  = '#400000'
theme.bg_urgent = theme.bg_normal

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

theme.bg_bottom     = '#181818' -- bottom panel color
theme.fg_bottom     = '#DCDCCC' -- bottom panel text color
theme.bg_graphs     = '#1A0E00' -- graphs background color

-- }}}

-- {{{ Borders
theme.border_focus  = '#EE6363'
theme.border_normal = theme.bg_normal 
theme.border_marked = '#622323'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal
-- theme.titlebar_[normal|focus]
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.fg_urgent
-- theme.mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

if home_path ~= nil then
	-- {{{ Icons
	-- {{{ Taglist icons
	theme.taglist_squares_sel   = themedir .. '/taglist/squarefz.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/squareza.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Layout icons
	theme.layout_tile       = themedir .. '/layouts/tile.png'
	theme.layout_tileleft   = themedir .. '/layouts/tileleft.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
	theme.layout_tiletop    = themedir .. '/layouts/tiletop.png'
	theme.layout_fairv      = themedir .. '/layouts/fairv.png'
	theme.layout_fairh      = themedir .. '/layouts/fairh.png'
	theme.layout_spiral     = themedir .. '/layouts/spiral.png'
	theme.layout_dwindle    = themedir .. '/layouts/dwindle.png'
	theme.layout_max        = themedir .. '/layouts/max.png'
	theme.layout_fullscreen = themedir .. '/layouts/fullscreen.png'
	theme.layout_magnifier  = themedir .. '/layouts/magnifier.png'
	theme.layout_floating   = themedir .. '/layouts/floating.png'
	-- }}}

	-- {{{ Titlebar icons
	theme.titlebar_close_button_focus  = themedir .. '/titlebar/close_focus.png'
	theme.titlebar_close_button_normal = themedir .. '/titlebar/close_normal.png'

	theme.titlebar_ontop_button_focus_active    = themedir .. '/titlebar/ontop_focus_active.png'
	theme.titlebar_ontop_button_normal_active   = themedir .. '/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_inactive  = themedir .. '/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_inactive = themedir .. '/titlebar/ontop_normal_inactive.png'

	theme.titlebar_sticky_button_focus_active    = themedir .. '/titlebar/sticky_focus_active.png'
	theme.titlebar_sticky_button_normal_active   = themedir .. '/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_inactive  = themedir .. '/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_inactive = themedir .. '/titlebar/sticky_normal_inactive.png'

	theme.titlebar_floating_button_focus_active    = themedir .. '/titlebar/floating_focus_active.png'
	theme.titlebar_floating_button_normal_active   = themedir .. '/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_inactive  = themedir .. '/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_inactive = themedir .. '/titlebar/floating_normal_inactive.png'

	theme.titlebar_maximized_button_focus_active    = themedir .. '/titlebar/maximized_focus_active.png'
	theme.titlebar_maximized_button_normal_active   = themedir .. '/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_inactive  = themedir .. '/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_inactive = themedir .. '/titlebar/maximized_normal_inactive.png'
	-- }}}
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- }}}
end
return theme
