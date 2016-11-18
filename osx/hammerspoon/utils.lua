-- Declare module
local utils = {}

local alertDuration = .3
local alertStyle = {
  success = {
    fillColor = { green = 1, alpha = .75 },
    strokeColor = { white = 0, alpha = 0 },
    strokeWidth = 0
  },
  warning = {
    fillColor = { red = 1, green = .5, alpha = .75 },
    strokeColor = { white = 0, alpha = 0 },
    strokeWidth = 0
  },
  danger = {
    fillColor = { red = 1, alpha = .75 },
    strokeColor = { white = 0, alpha = 0 },
    strokeWidth = 0
  },
  neutral = {
    strokeColor = { white = 0, alpha = 0 },
    strokeWidth = 0
  }
}


-- Dynamically get the currently focused window
function utils.getFocusedWindow () return hs.window.focusedWindow() end

-- Dynamically get the currently focused window's screen. Seems borked atm, using dual screens
function utils.getCurrentScreen () return utils.getFocusedWindow():screen():fullFrame() end

-- Customized alert, displayed on the currently focused window
function utils.alert (message, level) 
  level = level or 'neutral'
  hs.alert.show(message, alertStyle[level], utils.getFocusedWindow():screen(), alertDuration)
end


-- Export module
return utils
