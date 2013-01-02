-- dunzor2, awesome3 theme, by dunz0r

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'Terminus 8'
theme.taglist_font = 'Terminus 10'
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
	name     = 'dunzor2'
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
--}}}
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

theme.bg_normal     = '#1a1a1a'
theme.bg_focus      = '#3e3e3e'
theme.bg_urgent     = '#303030'
theme.bg_minimize   = '#444444'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#898989'
theme.fg_focus      = '#a6a600'
theme.fg_unfocus    = '#606060'
theme.fg_urgent     = '#98565e'
theme.fg_highlight  = '#98565e'
theme.fg_minimize   = '#98565e'

theme.bg_bottom     = '#1a1a1a' -- bottom panel color
theme.fg_bottom     = '#898989' -- bottom panel text color
theme.bg_graphs     = '#0f0f0f' -- graphs background color

theme.border_normal = '#000000'
theme.border_focus  = '#a6a600'
theme.border_marked = '#91231c'

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_bg_focus = '#ff0000'

-- {{{ Mouse finder
theme.mouse_finder_color = '#CC9393'
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = '15'
theme.menu_width  = '100'
-- }}}

if home_path ~= nil then
	-- {{{ Icons
	-- {{{ Taglist
	theme.taglist_squares_sel   = sharedthemes .. '/zenburn/taglist/squarefz.png'
	theme.taglist_squares_unsel = sharedthemes .. '/zenburn/taglist/squarez.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc
	theme.awesome_icon           = sharedthemes .. '/zenburn/awesome-icon.png'
	theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'
	-- }}}

	-- {{{ Layout
	theme.layout_tile       = sharedthemes .. '/zenburn/layouts/tile.png'
	theme.layout_tileleft   = sharedthemes .. '/zenburn/layouts/tileleft.png'
	theme.layout_tilebottom = sharedthemes .. '/zenburn/layouts/tilebottom.png'
	theme.layout_tiletop    = sharedthemes .. '/zenburn/layouts/tiletop.png'
	theme.layout_fairv      = sharedthemes .. '/zenburn/layouts/fairv.png'
	theme.layout_fairh      = sharedthemes .. '/zenburn/layouts/fairh.png'
	theme.layout_spiral     = sharedthemes .. '/zenburn/layouts/spiral.png'
	theme.layout_dwindle    = sharedthemes .. '/zenburn/layouts/dwindle.png'
	theme.layout_max        = sharedthemes .. '/zenburn/layouts/max.png'
	theme.layout_fullscreen = sharedthemes .. '/zenburn/layouts/fullscreen.png'
	theme.layout_magnifier  = sharedthemes .. '/zenburn/layouts/magnifier.png'
	theme.layout_floating   = sharedthemes .. '/zenburn/layouts/floating.png'
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
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- theme.awesome_icon = sharedicons .. '/awesome16.png'
end

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
