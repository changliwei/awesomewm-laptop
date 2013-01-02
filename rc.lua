-- https://github.com/idk/awesomewm-X  https://github.com/idk/pdq
-- BASIC CONFIGURATION begins on line 57

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

vicious = require("vicious")
local scratch = require("scratch")

-- Local libraries-- https://github.com/terceiro/awesome-freedesktop
require('freedesktop.utils') 
require('freedesktop.menu')

local aweror = require("aweror")

-- http://awesome.naquadah.org/wiki/Document_keybindings
local keydoc = require('keydoc')

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = 'Oops, there were errors during startup!',
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal('debug::error', function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = 'Oops, an error happened!',
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- define /home/$USER
home_path  = os.getenv('HOME') .. '/'

-- START BASIC CONFIGURATION -- (reload awesome when make any changes below)
script_options = {
    font = 'Envy Code R 9.5',    -- comment to use themes settings
    taglist_font = 'Envy Code R 10', -- comment to use themes settings
    border_width = 1,
}

-- DO NOT EDIT THIS SECTION START --
-- Themes define colours, icons, and wallpapers
theme_path = home_path  .. '.config/awesome/themes/current/theme.lua' -- DO NOT modify
beautiful.init(theme_path)
-- DO NOT EDIT THIS SECTION END --

usr = {
    terminal      = 'urxvtc', -- requires urxvt daemon: 'urxvtd -q -o -f'
    terminal_cmd  = 'urxvtc -e ',
    editor        = 'subl', -- nano vim gedit geany subl etc.
    gui_editor    = true, -- terminal or gui based. (true/false)
    terminal_font = "URxvt*font: xft:terminus:pixelsize=16:antialias=false\n" ..
                 -- "!URxvt*font: xft:Envy Code R-10\n" ..
                    "URxvt*iconFile: /usr/share/icons/gnome/16x16/apps/gnome-terminal.png\n" ..
                    "URxvt*background: rgba:1111/1111/1111/0000\n" .. -- black
                    "URxvt*foreground: #d3d3d3\n" .. -- white
                    "URxvt*transparent: false\n" .. 
                    "Urxvt*fading: 10\n" ..
                    "Urxvt*fadeColor: #a146ff\n" ..
                    "URxvt*perl-ext-common:  default,clipboard,matcher\n" ..
                    "*underlineColor: #1691CF\n" ..
                    "URxvt*matcher.button:   1\n" ..
                    "URxvt*url-launcher: /usr/bin/firefox\n",
 -- poweroff   = 'sudo /sbin/poweroff',
 -- reboot     = 'sudo /sbin/reboot',
    poweroff   = 'systemctl poweroff',
    reboot     = 'systemctl reboot',
 -- hibernate  = 'sudo /usr/sbin/pm-hibernate',
 -- suspend    = 'sudo /usr/sbin/pm-suspend',
 -- gui_sudo   = 'kdesu', -- sudo command for gui applications (gksudo, kdesu)
    file_manager = {
        -- 'DISABLED', -- uncomment this to hide menu entries
           'dolphin',
        -- 'Thunar',
           'spacefm',
        -- 'pcmanfm,
    },
    web_browser = {
        -- 'DISABLED', -- uncomment this to hide menu entries
           'firefox',
        -- 'firefox-beta-bin',
           'chromium',
        -- 'opera',
        -- 'midori',
        -- 'luakit',
    },
    primary_browser =    'firefox',
                      -- 'chromium',        
    top_wibox    = 16, -- default 15 (height)
    cpuwidget_enable       = true,
    memwidget_enable       = true,
    thermalwidget_enable   = true,
    pacmanwidget_enable    = true, 
    aurwidget_enable       = true,
    tb_volume_enable       = true,
    debug_clients          = false, -- useful for client rules setup
    date_format            = '%I:%M%p' , -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers
    
    -- http://awesome.naquadah.org/wiki/Move_Mouse
    -- set the desired pixel coordinates:
    --  if your screen is 1440x900 the this line sets the bottom right.
    -- local safeCoords = { x = 1440, y = 900 }
    -- if your screen is 1440x900 the this line sets the bottom left.
    -- safeCoords = { x = 0, y = 900 },
    -- safeCoords = { x = 720, y = 0 }
    safeCoords = { x = 0, y = 0 }, -- top left
    -- Flag to tell Awesome whether to do this at startup.
    moveMouseOnStartup = true,

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt(Mod1).
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey   = 'Mod4', -- change to Mod1 (Alt)if using Virtualbox

    exec = awful.util.spawn,
    awmXversion = '0.0.6',
}

space = wibox.widget.textbox()
space:set_text(' ')

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.floating,        -- 1
    --  awful.layout.suit.tile,        -- 2
    awful.layout.suit.tile.left,       -- 3
    awful.layout.suit.max,             -- 4
    --  awful.layout.suit.tile.bottom,
    --  awful.layout.suit.tile.top,
    --  awful.layout.suit.fair,
    --  awful.layout.suit.fair.horizontal,
    awful.layout.suit.max.fullscreen,  -- 11
    -- awful.layout.suit.magnifier     -- 12
}

-- {{{ Wallpaper
-- if beautiful.wallpaper then
--     for s = 1, screen.count() do
--         gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--     end
-- end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
-- tags = {}
-- for s = 1, screen.count() do
--     tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
-- end
-- }}}

-- Tags 
local tags = {
  --names = { '☢', '☎', '☀', '❖', 'Ω', '⌨', '⚡', '☣' },
  names = { "一", "二", "三", "四", "五", "六", "七", "八" },

    layout = {
      layouts[2],  -- 1:firefox (max size)
      layouts[2],  -- 2:weechat/xchat/pidgin (tiled)
      layouts[2],  -- 3:logs/bots/shells (tiled)
      layouts[2],  -- 4:media playing (tiled)
      layouts[1],  -- 5:media editing (floating)
      layouts[2],  -- 6:projects/development (tiled)
      layouts[2],  -- 7:shells (floating)
      layouts[1]   -- 8:shells (floating)
            }
        }

for s = 1, screen.count() do
   -- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end

-- END BASIC CONFIGURATION --

if usr.gui_editor then
   editor_cmd = usr.editor
-- su_editor_cmd = usr.gui_sudo .. ' ' .. usr.editor
else
   editor_cmd = usr.terminal_cmd .. usr.editor
-- su_editor_cmd = usr.terminal_cmd .. 'sudo ' .. usr.editor
end
local sudo_bash = usr.terminal_cmd .. 'sudo bash '

-- write terminal font options to .Xdefaults
local f = io.open(home_path .. '.config/awesome/.urxvt_font', 'w+')
local t = f:write(usr.terminal_font)
f:close()

-- Screen width widget modifiers by pdq 07-13-2012
modifier = {
    seperator_min = 5,
    seperator_max = 10,
    cpu_w         = 30,
    cpu_text      = ' <span color="#69EF6B">',
    mem_text      = '<span color="#25F0FF">', 
    du_text       = '<span color="yellow">DU</span>',
--  extra_widgets = true
}

 cardid  = 0
 channel = "Master"

  function volume (mode, widget)
     local cardid  = 0
     local channel = "Master"
     if mode == "update" then
         local status = io.popen("amixer -c " .. cardid .. " -- sget " .. channel):read("*all")
         
         local volume = tonumber(string.match(status, "(%d?%d?%d)%%"))
 
         status = string.match(status, "%[(o[^%]]*)%]")
 
         local color = "#FF0000"
         if string.find(status, "on", 1, true) then
              color = "#00FF00"
         end
         status = ""
         for i = 1, math.floor(volume / 10) do
             status = status .. "|"
         end
         for i = math.floor(volume / 10) + 1, 10 do
             status = status .. "-"
         end
         status = "[" ..status .. "]"

         widget:set_markup("<span color=\"" .. color .. "\">" .. status .. "</span>") 
     elseif mode == "up" then
         os.execute("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%+")
         volume("update", widget)
     elseif mode == "down" then
         os.execute("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%-")
         volume("update", widget)
     else
         os.execute("amixer -c " .. cardid .. " sset " .. channel .. " toggle")
         volume("update", widget)
     end
 end
-- {{{ Menu
-- Create a laucher widget and a main menu
freedesktop.utils.icon_theme = beautiful.menu_icons
local menu_items = freedesktop.menu.new()

-- themes menu
local thememenu = {}
local function theme_load(theme)
   usr.exec('ln -sfn ' .. home_path .. '.config/awesome/themes/' .. theme .. ' ' .. home_path .. '.config/awesome/themes/current')
   awesome.restart()
end
local function theme_menu()
   local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/themes/')
   for l in f:lines() do
    local item = { l, function () theme_load(l) end }
    table.insert(thememenu, item)
   end
   f:close()
end
theme_menu()

-- menu icon menu pdq 07-02-2012
local iconmenu = {}
local function icon_load(icon)
   usr.exec('ln -sfn ' .. home_path .. '.config/awesome/icons/' .. icon .. ' ' .. home_path .. '.config/awesome/icons/menu_icon.png')
   awesome.restart()
end
local function icon_menu()
   local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/icons/')
   for l in f:lines() do
    local item = { l, function () icon_load(l) end }
    table.insert(iconmenu, item)
   end
   f:close()
end
icon_menu()

-- menu item function for awesome pdq -07-03-2012
function usr_menu_item(usr_entry, usr_icon)
   for key, usr_item in pairs(usr_entry) do
      if usr_item == 'DISABLED' then
         break
      end
      usr_menu_entry = usr_item:gsub("^%l", string.upper)
      table.insert(menu_items, { usr_menu_entry, usr_item, freedesktop.utils.lookup_icon({icon = usr_icon}) })
   end
end

local myawesomemenu = { 
   { 'Awesome Help', 'xdg-open http://awesome.naquadah.org/doc/manpages/awesome.1.html', freedesktop.utils.lookup_icon({ icon = 'help' }) },
   { 'Themes', thememenu, freedesktop.utils.lookup_icon({ icon = 'style' }) },
   { 'Menu icon', iconmenu, freedesktop.utils.lookup_icon({ icon = 'style' }) },
   { 'Edit Current config', editor_cmd .. ' ' .. awesome.conffile, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Edit Current theme', editor_cmd .. ' ' .. theme_path, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Edit Current script', editor_cmd .. ' ' .. home_path .. '.config/awesome/global_script.sh', freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Edit Current conky', editor_cmd .. ' ' .. home_path .. '.config/conky/.bottomrc', freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Debug Awesome', usr.terminal_cmd .. 'tail -f ' .. home_path .. '.cache/awesome/stderr', freedesktop.utils.lookup_icon({ icon = 'help' }) },
   { 'Test Awesome', '/bin/bash ' .. home_path .. '.config/awesome/bin/awesome_test' },
-- { 'Preferred Apps' , 'exo-preferred-applications', freedesktop.utils.lookup_icon({ icon = 'help' })},
   { 'Reload', awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Logout', awesome.quit, freedesktop.utils.lookup_icon({ icon = 'system-log-out' })},
   { 'Shutdown' , usr.poweroff, freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })},
   { 'Reboot' , usr.reboot, freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })}
}

local servicesmenu = {
   { 'Transmission On', usr.terminal_cmd .. 'sudo systemctl start transmission.service', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Transmission Off', usr.terminal_cmd .. 'sudo systemctl stop transmission.service', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP On', sudo_bash .. ' ' .. home_path .. 'bin/lamp.sh start', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP Off', sudo_bash .. ' ' .. home_path .. 'bin/lamp.sh stop', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
-- { 'MPD On', sudo_bash .. 'systemtcl start mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
-- { 'MPD Off', sudo_bash .. 'systemtcl stop mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
-- { 'rtorrent On', usr.terminal_cmd .. 'tmux new-window rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
-- { 'rtorrent Off', usr.terminal_cmd .. 'killall rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) }
}

table.insert(menu_items, { 'Awesome Options', myawesomemenu,  freedesktop.utils.lookup_icon({icon = 'help'}) })

-- Add script options pdq 07-05-2012
myideskmenu = {
    { 'Appearance', 'lxappearance', freedesktop.utils.lookup_icon({ icon = 'style' }) },
    { 'Wallpapers', 'feh -g 640x480 -d -S filename ' .. home_path .. 'Pictures/wallpaper', freedesktop.utils.lookup_icon({ icon = 'style' }) },
    { 'Wallpapers+', 'feh -g 640x480 -d -S filename ' .. home_path .. 'Pictures/nsfwpaper', freedesktop.utils.lookup_icon({ icon = 'style' }) },
    { 'Kill Conky', usr.terminal_cmd .. 'killall conky', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' }) },
    { 'Kill Idesk', usr.terminal_cmd .. 'killall idesk', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' }) },
    { 'Start Conky', 'conky -d -c ' .. home_path .. '.config/conky/.conkyrc', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
    { 'Start Script', 'zsh ' .. home_path .. '.config/awesome/global_script.sh', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
    { 'Start Screencast', 'zsh ' .. home_path .. 'bin/screencast', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
--  { 'Start Idesk', 'idesk', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) }
}
table.insert(menu_items, { 'Desktop Options', myideskmenu,  freedesktop.utils.lookup_icon({icon = 'help'}) })

table.insert(menu_items, { 'Services', servicesmenu, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) })

-- Add menu items for web browsers pdq 07-03-2012
usr_menu_item(usr.web_browser, 'web-browser')

table.insert(menu_items, { 'Task Manager', 'lxtask', freedesktop.utils.lookup_icon({icon = 'gnome-monitor.png'}) })
table.insert(menu_items, { 'Terminal', usr.terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

-- Xdefaults menu pdq 07-02-2012
local function get_xft()
    local fxft = io.popen("basename $(dirname $(readlink " .. home_path.. ".Xdefaults))")
    local xft = fxft:read("*all")
    fxft:close()
    if xft == nil then
        return "Default"
    end

    return xft
end

if usr.terminal == 'urxvtc' then
  xftmenu = {}
  function xft_load(xft_file)
     usr.exec('ln -sfn ' .. home_path .. '.config/awesome/Xdefaults/' .. xft_file .. '/.Xdefaults ' .. home_path .. '.Xdefaults')
     usr.exec('xrdb ' .. home_path .. '.Xdefaults')
     usr.exec('killall urxvtd')
     usr.exec('urxvtd -q -o -f')
  end
  function xft_menu()
     f = io.popen('ls -1 ' .. home_path .. '.config/awesome/Xdefaults/')
     for l in f:lines() do
      item = { l, function () xft_load(l) end }
      table.insert(xftmenu, item)
     end
     f:close()
  end
  xft_menu()
  table.insert(menu_items, { 'Xdefaults', xftmenu, freedesktop.utils.lookup_icon({icon = 'terminal'}) })
end

-- Add menu items for file managers pdq 07-03-2012
usr_menu_item(usr.file_manager, 'file-manager')
-- myawesomemenu = {
--    { "manual", terminal .. " -e man awesome" },
--    { "edit config", editor_cmd .. " " .. awesome.conffile },
--    { "restart", awesome.restart },
--    { "quit", awesome.quit }
-- }

--mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                    { "open terminal", terminal }
--                                  }
--                        })
mymainmenu = awful.menu({ items = menu_items, 
                          theme = { width = 160 } })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = usr.terminal -- Set the terminal for applications that require it
-- }}}

-- Create a textclock widget
mytextclock = awful.widget.textclock(usr.date_format)

datewidget_t = awful.tooltip({
objects = { mytextclock },
timer_function = function()
return os.date("Today is %A %B %d %Y\nThe time is %T")
end,
})

-- pacman update widget based off setkeh Awesome-Widget-Notify
pacmanwidget = wibox.widget.textbox()
pacmanwidget:set_markup('<span color="#FF53E9">漢</span>')
-- button to run pacman update
pacmanwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'zsh ' .. home_path .. 'bin/pacupdater') end ) ) )

aurwidget = wibox.widget.textbox()
aurwidget:set_markup('<span color="#FF4242">字</span>')
-- button to run packer update
aurwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'zsh ' .. home_path .. 'bin/packerupdater') end ) ) )

--Create Volume Progressbar
tb_volume = wibox.widget.textbox()

tb_volume:buttons(awful.util.table.join(
  awful.button({ }, 4, function () volume('up', tb_volume) end),
  awful.button({ }, 5, function () volume('down', tb_volume) end),
  awful.button({ }, 1, function () volume('mute', tb_volume) end)
))
volume('update', tb_volume)

-- load avg / cpu widget
local cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, modifier.cpu_text .. '$1%</span>')
-- button to launch htop

cpuwidget.fit = function(box,w,h)
    local w,h = wibox.widget.textbox.fit(box,w,h) return math.max(modifier.cpu_w,w),h
end

cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( 'urxvtc -name htops -e htop --sort-key PERCENT_CPU') end ) ) )

-- memory widget
local memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, modifier.mem_text .. '$1%</span>')
memwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec('urxvtc -name htops -e htop --sort-key PERCENT_MEM') end ) ) )

-- Simple function to move the mouse to the coordinates set above.
local function moveMouse(x_co, y_co)
    mouse.coords({ x=x_co, y=y_co })
end
-- Optionally move the mouse when rc.lua is read (startup)
if usr.moveMouseOnStartup then
    moveMouse(usr.safeCoords.x, usr.safeCoords.y)
end

-- CPU temperature
local thermalwidget = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C", 20, { "coretemp.0", "core"} )
thermalwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ('urxvtc -name multitails -e multitail -ci white /var/log/kernel.log -cis yellow /var/log/pacman.log -ci red /var/log/boot -cis red /var/log/Xorg.0.log -cis green /var/log/httpd/access_log -ci red -I /var/log/httpd/error_log -cis red -I /var/log/httpd/error_log') end ) ) )

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ usr.modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ usr.modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", height = usr.top_wibox, screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if usr.cpuwidget_enable then right_layout:add(cpuwidget) end
    right_layout:add(space)
    if usr.memwidget_enable then right_layout:add(memwidget) end
    right_layout:add(space)
    if usr.thermalwidget_enable then right_layout:add(thermalwidget) end
    right_layout:add(space)
    if usr.pacmanwidget_enable then right_layout:add(pacmanwidget) end
    right_layout:add(space)
    if usr.aurwidget_enable then right_layout:add(aurwidget) end
    right_layout:add(space)
    if usr.tb_volume_enable then right_layout:add(tb_volume) end
    right_layout:add(space)
    right_layout:add(mytextclock)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(

   keydoc.group('Layout manipulation'),

   awful.key({ usr.modkey,           }, 'Left',   awful.tag.viewprev, 'View previous tag'),
   awful.key({ usr.modkey,           }, 'Right',  awful.tag.viewnext, 'View next tag'),
   awful.key({ usr.modkey,           }, 'Escape', awful.tag.history.restore, 'Focus previously selected tag set'),

  keydoc.group('Client manipulation'),

   awful.key({ usr.modkey, }, 'j',
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end, "Swap with next window"),
   awful.key({ usr.modkey, }, 'k',
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end, "Swap with previous window"),
   -- awful.key({ usr.modkey,           }, 'w', function () mymainmenu:show({keygrabber=true}) end),
   -- Layout manipulation
   awful.key({ usr.modkey, 'Shift'   }, 'j', function () awful.client.swap.byidx(  1)    end, 'Rotate clients around in a tag next'),
   awful.key({ usr.modkey, 'Shift'   }, 'k', function () awful.client.swap.byidx( -1)    end, 'Rotate clients around in a tag. previous'),
   awful.key({ usr.modkey, 'Control' }, 'j', function () awful.screen.focus_relative( 1) end, 'Focus next screen'),
   awful.key({ usr.modkey, 'Control' }, 'k', function () awful.screen.focus_relative(-1) end, 'Focus previous screen'),
   awful.key({ usr.modkey,           }, 'u', awful.client.urgent.jumpto, 'Focus first urgent client'),
   awful.key({ usr.modkey,           }, 'Tab',
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end , 'Tab through client history'),

   -- Standard program
   awful.key({ usr.modkey,           }, 'Return', function  () usr.exec(usr.terminal) end, 'Launch terminal'),
   awful.key({ usr.modkey, 'Control' }, 'r', awesome.restart, 'Reload awesome'),
   awful.key({ usr.modkey, 'Shift'   }, 'q', awesome.quit, 'Quit awesome'),
   awful.key({ usr.modkey,           }, 'l',     function () awful.tag.incmwfact( 0.05)    end, 'Increase current client width'),
   awful.key({ usr.modkey,           }, 'h',     function () awful.tag.incmwfact(-0.05)    end, 'Decrease current client width'),
   awful.key({ usr.modkey, 'Shift'   }, 'h',     function () awful.tag.incnmaster( 1)      end),
   awful.key({ usr.modkey, 'Shift'   }, 'l',     function () awful.tag.incnmaster(-1)      end),
   awful.key({ usr.modkey, 'Control' }, 'h',     function () awful.tag.incncol( 1)         end),
   awful.key({ usr.modkey, 'Control' }, 'l',     function () awful.tag.incncol(-1)         end),
   awful.key({ usr.modkey,           }, 'space', function () awful.layout.inc(layouts,  1) end, 'Next layout'),
   awful.key({ usr.modkey, 'Shift'   }, 'space', function () awful.layout.inc(layouts, -1) end, 'Previous layout'),
   awful.key({ usr.modkey, 'Control' }, 'n', awful.client.restore, 'Un-minimize client'),
   awful.key({ usr.modkey, }, 'x', function () usr.exec('xkill') end),

   keydoc.group('Custom'),
   
   awful.key({ usr.modkey, }, 'F1', keydoc.display),
   awful.key({ usr.modkey, }, 'F12', function () usr.exec('sh '.. home_path .. 'bin/screenshot') end, 'Take screenshot and copy URL'),
   awful.key({ usr.modkey, 'Control' }, 'F12', function () usr.exec('sh '.. home_path .. 'bin/multiscreenshot') end, 'Take screenshot of all Tags and copy URL'),
   awful.key({ usr.modkey, 'Shift' }, 'F12', function () usr.exec('zsh '.. home_path .. 'bin/screencast') end, 'Start screencast'),
   awful.key({ usr.modkey, }, ']', function () usr.exec("zsh -c 'luakit -c " .. home_path .. ".config/luakit/rc-proxy.lua  > /dev/null 2>&1'") end, 'Launch web browser [proxy]'),
   awful.key({ usr.modkey, }, '[', function () usr.exec("zsh -c 'luakit -U -c " .. home_path .. ".config/luakit/rc.lua  > /dev/null 2>&1'") end, 'Launch web browser'),
   awful.key({ usr.modkey, }, '\\', function () usr.exec('spacefm --panel=1') end, 'Launch file manager'),
   awful.key({ usr.modkey, }, '\'', function () usr.exec('subl') end, 'Launch text editor'),
   awful.key({ usr.modkey, }, '/', function () usr.exec('xchat') end, 'Launch IRC client'),
   -- yubnub try, 'ls dictionary'
   awful.key({ usr.modkey }, 'w' , function ()
        awful.prompt.run({ prompt = 'Web search: ' }, mypromptbox[mouse.screen].widget,
            function (command)
                usr.exec(usr.primary_browser .. 
                    " 'http://yubnub.org/parser/parse?command=" .. command .. "'", false)
                -- Switch to the web tag, where Firefox is, in this case tag 3
                if tags[mouse.screen][1] then awful.tag.viewonly(tags[mouse.screen][1]) end
            end)
    end, 'Launch yubnub'),
   awful.key({ usr.modkey }, 'p', function () 
        usr.exec('dmenu_run -i -nb "' .. beautiful.bg_graphs.. '" -sb "' .. beautiful.bg_graphs ..'" -sf "' .. 
            beautiful.fg_focus ..'" -nf "' .. beautiful.fg_focus .. '" -p "RUN:"') end, 'Launch dmenu'),
   awful.key({ usr.modkey }, 'o', function () 
        usr.exec('dmenu_mocp -i -nb "' .. beautiful.bg_graphs.. '" -sb "' .. beautiful.bg_graphs ..'" -sf "' .. 
            beautiful.fg_focus ..'" -nf "' .. beautiful.fg_focus .. '" -p "RUN:"') end, 'Launch dmenu_mocp'),
   -- http://awesome.naquadah.org/wiki/Move_Mouse
   awful.key({ usr.modkey , 'Control' }, 'm', function() moveMouse(usr.safeCoords.x, usr.safeCoords.y) end, 'Hide mouse cursor'),


    -- Prompt
    awful.key({ usr.modkey },            "r",     function () mypromptbox[mouse.screen]:run() end, 'Run lua code'),

    awful.key({ usr.modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),

      awful.key({ }, "F12", function () 
          scratch.drop("urxvtc -name scratch", "top", "left", 0.60, 0.40, false)
      end),

    -- Menubar
    awful.key({ usr.modkey }, "0", function() menubar.show() end, 'Menubar')
)

globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioRaiseVolume",function () volume("up", tb_volume) end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioLowerVolume",function  () volume("down", tb_volume) end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioMute",function  () volume("mute", tb_volume) end))

clientkeys = awful.util.table.join(

    keydoc.group('Client keys'),
    
    -- awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    -- awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    -- awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    -- awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    -- awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    -- awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    -- awful.key({ modkey,           }, "n",
    --     function (c)
    --         -- The client currently has the input focus, so it cannot be
    --         -- minimized, since minimized clients can't have the focus.
    --         c.minimized = true
    --     end),
    -- awful.key({ modkey,           }, "m",
    --     function (c)
    --         c.maximized_horizontal = not c.maximized_horizontal
    --         c.maximized_vertical   = not c.maximized_vertical
    --     end)

   awful.key({ usr.modkey,           }, 'f',      function (c) c.fullscreen = not c.fullscreen  end, 'Fullscreen'),
   awful.key({ usr.modkey,           }, '`',      function (c) c:kill()                         end, 'Close'),
   awful.key({ usr.modkey, 'Control' }, 'space',  awful.client.floating.toggle                     , 'Toggle floating'),
   awful.key({ usr.modkey, 'Control' }, 'Return', function (c) c:swap(awful.client.getmaster()) end, 'Swap'),
   awful.key({ usr.modkey,           }, 'o',      awful.client.movetoscreen                        , 'Move to screen'),
   awful.key({ usr.modkey, 'Shift'   }, 'r',      function (c) c:redraw()                       end, 'Redraw'),
   awful.key({ usr.modkey, 'Shift'   }, 't',      function (c) c.ontop = not c.ontop            end, 'On top'),
   awful.key({ usr.modkey,           }, 'n',
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, 'Minimize'),
   awful.key({ usr.modkey,           }, 'm',
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end, 'Maximize'),
   -- stick/unstick application to all tags
   awful.key({ usr.modkey, "Control" }, 's', function (c) c.sticky = not c.sticky end, 'Sticky')
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(
      keydoc.group('Global keys'),

      globalkeys,
        awful.key({ usr.modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ usr.modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ usr.modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ usr.modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ usr.modkey }, 1, awful.mouse.client.move),
    awful.button({ usr.modkey }, 3, awful.mouse.client.resize))

-- load the 'run or raise' function
-- generate and add the 'run or raise' key bindings to the globalkeys table
globalkeys = awful.util.table.join(globalkeys, aweror.genkeys(usr.modkey))
-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
    properties = { border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                -- focus = true,
                focus = awful.client.focus.filter,
                keys = clientkeys,
                size_hints_honor = false,
                buttons = clientbuttons } },
    -- {rule = { class = "URxvt" }, 
    -- properties = { opacity = 0.8 } },
    { rule = {class = 'Nitrogen'}, 
    properties = { opacity = 0.8 } },
    { rule = { class = 'luakit' },          -- browser tag
    properties = { tag = tags[1][1], switchtotag = true } },
    { rule = { instance = "Htop" }, 
    properties = { tag = tags[1][3], switchtotag = true  } },
    { rule = { instance = "IRC1" }, 
    properties = { tag = tags[1][2], switchtotag = true  } },
    { rule = { instance = "IRC2" }, 
    properties = { tag = tags[1][2], switchtotag = true  } },
    { rule = { instance = "Saidar" }, 
    properties = { tag = tags[1][3], switchtotag = true  } },
    { rule = { instance = "Logs" }, 
    properties = { tag = tags[1][3], switchtotag = true  } },
    { rule = { instance = "TTYload" }, 
    properties = { tag = tags[1][3], switchtotag = true  } },
    { rule = { instance = "MOCP" }, 
    properties = { tag = tags[1][7], switchtotag = true  } },
    { rule = { class = "Spacefm" }, 
    properties = { tag = tags[1][6], switchtotag = true  } },
    { rule = { instance = "IRC1" }, 
    properties = { tag = tags[1][2], switchtotag = true  } },
    { rule = { instance = "STDerr" }, 
    properties = { tag = tags[1][3], switchtotag = true  } },
    { rule = { instance = "Test" }, 
    properties = { tag = tags[1][6], switchtotag = true  } },
    { rule = { instance = "Play" }, 
    properties = { tag = tags[1][2], switchtotag = true  } },
    { rule = { class = 'Vlc' },         -- browser tag
    properties = { floating = true, sticky = true } },
    { rule = { name = 'Playlist' },        
    properties = { sticky = false, tag = tags[1][7] } },
    { rule = { class = 'Chromium' },         -- browser tag
    properties = { tag = tags[1][1], switchtotag = true } },
    { rule = { class = 'Firefox' },         -- browser tag
    properties = { tag = tags[1][1], switchtotag = true } },
    { rule = { class = "Firefox", instance = "Download" },
    properties = { floating = true } },
    { rule = { class = "Firefox", instance = "Browser" },
      properties = { floating = true } },
    { rule = { class = "Firefox", instance = "Toplevel" },
      properties = { floating = true } },
    { rule = { class = "Firefox", instance = "Places" },
      properties = { floating = true } },
    --   callback = function(c) c:tags({tags[1][5], tags[1][4]}) end}, -- multitag
    { rule = {class = 'sublime_text'},
    properties = {tag = tags[1][6], switchtotag = true} },
    { rule = {class = 'Kdenlive'},
    properties = {tag = tags[1][5], switchtotag = true} },
    { rule = { class = 'Plugin-container' }, -- fullscreen youtube videos
    properties = { floating = true, switchtotag = true } },
    --  { rule = { class = 'Nitrogen' }, 
    --   properties = { tag = tags[1][7], 
    --                   floating = true, 
    --                   border_width = "0", 
    --                   border_height = "0", 
    --                   switchtotag = tags[1][7] }, 
    --                   callback = function(c) c:geometry({x=0, y=0}) end },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.util.spawn("sh " .. home_path .. ".config/awesome/global_script.sh");

-- awful.hooks.timer.register(10, function () volume("update", tb_volume) end)
mtimer = timer({ timeout = 10 })
mtimer:connect_signal("timeout", function () volume("update", tb_volume) end)
mtimer:start()

-- disable startup-notification globally
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end
-- }}} EndFile
