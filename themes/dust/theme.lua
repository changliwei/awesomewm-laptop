-- dust, awesome3 theme, based off of the gtk+ theme dust, by tdy

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'clean 8'
theme.taglist_font = 'clean 10'
theme.border_width = '1'
theme.bg_normal     = '#222222'

if home_path ~= nil then
	config        = home_path .. '.config/awesome'
	shared        = '/usr/share/awesome'
	if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
	    shared    = '/usr/share/local/awesome'
	end
	sharedicons   = shared .. '/icons'
	sharedthemes  = shared .. '/themes'
	themes        = config .. '/themes'
	name = 'dust'
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

	theme.bg_normal     = '#22222200'
end
--}}}
theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

theme.bg_focus      = '#908884'
theme.bg_urgent     = '#cd7171'
theme.bg_minimize   = '#444444'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#aaaaaa'
theme.fg_focus      = '#111111'
theme.fg_urgent     = '#ffffff'
theme.fg_minimize   = '#ffffff'

theme.bg_bottom     = theme.bg_normal -- bottom panel color
theme.fg_bottom     = '#aaaaaa' -- bottom panel text color
theme.bg_graphs     = '#0f0f0f' -- graphs background color

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

theme.border_normal = '#222222'
theme.border_focus  = '#908884'
theme.border_marked = '#91231c'

if home_path ~= nil then
	theme.taglist_squares_sel = themedir .. '/taglist14/squaref.png'
	theme.taglist_squares_unsel = themedir .. '/taglist14/square.png'

	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'

	theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
	theme.menu_height   = '15'
	theme.menu_width    = '100'

	-- Define the image to load
	theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close_normal.png'
	theme.titlebar_close_button_focus = sharedthemes .. '/default/titlebar/close_focus.png'

	theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/default/titlebar/ontop_normal_inactive.png'
	theme.titlebar_ontop_button_focus_inactive = sharedthemes .. '/default/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_active = sharedthemes .. '/default/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_active = sharedthemes .. '/default/titlebar/ontop_focus_active.png'

	theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/default/titlebar/sticky_normal_inactive.png'
	theme.titlebar_sticky_button_focus_inactive = sharedthemes .. '/default/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_active = sharedthemes .. '/default/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_active = sharedthemes .. '/default/titlebar/sticky_focus_active.png'

	theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/default/titlebar/floating_normal_inactive.png'
	theme.titlebar_floating_button_focus_inactive = sharedthemes .. '/default/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_active = sharedthemes .. '/default/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_active = sharedthemes .. '/default/titlebar/floating_focus_active.png'

	theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/default/titlebar/maximized_normal_inactive.png'
	theme.titlebar_maximized_button_focus_inactive = sharedthemes .. '/default/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_active = sharedthemes .. '/default/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_active = sharedthemes .. '/default/titlebar/maximized_focus_active.png'

	theme.layout_fairh      = themedir .. '/layouts14/fairhw.png'
	theme.layout_fairv      = themedir .. '/layouts14/fairvw.png'
	theme.layout_floating   = themedir .. '/layouts14/floatingw.png'
	theme.layout_magnifier  = themedir .. '/layouts14/magnifierw.png'
	theme.layout_max        = themedir .. '/layouts14/maxw.png'
	theme.layout_fullscreen = themedir .. '/layouts14/fullscreenw.png'
	theme.layout_tilebottom = themedir .. '/layouts14/tilebottomw.png'
	theme.layout_tileleft   = themedir .. '/layouts14/tileleftw.png'
	theme.layout_tile       = themedir .. '/layouts14/tilew.png'
	theme.layout_tiletop    = themedir .. '/layouts14/tiletopw.png'
	theme.layout_spiral     = themedir .. '/layouts14/spiralw.png'
	theme.layout_dwindle    = themedir .. '/layouts14/dwindlew.png'

	-- theme.awesome_icon = themedir .. '/awesome14-dust.png'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

end
return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
