-- dunzor, awesome3 theme, by dunz0r

local awful = require("awful")
awful.util = require("awful.util")

if home_path ~= nil then
	require('awful.util')
end

theme = {}
theme.font         = 'Envy Code R 9.5'
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
	name     = 'dunzor'
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

end

theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
theme.icon_theme = 'gnome'

theme.bg_normal     = '#161616'
theme.bg_focus      = '#000000'
theme.bg_urgent     = '#6e3e3e'
theme.bg_minimize   = '#161616'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#4CC3FF'
theme.fg_focus      = '#00D315'
theme.fg_urgent     = '#ffffff'
theme.fg_minimize   = '#565656'

theme.bg_bottom     = '#161616' -- bottom panel color
theme.fg_bottom     = '#c8c8c8' -- bottom panel text color
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

theme.border_normal = '#1691CF'
theme.border_focus  = '#535d6c'
theme.border_marked = '#91231c'

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_bg_focus = '#ff0000'

if home_path ~= nil then
	theme.menu_height = '15'
	theme.menu_width  = '100'
	-- Display the taglist squares
	-- {{{ Taglist
	theme.taglist_squares_sel   = themedir .. '/taglist/squarefz.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/squareza.png'
	theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc
	-- theme.pacup = themedir .. '/custom/pacnew.png'
	-- theme.pacnew = themedir .. '/custom/pacaur.png'
	--theme.awesome_icon           = themedir .. '/shikamaru.png'
	theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'
	-- }}}

	-- {{{ Layout
	theme.layout_tile       = themedir .. '/layouts/tilebottomw.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottomw.png'
	theme.layout_tiletop    = themedir .. '/layouts/tiletopw.png'
	theme.layout_tileleft   = themedir .. '/layouts/tileleftw.png'
	theme.layout_fairv      = themedir .. '/layouts/fairvw.png'
	theme.layout_fairh      = themedir .. '/layouts/fairhw.png'
	theme.layout_spiral     = themedir .. '/layouts/spiralw.png'
	theme.layout_dwindle    = themedir .. '/layouts/dwindlew.png'
	theme.layout_max        = themedir .. '/layouts/maxw.png'
	theme.layout_fullscreen = themedir .. '/layouts/fullscreenw.png'
	theme.layout_magnifier  = themedir .. '/layouts/magnifierw.png'
	theme.layout_floating   = themedir .. '/layouts/floatingw.png'
	-- }}}

	-- {{{ Titlebar
	theme.titlebar_close_button_focus  = sharedthemes .. '/titlebar/close_focus.png'
	theme.titlebar_close_button_normal = sharedthemes .. '/titlebar/close_normal.png'

	theme.titlebar_ontop_button_focus_active    = sharedthemes .. '/titlebar/ontop_focus_active.png'
	theme.titlebar_ontop_button_normal_active   = sharedthemes .. '/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. '/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/titlebar/ontop_normal_inactive.png'

	theme.titlebar_sticky_button_focus_active    = sharedthemes .. '/titlebar/sticky_focus_active.png'
	theme.titlebar_sticky_button_normal_active   = sharedthemes .. '/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. '/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/titlebar/sticky_normal_inactive.png'

	theme.titlebar_floating_button_focus_active    = sharedthemes .. '/titlebar/floating_focus_active.png'
	theme.titlebar_floating_button_normal_active   = sharedthemes .. '/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_inactive  = sharedthemes .. '/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/titlebar/floating_normal_inactive.png'

	theme.titlebar_maximized_button_focus_active    = sharedthemes .. '/titlebar/maximized_focus_active.png'
	theme.titlebar_maximized_button_normal_active   = sharedthemes .. '/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. '/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/titlebar/maximized_normal_inactive.png'
	-- }}}
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

	-- calendar settings
	theme.calendar_w         = 160
	theme.calendar_fg        = theme.fg_normal
	theme.calendar_bg        = theme.bg_normal
end

return theme
