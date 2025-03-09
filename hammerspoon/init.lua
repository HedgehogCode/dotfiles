hs.loadSpoon("EmmyLua")
hs.loadSpoon("SpoonInstall")

-- Bind hotkeys to move window to left half
hs.hotkey.bind({ "cmd" }, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(hs.layout.left50)
end)

-- Bind hotkeys to move window to right half
hs.hotkey.bind({ "cmd" }, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(hs.layout.right50)
end)

-- Fullscreen
hs.hotkey.bind({ "cmd" }, "Up", function()
    local win = hs.window.focusedWindow()
    win:maximize()
end)


hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")
