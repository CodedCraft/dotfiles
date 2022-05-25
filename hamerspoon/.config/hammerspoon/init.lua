require('Spoons/pomodoro')
-- require('keyboard') -- Load Hammerspoon bits from https://github.com/jasonrudolph/keyboard
--hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--    hs.execute('/usr/local/bin/blueutil --connect 6c-dd-bc-9b-eb-76')
--end)


hyper = { "ctrl", "alt", "cmd"}

hs.hotkey.bindSpec({hyper, "r"}, hs.reload)

hs.notify.show("Hammerspoon loaded", "", "")

--hs.loadSpoon('ControlEscape'):start()


--hs.loadSpoon("SpoonInstall")

-- spoon.SpoonInstall:andUse("BingDaily")
-- spoon.SpoonInstall:andUse("MoveSpaces")

-- Remap Capslock to Esc on tap and Control on hold
----------------------------------------------------------------------------------------------
send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(0.20, control_key_handler)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    last_mods = new_mods
    control_key_timer:stop()
    if send_escape then
      return true, {
        hs.eventtap.event.newKeyEvent({}, 'escape', true),
        hs.eventtap.event.newKeyEvent({}, 'escape', false),
      }
    end
  end
  return false
end

control_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, control_handler)
control_tap:start()

other_handler = function(evt)
  send_escape = false
  return false
end

other_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, other_handler)
other_tap:start()

-- Hyper Key --------------------------------------------------------------------------------------
local This = {}

-----------------------------------------------------------------------------------
-- File: hyper.lua
-- Author: J.H. Kuperus
-- Source: https://github.com/jhkuperus/dotfiles/blob/master/hammerspoon/hyper.lua
-- "License": Feel free to use this file any way you like. Issues or improvements
--            are welcome on the GitHub repository. No warranties whatsoever.
-----------------------------------------------------------------------------------

-- To use Hyper in your init.lua script, import it and adapt this example to
-- your needs:
-- 
-- local hyper = require('hyper')
-- hyper.install('F18') 
-- hyper.bindkey('r', hs.reload)
--
-- The above three lines initialize Hyper to respond to F18 key-events and binds
-- Hyper+r to Hammerspoon Reload (easy way to refresh Hammerspoon's config)

-- Hyper mode needs to be bound to a key. Here we are binding
-- it to F17, because this is yet another key that's unused.
-- Why not F18? We will use key-events from F18 to turn hyper
-- mode on and off. Using F17 as the modal and source of key
-- events, will result in a very jittery Hyper mode.

This.hyperMode = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper) is pressed
function enterHyperMode()
   This.hyperMode:enter()
end

-- Leave Hyper Mode when F18 (Hyper) is pressed
function exitHyperMode()
   This.hyperMode:exit()
end

-- Utility to bind handler to Hyper+key
function This.bindKey(key, handler)
    This.hyperMode:bind({}, key, handler)
end

-- Utility to bind handler to Hyper+Shift+key
function This.bindShiftKey(key, handler)
   This.hyperMode:bind({'shift'}, key, handler)
end

-- Utility to bind handler to Hyper+Command+Shift+key
function This.bindCommandShiftKey(key, handler)
  This.hyperMode:bind({'command', 'shift'}, key, handler)
end

-- Utility to bind handler to Hyper+modifiers+key
function This.bindKeyWithModifiers(key, mods, handler)
   This.hyperMode:bind(mods, key, handler)
end

-- Binds the enter/exit functions of the Hyper modal to all combinations of modifiers
function This.install(hotKey)
  hs.hotkey.bind({}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "ctrl"}, hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift", "ctrl"}, hotKey, enterHyperMode, exitHyperMode)
end


return This






























---------------------------------------------------------------------------------------------



--[[
-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
function exitHyperMode()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'TAB')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)




---------------------------------------------------------------------------------------------------------
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end
	return function() hs.eventtap.keyStroke(mods, key, 1000) end
end


hyper:bind({}, "F", open("Finder"))
hyper:bind({}, "h", pressFn("left"))
hyper:bind({}, "j", pressFn("down"))
hyper:bind({}, "k", pressFn("up"))
hyper:bind({}, "l", pressFn("right"))
hyper:bind({}, "cmd", pressFn("cmd + tab"))

]]--
