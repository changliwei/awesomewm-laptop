-- byte, awesome3 theme, by mu @ freenode

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}
theme.font         = 'Sans 10'
theme.taglist_font = 'Sans 12'
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
	name     = 'byte'
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

theme.menu_icons = 'Bespin-Black' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

theme.bg_normal     = '#262729'
theme.bg_focus      = '#262729'
theme.bg_urgent     = '#262729'
theme.bg_minimize   = '#262729'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#fafafa'
theme.fg_focus      = '#659fdb'
theme.fg_urgent     = '#f03669'
theme.fg_minimize   = '#fafafa'

theme.bg_bottom     = '#262729' -- bottom panel color
theme.fg_bottom     = '#fafafa' -- bottom panel text color
theme.bg_graphs     = '#000000' -- graphs background color

theme.border_normal = '#fafafa'
theme.border_focus  = '#659fdb'
theme.border_marked = '#91231c'

-- {{{ Widgets
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = theme.fg_urgent
theme.bg_widget        = theme.bg_normal
theme.border_widget    = theme.bg_normal

if home_path ~= nil then
	-- Display the taglist squares
	theme.taglist_squares_sel   = themedir .. '/taglist/focus.png'
	theme.taglist_squares_unsel = themedir .. '/taglist/unfocus.png'

	-- Layout icons
	theme.layout_fairh = themedir .. '/layouts/fairh.png'
	theme.layout_fairv = themedir .. '/layouts/fairv.png'
	theme.layout_floating  = themedir .. '/layouts/floating.png'
	--theme.layout_magnifier = themedir .. '/layouts/magnifier.png'
	--theme.layout_max = themedir .. '/layouts/max.png'
	--theme.layout_fullscreen = themedir .. '/layouts/fullscreen.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
	theme.layout_tileleft   = themedir .. '/layouts/tileleft.png'
	theme.layout_tile = themedir .. '/layouts/tile.png'
	theme.layout_tiletop = themedir .. '/layouts/tiletop.png'
	--theme.layout_spiral  = themedir .. '/layouts/spiral.png'
	--theme.layout_dwindle = themedir .. '/layouts/dwindle.png'
	theme.menu_height   = '22'
	theme.menu_width    = '100'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- Widget icons
	-- theme.widget_sep = themes .. '/icons/byte/seperator.png'
	-- theme.widget_cpu = themes .. '/icons/byte/cpu.png'
	-- theme.widget_temp = themes .. '/icons/byte/temp.png'
	-- theme.widget_mem = themes .. '/icons/byte/mem.png'
	-- theme.widget_spkr = themes .. '/icons/byte/spkr.png'
	-- theme.widget_head = themes .. '/icons/byte/phones.png'
	-- theme.widget_netdown = themes .. '/icons/byte/net_down.png'
	-- theme.widget_netup = themes .. '/icons/byte/net_up.png'
	-- theme.widget_mail = themes .. '/icons/byte/mail.png'
	-- theme.widget_newmail = themes .. '/icons/byte/newmail.png'
	-- theme.widget_pacman = themes .. '/icons/byte/pacman.png'
	-- theme.widget_newpackage = themes .. '/icons/byte/newpackage.png'
	-- theme.widget_batt_full = themes .. '/icons/byte/bat_full.png'
	-- theme.widget_batt_low = themes .. '/icons/byte/bat_low.png'
	-- theme.widget_batt_empty = themes .. '/icons/byte/bat_empty.png'
	-- theme.widget_clock = themes .. '/icons/byte/clock.png'
	-- theme.widget_mpd = themes .. '/icons/byte/note.png'
end

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
