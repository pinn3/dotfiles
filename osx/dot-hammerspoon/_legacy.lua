-- Working example for toggling keybindings

-- Place keybinds in a table to easily iterate over them to toggle their enabled state
keybinds = {}
hammerSpoonState = true

-- Dynamically get the currently focused window
function getFocusedWindow () return hs.window.focusedWindow() end

function move (direction)
  return function ()
    resetRecents()
    if direction == 'left' then getFocusedWindow():centerOnScreen(getFocusedWindow():screen():previous(),nil,0) end
    if direction == 'right' then getFocusedWindow():centerOnScreen(getFocusedWindow():screen():next(),nil,0) end
  end
end
keybinds.moveLeft = hs.hotkey.bind({'cmd','alt','ctrl'},'left',nil,move('left'))
keybinds.moveLeft:enable()

function toggleHammerSpoon ()
  if hammerSpoonState then
    for key,keybind in pairs(keybinds) do
      keybind:disable()
    end
    hammerSpoonState = false
    keybinds.toggleHammerSpoon:enable()
  else
    for key,keybind in pairs(keybinds) do
      keybind:enable()
    end
    hammerSpoonState = true
  end
  alert('Hammerspoon '..tostring(hammerSpoonState))
end
keybinds.toggleHammerSpoon = hs.hotkey.new({'cmd','ctrl'},'h',nil,toggleHammerSpoon)
keybinds.toggleHammerSpoon:enable()
