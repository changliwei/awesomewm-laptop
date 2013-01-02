-- zenburn-custom, awesome3 theme, by Adrian C. (anrxc)

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'Terminus 8'
theme.taglist_font = 'Terminus 8'
theme.border_width = '1'

if home_path ~= nil then
	config = home_path .. '.config/awesome'
	shared = '/usr/share/awesome'

	if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
	    shared = '/usr/share/local/awesome'
	end

	sharedicons      = shared .. '/icons'
	sharedthemes     = shared .. '/themes'
	themes           = config .. '/themes'
	name             = 'zenburn-custom'
	themename        = '/' .. name
	theme.theme_name = name

	if not awful.util.file_readable(themes .. themename .. '/theme.lua') then
		themes = sharedthemes
	end
	themedir = themes .. themename

	if script_options.font ~= nil then
		theme.font = script_options.font
	end

	if script_options.taglist_font ~= nil then
		theme.taglist_font = script_options.taglist_font
	end

	theme.border_width = script_options.border_width
end
--}}}

-- {{{ Styles
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

-- {{{ Colors
theme.fg_normal = '#DCDCCC'
theme.fg_focus  = '#F0DFAF'
theme.fg_urgent = '#CC9393'
theme.bg_normal = '#3F3F3F'
theme.bg_focus  = '#1E2320'
theme.bg_urgent = '#3F3F3F'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal
-- }}}

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

theme.bg_bottom     = '#3F3F3F' -- bottom panel color
theme.fg_bottom     = '#DCDCCC' -- bottom panel text color
theme.bg_graphs     = '#1E2320' -- graphs background color

-- {{{ Borders
theme.border_normal = '#3F3F3F'
theme.border_focus  = '#6F6F6F'
theme.border_marked = '#CC9393'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = '#3F3F3F'
theme.titlebar_bg_normal = '#3F3F3F'
-- theme.titlebar_[normal|focus]
-- }}}

-- {{{ Widgets
theme.fg_widget        = '#AECF96'
theme.fg_center_widget = '#88A175'
theme.fg_end_widget    = '#FF5656'
theme.fg_off_widget    = '#494B4F'
theme.fg_netup_widget  = '#7F9F7F'
theme.fg_netdn_widget  = '#CC9393'
theme.bg_widget        = '#3F3F3F'
theme.border_widget    = '#3F3F3F'
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = '#CC9393'

if home_path ~= nil then
	-- {{{ Icons
	-- {{{ Taglist icons
	theme.taglist_squares_sel   = themedir .. '/taglist/squarefz.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/squareza.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc icons
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	--theme.awesome_icon           = themedir .. '/awesome.png'
	--theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
	--theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'
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
	-- }}}
end
return theme
