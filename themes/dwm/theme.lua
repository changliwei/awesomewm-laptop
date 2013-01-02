-- dwm, awesome3 theme

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
	name = 'dwm'
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

theme.bg_normal     = '#cccccc'
theme.bg_focus      = '#0066ff'
theme.bg_urgent     = '#ffdd00'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#000000'
theme.fg_focus      = '#ffffff'
theme.fg_urgent     = '#111111'

theme.bg_bottom     = '#cccccc' -- bottom panel color
theme.fg_bottom     = '#000000' -- bottom panel text color
theme.bg_graphs     = '#797979' -- graphs background color

theme.border_normal = '#cccccc'
theme.border_focus  = '#0066ff'

if home_path ~= nil then
	theme.taglist_squares_sel    = themedir .. '/tasklist_f.png'
	theme.taglist_squares_unsel  = themedir .. '/tasklist_u.png'
	theme.tasklist_floating_icon = themedir .. '/floating.png'

	theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close.png'
	theme.titlebar_close_button_focus  = sharedthemes .. '/default/titlebar/closer.png'

	theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
	-- theme.awesome_icon = sharedicons .. '/awesome16.png'
end

return theme
