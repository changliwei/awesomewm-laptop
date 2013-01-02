---------------------------
--light awesome theme --
---------------------------

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'Envy Code R 8'
theme.taglist_font = 'Envy Code R 12'
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
	name = 'pdqlight'
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
theme.font          = 'Envy Code R 9' -- 'font name size'

theme.bg_normal     = '#D7D7D7'
theme.bg_focus      = '#EEEEEE'
theme.bg_urgent     = '#ff0000'
theme.bg_minimize   = '#D4D4D4'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#000000'
theme.fg_focus      = '#000000'
theme.fg_urgent     = '#000000'
theme.fg_minimize   = '#0f0f0f'

theme.bg_bottom     = '#212121' -- bottom panel color
theme.fg_bottom     = '#D4D4D4' -- bottom panel text color
theme.bg_graphs     = '#0f0f0f' -- graphs background color

theme.border_normal = '#000000'
theme.border_focus  = '#000000'
theme.border_marked = '#000000'

if home_path ~= nil then
	-- Display the taglist squares
	theme.taglist_squares_sel   = sharedthemes .. '/default/taglist/squarefw.png'
	theme.taglist_squares_unsel = sharedthemes .. '/default/taglist/squarew.png'

	theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'

	-- Variables set for theming the menu:
	-- menu_[bg|fg]_[normal|focus]
	-- menu_[border_color|border_width]
	theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
	theme.menu_height = '15'
	theme.menu_width  = '100'

	-- You can add as many variables as
	-- you wish and access them by using
	-- beautiful.variable in your rc.lua
	--theme.bg_widget = '#cc0000'

	-- Define the image to load
	theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close_normal.png'
	theme.titlebar_close_button_focus  = sharedthemes .. '/default/titlebar/close_focus.png'

	theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/default/titlebar/ontop_normal_inactive.png'
	theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. '/default/titlebar/ontop_focus_inactive.png'
	theme.titlebar_ontop_button_normal_active = sharedthemes .. '/default/titlebar/ontop_normal_active.png'
	theme.titlebar_ontop_button_focus_active  = sharedthemes .. '/default/titlebar/ontop_focus_active.png'

	theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/default/titlebar/sticky_normal_inactive.png'
	theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. '/default/titlebar/sticky_focus_inactive.png'
	theme.titlebar_sticky_button_normal_active = sharedthemes .. '/default/titlebar/sticky_normal_active.png'
	theme.titlebar_sticky_button_focus_active  = sharedthemes .. '/default/titlebar/sticky_focus_active.png'

	theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/default/titlebar/floating_normal_inactive.png'
	theme.titlebar_floating_button_focus_inactive  = sharedthemes .. '/default/titlebar/floating_focus_inactive.png'
	theme.titlebar_floating_button_normal_active = sharedthemes .. '/default/titlebar/floating_normal_active.png'
	theme.titlebar_floating_button_focus_active  = sharedthemes .. '/default/titlebar/floating_focus_active.png'

	theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/default/titlebar/maximized_normal_inactive.png'
	theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. '/default/titlebar/maximized_focus_inactive.png'
	theme.titlebar_maximized_button_normal_active = sharedthemes .. '/default/titlebar/maximized_normal_active.png'
	theme.titlebar_maximized_button_focus_active  = sharedthemes .. '/default/titlebar/maximized_focus_active.png'

	theme.layout_fairh = sharedthemes .. '/default/layouts/fairhw.png'
	theme.layout_fairv = sharedthemes .. '/default/layouts/fairvw.png'
	theme.layout_floating  = sharedthemes .. '/default/layouts/floatingw.png'
	theme.layout_magnifier = sharedthemes .. '/default/layouts/magnifierw.png'
	theme.layout_max = sharedthemes .. '/default/layouts/maxw.png'
	theme.layout_fullscreen = sharedthemes .. '/default/layouts/fullscreenw.png'
	theme.layout_tilebottom = sharedthemes .. '/default/layouts/tilebottomw.png'
	theme.layout_tileleft   = sharedthemes .. '/default/layouts/tileleftw.png'
	theme.layout_tile = sharedthemes .. '/default/layouts/tilew.png'
	theme.layout_tiletop = sharedthemes .. '/default/layouts/tiletopw.png'
	theme.layout_spiral  = sharedthemes .. '/default/layouts/spiralw.png'
	theme.layout_dwindle = sharedthemes .. '/default/layouts/dwindlew.png'
	--theme.awesome_icon = home_path .. '.config/awesome/icons/awesome16.png'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- theme.start_here_icon = home_path .. '.config/awesome/icons/Gentoo.png'
	-- theme.mspacman_icon = home_path .. '.config/awesome/icons/1.jpeg'
	-- theme.pacman_icon = home_path .. '.config/awesome/icons/th_Ghost_blue2.gif'
end
return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
