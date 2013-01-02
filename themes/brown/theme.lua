-- brown, awesome3 theme, by by zhuravlik, based on Default

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}

theme.font         = 'sans 8'
theme.taglist_font = 'sans 12'
theme.border_width = '1'
theme.bg_normal     = '#f0ebe2'
theme.bg_focus      = '#4f5353'
theme.bg_urgent     = '#ff0000'
theme.bg_minimize   = '#303535'

if home_path ~= nil then
	config        = home_path .. '.config/awesome'
	shared        = '/usr/share/awesome'
	if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
	    shared    = '/usr/share/local/awesome'
	end
	sharedicons   = shared .. '/icons'
	sharedthemes  = shared .. '/themes'
	themes        = config .. '/themes'
	name = 'brown'
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

	theme.bg_normal     = '#f0ebe2dd'
	theme.bg_focus      = '#4f5353dd'
	theme.bg_urgent     = '#ff0000dd'
	theme.bg_minimize   = '#303535dd'
	--}}}
end

theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

theme.fg_normal     = '#505050'
--theme.fg_focus      = '#b9bbbb'
theme.fg_focus      = '#cacccc'
theme.fg_urgent     = '#f7f7f7'
theme.fg_minimize  = '#b9bbbb'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.bg_bottom     = theme.bg_normal -- bottom panel color
theme.fg_bottom     = '#505050' -- bottom panel text color
theme.bg_graphs     = '#5A5A5A' -- graphs background color

theme.border_normal = '#cbc8c1'
theme.border_focus  = '#282421'
theme.border_marked = '#f7f7f7'

-- There are another variables sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--taglist_bg_focus = #ff0000

if home_path ~= nil then
	-- Display the taglist squares
	theme.taglist_squares_sel = themedir .. '/taglist/squarefw.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/square.png'

	theme.tasklist_floating_icon = themedir .. '/tasklist/floatingw.png'

	-- Variables set for theming menu
	-- menu_[bg|fg]_[normal|focus]
	-- menu_[border_color|border_width]
	theme.menu_submenu_icon = themedir .. '/submenu.png'
	theme.menu_height   = '15'
	theme.menu_width    = '100'

	-- You can add as many variables as
	-- you wish and access them by using
	-- beautiful.variable in your rc.lua
	--bg_widget    = #cc0000

	-- Define the image to load
	theme.titlebar_close_button_normal = themedir .. '/titlebar/close_normal.png'
	theme.titlebar_close_button_focus = themedir .. '/titlebar/close_focus.png'

	theme.titlebar_ontop_button_normal_inactive = themedir .. '/titlebar/ontop_normal_inactive.png'
	theme.titlebar_ontop_button_focus_inactive = themedir .. '/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_active = themedir .. '/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_active = themedir .. '/titlebar/ontop_focus_active.png'

	theme.titlebar_sticky_button_normal_inactive = themedir .. '/titlebar/sticky_normal_inactive.png'
	theme.titlebar_sticky_button_focus_inactive = themedir .. '/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_active = themedir .. '/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_active = themedir .. '/titlebar/sticky_focus_active.png'

	theme.titlebar_floating_button_normal_inactive = themedir .. '/titlebar/floating_normal_inactive.png'
	theme.titlebar_floating_button_focus_inactive = themedir .. '/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_active = themedir .. '/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_active = themedir .. '/titlebar/floating_focus_active.png'

	theme.titlebar_maximized_button_normal_inactive = themedir .. '/titlebar/maximized_normal_inactive.png'
	theme.titlebar_maximized_button_focus_inactive = themedir .. '/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_active = themedir .. '/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_active = themedir .. '/titlebar/maximized_focus_active.png'

	-- You can use your own layout icons like this:
	theme.layout_fairh = themedir .. '/layouts/fairh.png'
	theme.layout_fairv = themedir .. '/layouts/fairv.png'
	theme.layout_floating = themedir .. '/layouts/floating.png'
	theme.layout_magnifier = themedir .. '/layouts/magnifier.png'
	theme.layout_max = themedir .. '/layouts/max.png'
	theme.layout_fullscreen = themedir .. '/layouts/fullscreen.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
	theme.layout_tileleft = themedir .. '/layouts/tileleft.png'
	theme.layout_tile = themedir .. '/layouts/tile.png'
	theme.layout_tiletop = themedir .. '/layouts/tiletop.png'

	--theme.awesome_icon = '/usr/share/awesome/icons/awesome16.png'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- theme.awesome_icon = themedir .. '/awesome-icon-3.png'
end

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
