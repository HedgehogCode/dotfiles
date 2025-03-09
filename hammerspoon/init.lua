hs.loadSpoon("EmmyLua")
hs.loadSpoon("SpoonInstall")

-- i = 0
-- while i < 10 do
--     local isKeyUsed = hs.hotkey.systemAssigned({ "ctrl", "shift" }, tostring(i))
--     if isKeyUsed then
--         hs.alert.show(tostring(i) .. " is used for " .. tostring(isKeyUsed))
--     end
--     i = i + 1
-- end

-- hs.alert.show("rightarrow: " .. tostring(hs.hotkey.systemAssigned({"cmd"}, "right")))
-- hs.alert.show("leftarrow: " .. tostring(hs.hotkey.systemAssigned({"cmd"}, "left")))
-- hs.alert.show("uparrow: " .. tostring(hs.hotkey.systemAssigned({"cmd"}, "up")))
-- hs.alert.show("downarrow: " .. tostring(hs.hotkey.systemAssigned({"cmd"}, "down")))




leftWindows = {}
rightWindows = {}
leftSplitPosition = 0.5
isAdjustingSplit = false -- TODO i don't think this works

local function removeFromList(win, list)
    for i, w in ipairs(list) do
        if w == win then
            table.remove(list, i)
            break
        end
    end
end

-- Bind hotkeys to move window to left half
hs.hotkey.bind({ "cmd" }, "Left", function()
    local win = hs.window.focusedWindow()
    removeFromList(win, rightWindows)
    table.insert(leftWindows, win)
    win:moveToUnit(hs.layout.left50)
end)

-- Bind hotkeys to move window to right half
hs.hotkey.bind({ "cmd" }, "Right", function()
    local win = hs.window.focusedWindow()
    removeFromList(win, leftWindows)
    table.insert(rightWindows, win)
    win:moveToUnit(hs.layout.right50)
end)

-- Fullscreen
hs.hotkey.bind({ "cmd" }, "Up", function()
    local win = hs.window.focusedWindow()
    removeFromList(win, leftWindows)
    removeFromList(win, rightWindows)
    win:maximize()
end)

-- TODO limit this stuff on the primary screen

local function isLeft(window)
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    return windowFrame.x == screenFrame.x  -- left side of the screen
        and windowFrame.y == screenFrame.y -- top of the screen
        and windowFrame.h == screenFrame.h -- full height
        and windowFrame.w ~= screenFrame.w -- not fullscreen
end

local function isRight(window)
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    return windowFrame.x + windowFrame.w == screenFrame.x + screenFrame.w -- right side of the screen
        and windowFrame.y == screenFrame.y                                -- top of the screen
        and windowFrame.h == screenFrame.h                                -- full height
        and windowFrame.w ~= screenFrame.w                                -- not fullscreen
end

local function updateSplitWindows()
    isAdjustingSplit = true

    -- Loop over left windows
    for i, win in ipairs(leftWindows) do
        -- TODO check if it is still left???
        -- TODO do not move if already correct?
        hs.alert.show("Window spaces: " .. tostring(hs.spaces.windowSpaces(win)))
        win:moveToUnit(hs.geometry.rect(0, 0, leftSplitPosition, 1))
    end

    -- Loop over right windows
    for i, win in ipairs(rightWindows) do
        -- TODO check if it is still right???
        -- TODO do not move if already correct?
        hs.alert.show("Window spaces: " .. tostring(hs.spaces.windowSpaces(win)))
        win:moveToUnit(hs.geometry.rect(leftSplitPosition, 0, 1 - leftSplitPosition, 1))
    end

    isAdjustingSplit = false
end

hs.window.filter.defaultCurrentSpace:subscribe(hs.window.filter.windowMoved, function(movedWindow)
    local screenFrame = movedWindow:screen():frame()
    local windowFrame = movedWindow:frame()

    if isAdjustingSplit then
        -- Ignore any resize if it was done by updateSplitWindows
        return
    elseif hs.fnutils.contains(leftWindows, movedWindow) then
        if isLeft(movedWindow) then
            -- this defines the new split position
            leftSplitPosition = windowFrame.w / screenFrame.w
            updateSplitWindows()
            -- hs.alert.show("Window is on the left side of the screen")
        else
            removeFromList(movedWindow, leftWindows)
        end
    elseif hs.fnutils.contains(rightWindows, movedWindow) then
        if isRight(movedWindow) then
            leftSplitPosition = windowFrame.x / screenFrame.w
            updateSplitWindows()
            -- hs.alert.show("Window is on the right side of the screen")
        else
            removeFromList(movedWindow, rightWindows)
        end
    end
end)



-- PLAN:
-- 1. Move windows between screens with CTRL+SHIFT + NUMBER (this fits the CTRL+NUMBER shortcut)
-- 2. Move windows to splits with CMD+RIGHT/LEFT
-- 3. Move windows to fullscreen with CMD+UP
-- 4. Move to other screen with CMD+SHIFT+RIGHT/LEFT
-- ???

-- local hyper = {"ctrl", "alt", "cmd"}

-- hs.loadSpoon("MiroWindowsManager")

-- hs.window.animationDuration = 0.3
-- spoon.MiroWindowsManager:bindHotkeys({
--   up = {hyper, "up"},
--   right = {hyper, "right"},
--   down = {hyper, "down"},
--   left = {hyper, "left"},
--   fullscreen = {hyper, "f"},
--   nextscreen = {hyper, "n"}
-- })


-- spoon.SpoonInstall.repos.PaperWM = {
--     url = "https://github.com/mogenson/PaperWM.spoon",
--     desc = "PaperWM.spoon repository",
--     branch = "release",
-- }

-- spoon.SpoonInstall:andUse("PaperWM", {
--     repo = "PaperWM",
--     config = { screen_margin = 16, window_gap = 2 },
--     start = true,
--     hotkeys = {
--         -- switch to a new focused window in tiled grid
--         focus_left  = {{"alt", "cmd"}, "left"},
--         focus_right = {{"alt", "cmd"}, "right"},
--         focus_up    = {{"alt", "cmd"}, "up"},
--         focus_down  = {{"alt", "cmd"}, "down"},

--         -- move windows around in tiled grid
--         swap_left  = {{"alt", "cmd", "shift"}, "left"},
--         swap_right = {{"alt", "cmd", "shift"}, "right"},
--         swap_up    = {{"alt", "cmd", "shift"}, "up"},
--         swap_down  = {{"alt", "cmd", "shift"}, "down"},

--         -- position and resize focused window
--         center_window        = {{"alt", "cmd"}, "c"},
--         full_width           = {{"alt", "cmd"}, "f"},
--         cycle_width          = {{"alt", "cmd"}, "r"},
--         reverse_cycle_width  = {{"ctrl", "alt", "cmd"}, "r"},
--         cycle_height         = {{"alt", "cmd", "shift"}, "r"},
--         reverse_cycle_height = {{"ctrl", "alt", "cmd", "shift"}, "r"},

--         -- move focused window into / out of a column
--         slurp_in = {{"alt", "cmd"}, "i"},
--         barf_out = {{"alt", "cmd"}, "o"},

--         -- move the focused window into / out of the tiling layer
--         toggle_floating = {{"alt", "cmd", "shift"}, "escape"},

--         -- switch to a new Mission Control space
--         switch_space_l = {{"alt", "cmd"}, ","},
--         switch_space_r = {{"alt", "cmd"}, "."},
--         switch_space_1 = {{"alt", "cmd"}, "1"},
--         switch_space_2 = {{"alt", "cmd"}, "2"},
--         switch_space_3 = {{"alt", "cmd"}, "3"},
--         switch_space_4 = {{"alt", "cmd"}, "4"},
--         switch_space_5 = {{"alt", "cmd"}, "5"},
--         switch_space_6 = {{"alt", "cmd"}, "6"},
--         switch_space_7 = {{"alt", "cmd"}, "7"},
--         switch_space_8 = {{"alt", "cmd"}, "8"},
--         switch_space_9 = {{"alt", "cmd"}, "9"},

--         -- move focused window to a new space and tile
--         move_window_1 = {{"alt", "cmd", "shift"}, "1"},
--         move_window_2 = {{"alt", "cmd", "shift"}, "2"},
--         move_window_3 = {{"alt", "cmd", "shift"}, "3"},
--         move_window_4 = {{"alt", "cmd", "shift"}, "4"},
--         move_window_5 = {{"alt", "cmd", "shift"}, "5"},
--         move_window_6 = {{"alt", "cmd", "shift"}, "6"},
--         move_window_7 = {{"alt", "cmd", "shift"}, "7"},
--         move_window_8 = {{"alt", "cmd", "shift"}, "8"},
--         move_window_9 = {{"alt", "cmd", "shift"}, "9"}
--     }
-- })

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")
