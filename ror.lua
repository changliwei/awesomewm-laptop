-- ror.lua
-- This is the file goes in your ~/.config/awesome/ directory
-- It contains your table of 'run or raise' key bindings for aweror.lua
-- Table entry format: ["key"]={"function", "match string", "optional attribute to match"}
-- The "key" will be bound as "modkey + key".
-- The "function" is what gets run if no matching client windows are found.
-- Usual attributes are "class","instance", or "name". If no attribute is given it defaults to "class".
-- The "match string"  will match substrings.  So "Firefox" will match "blah Firefox blah"  
-- Use xprop to get this info from a window.  WM_CLASS(STRING) gives you "instance", "class".  WM_NAME(STRING) gives you the name of the selected window (usually something like the web page title for browsers, or the file name for emacs).
module("ror")
table5={
   ["a"]={"kdenlive","Kdenlive"}, 
   ["z"]={"luakit -U","luakit"}, 
   ["v"]={"vlc","Vlc"}, 
   ["s"]={"subl","sublime_text"},
   ["F2"]={"urxvtc -name multitails -e multitail -ci white /var/log/kernel.log -cis yellow /var/log/pacman.log -ci red /var/log/boot -cis green /home/pdq/.xplanetFX/logs/xplanetFX.log -ci red /var/log/Xorg.0.log -cis green /var/log/httpd/access_log -ci red -I /var/log/httpd/error_log -cis red -I /var/log/httpd/error_log","multitails", "instance"}, 
   --["F1"]={"urxvtc -name htops -e htop","htops", "instance"}
   -- ["s"]={"xterm -name rootTerm -cr red -title rootTerm -e su","rootTerm", "instance"}, 
   -- ["t"]={"xterm -name htopTerm -e htop","htopTerm","instance"}, 
   -- ["b"]={"xterm -name rtorrentTerm -e rtorrent","rtorrentTerm","instance"}, 
   -- ["z"]={"xterm -name mocpTerm -e mocp","mocpTerm", "instance"} 
}