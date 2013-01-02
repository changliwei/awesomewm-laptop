-- rbown, awesome3 theme, by zhuravlik

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'sans 8'
theme.taglist_font = 'sans 12'
theme.border_width = '1'
theme.bg_normal = '#585151'
theme.bg_focus  = '#393434'
theme.bg_urgent = '#343534'

if home_path ~= nil then
	config        = home_path .. '.config/awesome'
	shared        = '/usr/share/awesome'
	if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
	    shared    = '/usr/share/local/awesome'
	end
	sharedicons   = shared .. '/icons'
	sharedthemes  = shared .. '/themes'
	themes        = config .. '/themes'
	name = 'rbown'
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

	theme.bg_normal = '#585151aa'
	theme.bg_focus  = '#39343488'
	theme.bg_urgent = '#34353488'
end
--}}}

-- {{{ Styles
theme.menu_icon = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

-- {{{ Colors
theme.fg_normal = '#ffffff'
theme.fg_focus  = '#FEF9E0'
theme.fg_urgent = '#929392'
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

theme.bg_bottom     = theme.bg_normal -- bottom panel color
theme.fg_bottom     = '#ffffff' -- bottom panel text color
theme.bg_graphs     = '#393434' -- graphs background color

-- {{{ Borders
theme.border_normal = '#727352'
theme.border_focus  = '#586c2d'
theme.border_marked = '#CC9393'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = '#3F3F3F'
theme.titlebar_bg_normal = '#3F3F3F'
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = '#CC9393'
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = '#AECF96'
--theme.fg_center_widget = '#88A175'
--theme.fg_end_widget    = '#FF5656'
--theme.bg_widget        = '#494B4F'
--theme.border_widget    = '#3F3F3F'
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = '#CC9393'
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = '15'
theme.menu_width  = '130'
-- }}}

if home_path ~= nil then
	-- {{{ Icons
	-- {{{ Taglist
	theme.taglist_squares_sel   = sharedthemes .. '/zenburn/taglist/squarefz.png'
	theme.taglist_squares_unsel = sharedthemes .. '/zenburn/taglist/squarez.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc
	-- theme.awesome_icon           = themedir .. '/awesome-icon.png'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'
	-- }}}

	-- {{{ Layout
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

	-- {{{ Titlebar
	theme.titlebar_close_button_focus  = sharedthemes .. '/zenburn/titlebar/close_focus.png'
	theme.titlebar_close_button_normal = sharedthemes .. '/zenburn/titlebar/close_normal.png'

	theme.titlebar_ontop_button_focus_active  = sharedthemes .. '/zenburn/titlebar/ontop_focus_active.png'
	theme.titlebar_ontop_button_normal_active = sharedthemes .. '/zenburn/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. '/zenburn/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/zenburn/titlebar/ontop_normal_inactive.png'

	theme.titlebar_sticky_button_focus_active  = sharedthemes .. '/zenburn/titlebar/sticky_focus_active.png'
	theme.titlebar_sticky_button_normal_active = sharedthemes .. '/zenburn/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. '/zenburn/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/zenburn/titlebar/sticky_normal_inactive.png'

	theme.titlebar_floating_button_focus_active  = sharedthemes .. '/zenburn/titlebar/floating_focus_active.png'
	theme.titlebar_floating_button_normal_active = sharedthemes .. '/zenburn/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_inactive  = sharedthemes .. '/zenburn/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/zenburn/titlebar/floating_normal_inactive.png'

	theme.titlebar_maximized_button_focus_active  = sharedthemes .. '/zenburn/titlebar/maximized_focus_active.png'
	theme.titlebar_maximized_button_normal_active = sharedthemes .. '/zenburn/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. '/zenburn/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/zenburn/titlebar/maximized_normal_inactive.png'
	-- }}}
	-- }}}
end
return theme
