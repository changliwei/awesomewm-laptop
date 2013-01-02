-- wmii, awesome3 theme, by Adrian C. (anrxc) --

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
	name = 'wmii'
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

-- {{{ Styles
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

-- {{{ Colors
theme.fg_normal     = '#000000'
theme.fg_focus      = '#000000'
theme.fg_urgent     = '#CF6171'
--theme.fg_minimize = '#000000'
theme.bg_normal     = '#C1C48B'
theme.bg_focus      = '#81654F'
theme.bg_urgent     = '#C1C48B'
--theme.bg_minimize = '#81654F'
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

theme.bg_bottom     = '#C1C48B' -- bottom panel color
theme.fg_bottom     = '#000000' -- bottom panel text color
theme.bg_graphs     = '#81654F' -- graphs background color

-- {{{ Borders
theme.border_normal = '#81654F'
theme.border_focus  = '#000000'
theme.border_marked = '#CF6171'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = '#81654F'
theme.titlebar_bg_normal = '#C1C48B'
-- theme.titlebar_[normal|focus]
-- }}}

-- {{{ Other
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = '#CF6171'
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
theme.mouse_finder_color = '#CF6171'
-- theme.mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = '15'
theme.menu_width  = '100'
-- }}}
-- }}}

-- {{{ Icons
if home_path ~= nil then
	-- {{{ Taglist
	theme.taglist_squares_sel   = sharedthemes .. '/default/taglist/squarefw.png'
	theme.taglist_squares_unsel = sharedthemes .. '/default/taglist/squarew.png'
	--theme.taglist_squares_resize = 'false'
	-- }}}

	-- {{{ Misc
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floating.png'
	-- }}}

	-- {{{ Layout
	theme.layout_fairh      = sharedthemes .. '/default/layouts/fairh.png'
	theme.layout_fairv      = sharedthemes .. '/default/layouts/fairv.png'
	theme.layout_floating   = sharedthemes .. '/default/layouts/floating.png'
	theme.layout_magnifier  = sharedthemes .. '/default/layouts/magnifier.png'
	theme.layout_max        = sharedthemes .. '/default/layouts/max.png'
	theme.layout_fullscreen = sharedthemes .. '/default/layouts/fullscreen.png'
	theme.layout_tilebottom = sharedthemes .. '/default/layouts/tilebottom.png'
	theme.layout_tileleft   = sharedthemes .. '/default/layouts/tileleft.png'
	theme.layout_tile       = sharedthemes .. '/default/layouts/tile.png'
	theme.layout_tiletop    = sharedthemes .. '/default/layouts/tiletop.png'
	theme.layout_spiral     = sharedthemes .. '/default/layouts/spiral.png'
	theme.layout_dwindle    = sharedthemes .. '/default/layouts/dwindle.png'
	-- }}}

	-- {{{ Titlebar
	theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close_normal.png'
	theme.titlebar_close_button_focus  = sharedthemes .. '/default/titlebar/close_focus.png'

	theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/default/titlebar/ontop_normal_inactive.png'
	theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. '/default/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_active   = sharedthemes .. '/default/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_active    = sharedthemes .. '/default/titlebar/ontop_focus_active.png'

	theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/default/titlebar/sticky_normal_inactive.png'
	theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. '/default/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_active   = sharedthemes .. '/default/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_active    = sharedthemes .. '/default/titlebar/sticky_focus_active.png'

	theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/default/titlebar/floating_normal_inactive.png'
	theme.titlebar_floating_button_focus_inactive  = sharedthemes .. '/default/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_active   = sharedthemes .. '/default/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_active    = sharedthemes .. '/default/titlebar/floating_focus_active.png'

	theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/default/titlebar/maximized_normal_inactive.png'
	theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. '/default/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_active   = sharedthemes .. '/default/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_active    = sharedthemes .. '/default/titlebar/maximized_focus_active.png'
	-- }}}
	-- }}}
end

return theme
