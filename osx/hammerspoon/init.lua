local window = require('window')
local alert = require('utils').alert


-- Keybindings
local mod1 = { 'cmd', 'ctrl' }
local mod2 = { 'cmd', 'ctrl', 'shift' }
local mod3 = { 'cmd', 'ctrl', 'alt' }
local mod4 = { 'cmd', 'alt' }

hs.hotkey.bind(mod1, 'm', window.toggleMargins)

hs.hotkey.bind(mod4, 'c', window.center)
hs.hotkey.bind(mod4, 'f', window.maximize)

hs.hotkey.bind(mod3, 'left', window.move('left'))
hs.hotkey.bind(mod3, 'right', window.move('right'))

hs.hotkey.bind(mod4, 'left', window.split('topLeft'))
hs.hotkey.bind(mod4, 'right', window.split('topRight'))

hs.hotkey.bind(mod1, 'left', window.quarter('topLeft'))
hs.hotkey.bind(mod2, 'left', window.quarter('bottomLeft'))
hs.hotkey.bind(mod1, 'right', window.quarter('topRight'))
hs.hotkey.bind(mod2, 'right', window.quarter('bottomRight'))


-- Watch for hammerspoon config changes
local function reloadConfig(files) hs.reload() end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
alert('Reloaded config ', 'warning')
