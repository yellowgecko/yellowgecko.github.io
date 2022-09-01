-- Standard awesome library
local gears                 = require("gears")
local awful                 = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox                 = require("wibox")
-- Theme handling library
local beautiful             = require("beautiful")
-- Notification library
local naughty               = require("naughty")		
-- local menubar               = require("menubar")
local hotkeys_popup         = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load Debian menu entries
-- local debian = require("debian.menu")
local has_fdo, freedesktop  = pcall(require, "freedesktop")

local lain					= require("lain")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- ====================================================================================
-- This is used later as the default terminal and editor to run.
-- terminal = "x-terminal-emulator"

terminal = "alacritty"

editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

xautolock_toggle				= "on"
conf_dir                        = gears.filesystem.get_configuration_dir() 

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey                  = "Mod4"
altkey					= "Mod1"


-- ====================================================================================
-- {{{ THEMES: Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- beautiful.init("/home/markus/.config/awesome/markus_theme.lua")
beautiful.init(conf_dir .. "theme.lua")

-- theme.wallpaper							= "/home/markus/wallpapers/cherryBlossomsOne.jpg"
--beautiful.wallpaper							= "/home/markus/wallpapers/cherryBlossomsOne.jpg"
-- default useless gap size
theme.useless_gap							= 12
--ML theme do not show tasklist icons
theme.tasklist_disable_icon					= true
-- ====================================================================================

-- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = {
    -- awful.layout.suit.floating,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
--    lain.layout.termfair,
    lain.layout.termfair.center,
    
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}



--____________________________________________________________
-- lain layout def
lain.layout.termfair.nmaster = 2
lain.layout.termfair.ncol    = 1

lain.layout.termfair.center.nmaster = 2
lain.layout.termfair.center.ncol = 1
-- }}}



-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{  function to load wallpapers
-- This is the correct way

-- ______________________________________
local function set_wallpaper(s)
    -- Wallpaper
    -- changed beautiful.wallpaper to theme.wallpaper
    if beautiful.wallpaper then
    	--local wallpaper = beautiful.wallpaper
    	local wallpaper = beautiful.wallpaper
    	-- If wallpaper is a function, call it with the screen
    	if type(wallpaper) == "function" then
    		wallpaper = wallpaper(s)
    	end
    gears.wallpaper.maximized(wallpaper, s, true)
    end
end
			
wp_i = 0		-- contains number of wallpapers found
wp_select = 0	-- index of next wallpaper selected when user chooses next wallpaper
wp_rand = 0		-- select random wallpaper by index at start
wp_files = {}
wp_cmd = "ls -H " .. gears.filesystem.get_configuration_dir() .. "wallpapers"
wp_wallpaper = ""
--naughty.notify { preset = naughty.config.presets.critical, text = wp_cmd }

function pwp(wps)
--[[
  naughty.notify ({ preset = naughty.config.presets.critical, 
            	 	text = wps,
            	 	title = "--wps--" })          	 	
]]--
  for filename in string.gmatch(wps, "%w+%.%w+") do
	wp_i = wp_i + 1
	wp_files[wp_i] = filename
  end
  --[[
  naughty.notify ({ preset = naughty.config.presets.critical,
                    text = tostring(wp_i),
                    title = "--wallpaper--" })
 ]]--
  math.randomseed(os.time())
  wp_rand = math.random(1, #wp_files)
  wp_select = wp_rand
  --[[
  naughty.notify { preset = naughty.config.presets.critical, 
					title = "random number",
  					text = wp_files[wp_rand] } 
  ]]--
  wp_wallpaper = gears.filesystem.get_configuration_dir() .. "wallpapers/" .. wp_files[wp_rand]
  beautiful.wallpaper = gears.filesystem.get_configuration_dir() .. "wallpapers/" .. wp_files[wp_rand]
  --[[
  naughty.notify { preset = naughty.config.presets.critical,
                      title = "wallpaper file and path",
                      text = theme.wallpaper  }
  ]]--
  awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
        set_wallpaper(s) 
        end)
  end
        
awful.spawn.easy_async_with_shell(wp_cmd, function(stdout, stderr, reason, exit_code) 
	pwp(stdout)
end) 


	
-- ====================================================================================
-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end},
   --- new menu entries
   { "reboot", terminal .. " -e reboot" },
   { "shutdown", terminal .. " -e shutdown now" }
   --- { "shutdown new", os.execute("shutdown now") }
}

--- new menu entry for reboot and shutdown
local menu_reboot = { "reboot", terminal .. " -e reboot"}
local menu_shutdown = { "shutdown", terminal .. " -e shutdown now"}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian },
                  menu_terminal,
                  menu_reboot,
                  menu_shutdown
                }
    })
end
		
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
-- ML disabled as i disabled the menubar plugin. should speed up loading
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
-- ML disabled in wibar so no need to load
--mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end), -- view clicked tag
                    awful.button({ modkey }, 1, function(t) -- move the active window to clicked tag
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle), -- add a tag to the current tag mergiing all clients
                    awful.button({ modkey }, 3, function(t) 
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end), -- switch tag using mouse wheel
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

-- ML
-- no longer having a tasklist so task list buttons can be removed
--[[
local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))
--]]
--[[ --moved th]is above
local function set_wallpaper(s)
    -- Wallpaper
    -- changed beautiful.wallpaper to theme.wallpaper
    if beautiful.wallpaper then
        --local wallpaper = beautiful.wallpaper
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
]]--
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    -- ML simple squares as tags
    --awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    awful.tag({ "", "", "", "", "", "" }, s, awful.layout.layouts[1])
    -- default to termfair.centre layout which is no 5
    -- reset back to first ...


    -- Create a promptbox for each screen
    -- s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end), --next layout with mouseclick
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end), -- next layout with mousewheel
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- ===========================================================================
    -- Create a seperate container/ wibox
    --[[
    s.bg = wibox.widget {
        {
            {
                text = "foo",
                widget = wibox.widget.textbox
            },
            {
                text = "bar",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.vertical
        },
        bg = "#ff0000",
        widget = wibox.container.background
    }
    ]]--
    
    input_widget = wibox {
        -- DONE: get screen size and widget size to calculate centre position
        -- add command prompt box
        width =220,
        -- changed to 220 from 200 for 6th screen
        ontop = true,
        screen = mouse.screen,
        expand = true,
        visible = true,
        -- bg = '#1e252c',
        --bg = theme.bg_normal,
        bg = '#1e252c55',
        max_widget_size = 500,
        --[[ 
        border_width = 1;
        border_width = 1,
        border_color = '#66ccff',
        ]]--
        height = 19,
        x = screen[1].geometry.width / 2 - 150,
        -- x = 800,
        y = 2,
        }

    input_widget:setup {
        {
            s.mylayoutbox,
            layout = wibox.container.margin,
            left = 0,
            right = 20,
        },
        {
            s.mytaglist,
            layout = wibox.container.margin,
            left = 10,
        },
--[[        {
        	s.mypromptbox,
        	layout = wibox.container.margin,
        	left = 10,
        }, ]]--
        layout  = wibox.layout.fixed.horizontal
    }
    

    -- ===========================================================================
    --[[
    -- Create the wibar
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- mylauncher,
            s.mylayoutbox,

            s.mytaglist,
            s.mypromptbox,
            -- ML add spacing between left widgets
            spacing = 30,
        },
        {
			layout = wibox.layout.flex.horizontal,
			-- s.mytasklist, -- Middle widget
		},
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
    --]]
-- =============================================================================
-- end screen connect function
end)
-- }}}

-- =============================================================================
-- calendar widget(s)
local month_cal = awful.widget.calendar_popup.month(
{	font = "NanumSquare 16",
	start_sundays = false,
	long_weekdays = true,
	week_numbers = true,
	margin = 30,
	spacing = 20,
}	)

--aweful.widget.calendar_popup:call_calendar(3)
month_cal:call_calendar(3,'cc')

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey,		}, "z", function () month_cal:toggle() end),
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
--    awful.key({ modkey,           }, "w", function () mymainmenu:show(mouse.coords {x=50,y=200}) end,
--              {description = "show main menu", group = "awesome"}),
--  THIS WORKS
--    awful.key({ modkey,           }, "w", function () mymainmenu:show({coords={x=800, y=200}}) end,
--              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey,           }, "w", function () 
		local xx = screen(awful.screen.focused()).geometry.width/2-125
		--[[ naughty.notify ({ preset = naughty.config.presets.critical,
                    text = tostring(xx),
                    title = "--geometry x--" })
		]]--
		mymainmenu:show({coords={x=xx, y=100}})
		end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    -- ML
    --[[
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    ]]--    
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

	--[[
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
	]]--

	-- ML changing modkey+tab behaviour to cycle through all windows over all tags
	awful.key({ modkey,			}, "Tab", function () awful.tag.viewidx ( 1) end,
		{description = "next client", group = "client"}),
		
		
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- ML repurposing the same keys with CTRL mod to resize gaps. Will conflict with vertical
    -- modification keys uncommented below
    -- Mod Tab to cycle through tags
	awful.key({ modkey, "Control" }, "j", function () lain.util.useless_gaps_resize( 1) end),
	awful.key({ modkey, "Control" }, "k", function () lain.util.useless_gaps_resize(-1) end),

    -- ML the next 2 switch to vertical split. Not need to avoid confusion
    --[[
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    ]]--    

    -- ML no idea what these really do, so away with them
    --[[
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    ]]--
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
	-- ////////////////////////////////////////
	-- xautolock lock now
	awful.key({ modkey, "Control" }, "a",
		function ()
			awful.util.spawn("sync")
			awful.util.spawn("xautolock -locknow")
		end,
		{ description = "lock the screen", group = "layout"}),
	-- xautolock toggle enable/ disabled
	awful.key({ modkey, "Shift" }, "a",
		function ()
			if xautolock_toggle == "on" then
					xautolock_toggle = "off"
					awful.util.spawn("sync")
					awful.util.spawn("xautolock -disable")
                    awful.util.spawn("xset s off dpms 0 0 0")
                    awful.util.spawn("killall compton")
					--mylauncher:set_image(beautiful.awesome_icon_red)
                    theme.taglist_fg_focus                  = "#FF0000"
                    -- ML tag will show in red to indicate screen lock is off
                    -- we need to toggle the view, so get tag, off and then on to show the change
                    local t = awful.screen.focused().selected_tag
                    input_widget.ontop = false
                    awful.tag.viewtoggle (t) 
                    t:view_only()
			else
					xautolock_toggle = "on"
					awful.util.spawn("sync")
					awful.util.spawn("xautolock -enable")
                    awful.util.spawn("xset s 300 400 dpms 600 900 1200")
                    awful.util.spawn("compton")
					--mylauncher:set_image(beautiful.awesome_icon)

                    -- ML toggle the tag                    
                    beautiful.taglist_fg_focus                  = "#FFFFFF"
                    local t = awful.screen.focused().selected_tag
                    input_widget.ontop = true
                    awful.tag.viewtoggle (t)                    
                    t:view_only()
			end
		end,
		{ description = "Toggle video mode. compton and transparency and timeout on|off", group = "layout"}),
	-- ///////////////////////////////////////
    awful.key({ modkey, }, "c",
    	function ()
    	wp_select = wp_select + 1
    	if (wp_select > wp_i) then
    		wp_select = 1
    	end

    	gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "wallpapers/" .. wp_files[wp_select], 1, true) 
		--[[
	    naughty.notify { preset = naughty.config.presets.critical,
                        title = "wallpaper file and path",
                        text = wp_files[wp_select]  }
        ]]--
    end),
    -- ML no longer be able to minimize therefore no restore required
    --[[
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),
    ]]--

    -- Prompt
--[[    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"})
  	-- ,
]]--
awful.key({ modkey },            "r",     function () awful.spawn("/bin/bash -c '/usr/bin/rofi -show run'") end,
              {description = "rofi srun prompt", group = "launcher"})
    -- ML running LUA code is not required
    --[[
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    ]]--

    -- Menubar
	-- ML ... did not know there is a menu bar ... disabled
--[[    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
]]--

)


clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"})
-- ,

-- ML dont want to be able to minimze a window as there is no longer a tasklist to re focus
--[[    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            --c.minimized = true
        -- end,
        -- {description = "minimize", group = "client"}),
]]--

-- ML no maximize and un maximize .. fullscreen is enough
--[[    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
        ]]--
)

-- Bind all key numbers to tags.
--
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- ====================================================================================
-- =======================================RULES========================================
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     minimized = false,
                     keys = clientkeys,
                     -- buttons = clientbuttons,
                     screen = awful.screen.preferred,
					 -- ML added a placement rule for centered dialogues below
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "qjackctl",
          "guitarix",
          "Guitarix",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true,
					 	placement = awful.placement.centered }},
    -- Add non floating rule for libreoffice
    -- { rule_any = {
        -- class = { "libreoffice" }
        -- },
        -- properties = { floating = false }},
    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
    -- ML titlebars removed      
    --}, properties = { titlebars_enabled = true }
      }, properties = { titlebars_enabled = false }
    },
	--[[{ rule_any = { floating = true },
		properties = { placement = awful.placement.centered }
	},
    ]]--
    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- ML remove titlebar config as no titlebars enabled
--[[
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
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
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)
--]]
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

--ML
-- border opacity on focus
client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
	c.opacity = 1
end)

client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	c.opacity = 0.9
end)

-- ===============================================================================
-- ML added code 2018 11 03 to run startup commands
-- _______________________________________________________________________
do
	local cmds =
	{
	-- "xcompmgr -cfF -t-9 -|-11 -r9 -o.95 -D6",
	-- "feh --bg-scale ~/wallpapers/cherryBlossomsOne.jpg",
	"killall compton",
	"/home/markus/.config/awesome/locker.sh",
    "/usr/bin/a2j_control --start",
    -- "xautolock",
	"compton",
    -- TODO compile patched compton ... done!
--	"xautolock"
	}

	for _,i in pairs(cmds) do
    --	awful.spawn.with_shell(i)
    	awful.spawn(i)
	end
end
