-- bamboo, awesome3 theme, by zhuravlik, based on Zenburn

--{{{ Main
local awful = require("awful")
awful.util = require("awful.util")

theme = {}
theme.font         = 'Sans 8'
theme.taglist_font = 'Sans 12'
theme.border_width = '1'
theme.bg_normal = '#434e2c'
theme.bg_focus  = '#0c0d0c'
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
	name = 'bamboo'
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

	theme.bg_normal = '#434e2caa'
	theme.bg_focus  = '#0c0d0c88'
	theme.bg_urgent = '#34353488'
	--}}}
end

-- {{{ Styles
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

-- {{{ Colors
theme.fg_normal = '#ffffff'
theme.fg_focus  = '#ddda9b'
theme.fg_urgent = '#929392'
--theme.bg_normal = '#434e2c88'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.bg_bottom     = theme.bg_normal -- bottom panel color
theme.fg_bottom     = '#ffffff' -- bottom panel text color
theme.bg_graphs     = '#3D4B10' -- graphs background color

-- {{{ Borders
--theme.border_width  = '2'
--theme.border_normal = '#34353488'
--theme.border_normal = '#2d4113'
--theme.border_normal = '#586c2d'
theme.border_normal = '#727352'
theme.border_focus  = '#586c2d'
--theme.border_focus  = '#a2bf36'
--theme.border_focus  = '#6886c1'
theme.border_marked = '#CC9393'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = '#3F3F3F'
theme.titlebar_bg_normal = '#3F3F3F'
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
	theme.taglist_squares_sel   = themedir .. '/taglist/squarefz.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/squarez.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- theme.awesome_icon           = themedir .. '/awesome-icon.png'
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
	theme.titlebar_close_button_focus  = themedir .. '/titlebar/close_focus.png'
	theme.titlebar_close_button_normal = themedir .. '/titlebar/close_normal.png'

	theme.titlebar_ontop_button_focus_active  = themedir .. '/titlebar/ontop_focus_active.png'
	theme.titlebar_ontop_button_normal_active = themedir .. '/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_inactive  = themedir .. '/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_inactive = themedir .. '/titlebar/ontop_normal_inactive.png'

	theme.titlebar_sticky_button_focus_active  = themedir .. '/titlebar/sticky_focus_active.png'
	theme.titlebar_sticky_button_normal_active = themedir .. '/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_inactive  = themedir .. '/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_inactive = themedir .. '/titlebar/sticky_normal_inactive.png'

	theme.titlebar_floating_button_focus_active  = themedir .. '/titlebar/floating_focus_active.png'
	theme.titlebar_floating_button_normal_active = themedir .. '/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_inactive  = themedir .. '/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_inactive = themedir .. '/titlebar/floating_normal_inactive.png'

	theme.titlebar_maximized_button_focus_active  = themedir .. '/titlebar/maximized_focus_active.png'
	theme.titlebar_maximized_button_normal_active = themedir .. '/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_inactive  = themedir .. '/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_inactive = themedir .. '/titlebar/maximized_normal_inactive.png'
end

return theme
