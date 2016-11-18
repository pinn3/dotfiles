local getFocusedWindow = require('utils').getFocusedWindow
local getCurrentScreen = require('utils').getCurrentScreen
local alert = require('utils').alert


-- Declare module
local window = {}

local recentWindow = nil
local recentPosition = nil
local recentSplitSize = nil
local function resetRecents ()
  recentWindow = nil
  recentPosition = nil
  recentSplitSize = nil
end   

local marginState = true
local margin = 40
local function getMargin () return marginState and margin or 0 end

local positions = {
  topLeft = function () return {
    getCurrentScreen()._x + getMargin(),
    getCurrentScreen()._y + getMargin()
  } end,
  bottomLeft = function () return {
    getCurrentScreen()._x + getMargin(),
    getCurrentScreen()._y + getCurrentScreen()._h / 2
  } end,
  topRight = function () return {
    getCurrentScreen()._x + getCurrentScreen()._w / 2,
    getCurrentScreen()._y + getMargin()
  } end,
  topRightThird = function () return {
    getCurrentScreen()._x + getCurrentScreen()._w / 1.5,
    getCurrentScreen()._y + getMargin()
  } end,
  topRightTwoThirds = function () return {
    getCurrentScreen()._x + getCurrentScreen()._w / 3,
    getCurrentScreen()._y + getMargin()
  } end,
  bottomRight = function () return {
    getCurrentScreen()._x + getCurrentScreen()._w / 2,
    getCurrentScreen()._y + getCurrentScreen()._h / 2
  } end
}


function window.toggleMargins ()
  if marginState then marginState = false else marginState = true end
  alert('Margins', marginState and 'success' or 'danger')
end

function window.center () 
  resetRecents()
  getFocusedWindow():centerOnScreen(nil,nil,0) 
end

function window.move (direction)
  return function ()
    resetRecents()
    if direction == 'left' then getFocusedWindow():centerOnScreen(getFocusedWindow():screen():previous(),nil,0) end
    if direction == 'right' then getFocusedWindow():centerOnScreen(getFocusedWindow():screen():next(),nil,0) end
  end
end

function window.maximize ()
  resetRecents()
  getFocusedWindow():setTopLeft(
    hs.geometry.point(
      getCurrentScreen()._x,
      getCurrentScreen()._y
    )
  )

  getFocusedWindow():setSize(hs.geometry.size(
    getCurrentScreen()._w - getMargin() * 2,
    getCurrentScreen()._h - getMargin() * 2
  ))
  getFocusedWindow():centerOnScreen(nil,nil,0)
end

function window.split (position)
  return function ()
    if recentWindow == getFocusedWindow():id() then
      if recentPosition == position then
        if recentSplitSize == 'half' then
          recentSplitSize = 'third'
          if recentPosition == 'topRight' then getFocusedWindow():setTopLeft(hs.geometry.point(positions['topRightThird']())) end
          getFocusedWindow():setSize(hs.geometry.size(
            getCurrentScreen()._w / 3 - getMargin(),
            getCurrentScreen()._h - getMargin() * 2
          ))
          return
        end
        if recentSplitSize == 'third' then
          recentSplitSize = 'twoThirds'
          if recentPosition == 'topRight' then getFocusedWindow():setTopLeft(hs.geometry.point(positions['topRightTwoThirds']())) end
          getFocusedWindow():setSize(hs.geometry.size(
            getCurrentScreen()._w / 1.5 - getMargin(),
            getCurrentScreen()._h - getMargin() * 2
          ))
          return
        end
      end
    end
    recentWindow = getFocusedWindow():id()
    recentPosition = position
    recentSplitSize = 'half'
    
    getFocusedWindow():setTopLeft(hs.geometry.point(positions[position]()))
    getFocusedWindow():setSize(hs.geometry.size(
      getCurrentScreen()._w / 2 - getMargin(),
      getCurrentScreen()._h - getMargin() * 2
    ))
  end
end

function window.quarter (position)
  return function ()
    resetRecents()
    getFocusedWindow():setTopLeft(hs.geometry.point(positions[position]()))
    getFocusedWindow():setSize(hs.geometry.size(
      getCurrentScreen()._w / 2 - getMargin(),
      getCurrentScreen()._h / 2 - getMargin()
    ))
  end
end


-- Export module
return window
