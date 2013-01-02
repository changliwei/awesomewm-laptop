 local io = io
 local string = string
 local awful = require("awful")
 local beautiful = require("beautiful")
 local naughty = require("naughty")
--  local markup = require("markup")
 
 module("mocp")
 
 -- public settings
 settings = {}
 settings.iScroller = 1
 settings.MAXCH = 15
 settings.interval = 0.75
 
 local mocbox = nil
 local trackinfo = {}
 trackinfo.artist = ""
 trackinfo.songtitle = ""
 trackinfo.album = ""
 trackinfo.state = ""
 
 ---PAUSE
 




local tonumber = tonumber
local string_format = string.format
-- Markup helper functions
-- module("markup")

function bg(color, text)
    if color ~= nil then
        return '<span bgcolor="'..color..'" >'..(text or "")..'</span>'
    else
        return text
    end
end

function fg(color, text)
    if color ~= nil then
        return '<span color="'..color..'">'..(text or "")..'</span>'
    else
        return text
    end
end

function font(font, text)
    if color ~= nil then
        return '<span font_desc="'..font..'">'..(text or "")..'</span>'
    else
        return text
    end
end

function normal(t)
    return bg(beautiful.bg_normal, fg(beautiful.fg_normal, t))
end

function focus(t)
    return bg(beautiful.bg_focus, fg(beautiful.fg_focus, t))
end

function urgent(t)
    return bg(beautiful.bg_urgent, fg(beautiful.fg_urgent, t))
end

function bold(text)
    return '<b>'..(text or "")..'</b>'
end

function underline(text)
    return '<u>'..(text or "")..'</u>'
end

function italic(text)
    return '<i>'..(text or "")..'</i>'
end

function heading(text)
    return fg(beautiful.fg_focus, bold(text))
end

function gradient(color, to_color, min, max, value)
    local function color2dec(c)
        return tonumber(c:sub(2,3),16), tonumber(c:sub(4,5),16), tonumber(c:sub(6,7),16)
    end

    local factor = 0
    if (value >= max ) then
        factor = 1
    elseif (value > min ) then
        factor = (value - min) / (max - min)
    end

    local red, green, blue = color2dec(color)
    local to_red, to_green, to_blue = color2dec(to_color)

    red   = red   + (factor * (to_red   - red))
    green = green + (factor * (to_green - green))
    blue  = blue  + (factor * (to_blue  - blue))

    -- dec2color
    return string_format("#%02x%02x%02x", red, green, blue)
end

 ----
 ---{{{ local setTitle
 -- call to force update of trackinfo variables
 local function setTitle()
 
   local fd = {}
 
   if state() then
       fd = io.popen('mocp -i')
 
       -- read to end of mocp -i
       tmp = fd:read()
       while tmp ~= nil do
           key = string.match(tmp,"^%w+")
           if trackinfo[key:lower()] ~= nil then
               trackinfo[key:lower()]=awful.util.escape(string.gsub(string.gsub(tmp,key..":%s*",""),"%b()",""))
           end
           tmp = fd:read()
       end
   end
 
 end
 ---}}}
 
 ---{{{ local title(delim)
 local function title(delim)
 
   local eol = delim or " "
   local np = {}
 
   if trackinfo.artist == nil and state() then setTitle() end
   np.song =string.gsub( string.gsub(trackinfo.songtitle,"^%d*",""),"%(.*","") .. eol
 
   -- return for widget text
   return trackinfo.artist.." : "..np.song
 
 end
 ---}}}
 
 ---{{{ local function notdestroy()
 local function notdestroy()
   if mocbox ~= nil then
       naughty.destroy(mocbox)
       mocbox = nil
   end
 end
 ---}}}
 
 ---{{{ local getTime() gets ct and tt of track for popup
 --@return string containig formatted times
 local function getTime()
   local fd = {}
   local ttable = {}
   fd = io.popen('mocp -i')
   local tmp = fd:read()
 
   while tmp ~= nil do
       key = string.match(tmp,"^%w+")
       if key == "TotalTime" then
           tstring = " [ "..fg(beautiful.fg_normal,awful.util.escape(string.gsub(string.gsub(tmp,key..":%s*",""),"%b()",""))).." ]"
       elseif key == "CurrentTime" then
           tstring = fg(beautiful.fg_focus,"Time:   ")..
                     fg(beautiful.fg_normal,awful.util.escape(string.gsub(string.gsub(tmp,key..":%s*",""),"%b()","")))..tstring
       end
       tmp = fd:read()
   end
 
   fd:close()
 
   return tstring
 end
 ---}}}
 
 ---{{{ popup
 -- displays a naughty notificaiton of the current track
 function popup()
   
   setTitle()
   notdestroy()
 
   local np = {}
   np.state = nil
   np.strng = ""
   if not state() then
       return
   else
       np.strng = "Artist: "..fg(beautiful.fg_normal,trackinfo.artist).."\n"..
                  "Song:   "..fg(beautiful.fg_normal,trackinfo.songtitle).."\n"..
                  "Album:  "..fg(beautiful.fg_normal,trackinfo.album).."\n"
       np.strng = np.strng..fg(beautiful.fg_normal,getTime())
   end
   np.strng = fg( beautiful.fg_focus, font("monospace", np.strng.."  "))  
   mocbox = naughty.notify({ 
       title = font("monospace","Now Playing:"),
       text = np.strng, hover_timeout = ( settings.hovertime or 3 ), timeout = 0,
       -- icon = "/usr/share/icons/gnome/24x24/actions/edia-playback-start.png", icon_size = 24,
         run = function() play(); popup() end
     })
 end
 ---}}}
 
 ---run mocp
 function play() 
   if trackinfo.state == "STOP" then
    awful.util.spawn('mocp --play') 
   elseif trackinfo.state == "PLAY" then
     awful.util.spawn('mocp --next')
   else 
     awful.util.spawn('mocp --toggle-pause')
 end
 end
 ---
 
 function setwidget(w)
   settings.widget = w
 --  awful.hooks.timer.register (settings.interval,scroller)
mtimer = timer({ timeout = settings.interval })
mtimer:add_signal("timeout", scroller)
mtimer:start()
   state()
 end
 
 ---{{{ function update ( k, v)
 -- called by any kind of external script to trigger widget text update
 function update ( k, v )
   if #k == 0 or #v == 0 then return end
   if trackinfo[k] ~= nil then
       trackinfo[k] = v
   end
   state()
 end
 ---}}}
 
 -- mocp widget, scrolls text
 function scroller(tb)
   local np = {}
 
   -- if mocp is not running, then simply return here
   if trackinfo.state == "OFF" then
       settings.iScroller = 1
       state()
       return
   else
       -- this sets the symbolic prefix based on where moc is playing or stopped or paused
       if trackinfo.state == "PAUSE" then
           prefix = "|| "
           settings.interval = 2
       elseif trackinfo.state == "STOP" then
           settings.iScroller = 1
           settings.widget.width = 20
           settings.widget.text = "[]"
           return
       else
           prefix = ">> "
           settings.interval = 0.75
       end
 
       -- extract a substring, putting it after the 
       np.strng = title()
       np.rtn = string.sub(np.strng,settings.iScroller,settings.MAXCH+settings.iScroller-1) 
 
       -- if our index and settings.MAXCH count are bigger than the string, wrap around to the beginning and
       -- add enough to make it look circular
       if settings.MAXCH+settings.iScroller > (np.strng):len() then
           np.rtn = np.rtn .. string.sub(np.strng,1,(settings.MAXCH+settings.iScroller-1)-np.strng:len())
       end
 
       np.rtn = awful.util.escape(np.rtn)
       settings.widget.text = fg(beautiful.fg_normal,prefix) .. fg(beautiful.fg_sb_hi,np.rtn) 
 
       if settings.iScroller <= np.strng:len() then
           settings.iScroller = settings.iScroller +1
       else
           settings.iScroller = 1
       end
   end
 end
 -- }}}