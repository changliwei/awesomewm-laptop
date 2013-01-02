-- matrix, awesome3 theme, by ShdB --

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
	name = 'purple-matrix'
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

theme.bg_normal     = '#171717'
theme.bg_focus      = '#171717'
theme.bg_urgent     = '#171717'
theme.bg_minimize   = '#171717'
theme.icon_theme = 'gnome'
theme.bg_systray    = theme.bg_normal

theme.hilight       = '#ffcc44'

theme.fg_normal     = '#7A5ADA'
theme.fg_focus      = '#A0A0F0'
theme.fg_urgent     = '#cc0000'

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

theme.bg_bottom     = '#171717' -- bottom panel color
theme.fg_bottom     = '#7A5ADA' -- bottom panel text color
theme.bg_graphs     = '#171717' -- graphs background color

theme.graph_bg      = '#333333'
theme.graph_center  = '#779900'
theme.graph_end     = '#ff9900'

theme.border_width  = '1'
theme.border_normal = '#A0A0F0'
theme.border_focus  = '#7A5ADA'
theme.border_marked = '#7A5ADA'

theme.menu_height   = '20'
theme.menu_width    = '100'

theme.taglist_squares = 'true'
if home_path ~= nil then
	theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

	-- theme.battery = themes .. '/icons/him/battery.png'
	-- theme.volume = themes .. '/icons/him/volume.png'
	-- theme.muted = themes .. '/icons/him/muted.png'
	-- theme.cpu = themes .. '/icons/him/cpu.png'
	-- theme.temp = themes .. '/icons/him/temp.png'
	-- theme.mail = themes .. '/icons/him/mail.png'
	-- theme.mem = themes .. '/icons/him/mem.png'
	-- theme.wireless = themes .. '/icons/him/wireless.png'
	-- theme.network = themes .. '/icons/him/network.png'
	-- theme.mpd_play = themes .. '/icons/him/mpd_play.png'
	-- theme.mpd_pause = themes .. '/icons/him/mpd_pause.png'
	-- theme.mpd_stop = themes .. '/icons/him/mpd_stop.png'

	theme.layout_fairh = themedir .. '/layouts/fairh.png'
	theme.layout_fairv = themedir .. '/layouts/fairv.png'
	theme.layout_floating = themedir .. '/layouts/floating.png'
	theme.layout_max = themedir .. '/layouts/max.png'
	theme.layout_spiral = themedir .. '../default/layouts/spiralw.png'
	theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
	theme.layout_tile = themedir .. '/layouts/tile.png'
end
return theme
