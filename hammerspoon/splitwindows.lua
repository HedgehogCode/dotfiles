-- This file defines a data structure that keeps track of windows that are in a split for all spaces.


---Datastructure holding the windows in a split on a single space
---@class SplitWindows
---@field leftWindows hs.window[]
---@field centerWindows hs.window[]
---@field rightWindows hs.window[]
---@field leftSplitPosition number
---@field rightSplitPosition number
SplitWindows = {}

function SplitWindows:new()
    local o = {
        leftWindows = {},
        centerWindows = {},
        rightWindows = {},
        leftSplitPosition = 0.5,
        rightSplitPosition = 0.5,
    }
    self.__index = self
    return setmetatable(o, self)
end

function SplitWindows:__tostring()
    local leftTitles = hs.fnutils.map(self.leftWindows, function(window) return window:title() end)
    local centerTitles = hs.fnutils.map(self.centerWindows, function(window) return window:title() end)
    local rightTitles = hs.fnutils.map(self.rightWindows, function(window) return window:title() end)
    return "left" .. hs.inspect(leftTitles) .. "\n"  --
        .. "center" .. hs.inspect(centerTitles) .. "\n" --
        .. "right" .. hs.inspect(rightTitles)
end

---@param window hs.window the window to split on the left side
---@param split "left" | "center" | "right" the split to add the window to
function SplitWindows:addWindowIntoSplit(window, split)
    if split == "left" then
        table.insert(self.leftWindows, window)
        window:moveToUnit(hs.geometry.rect(0, 0, self.leftSplitPosition, 1))
    elseif split == "center" then
        table.insert(self.centerWindows, window)
        -- TODO move the left and right split position if necessary
    elseif split == "right" then
        table.insert(self.rightWindows, window)
        window:moveToUnit(hs.geometry.rect(self.rightSplitPosition, 0, 1 - self.rightSplitPosition, 1))
    end
end

---Data structure holding the splitwindows for all spaces
---@class SplitWindowsManager
---@field splitWindowsPerSpace table<number, SplitWindows>
SplitWindowsManager = {}

function SplitWindowsManager:new()
    local o = {
        splitWindowsPerSpace = {}
    }
    self.__index = self
    return setmetatable(o, self)
end

function SplitWindowsManager:__tostring()
    local s = ""
    for space, splitWindows in pairs(self.splitWindowsPerSpace) do
        s = s .. "Space: " .. space .. " SplitWindows:\n" .. tostring(splitWindows) .. "\n"
    end
    return s
end

---@param window hs.window the window to split on the left side
---@param split "left" | "center" | "right" the split to add the window to
function SplitWindowsManager:addWindowIntoSplit(window, split)
    local spacesOfWindow = hs.spaces.windowSpaces(window)
    if spacesOfWindow == nil or #spacesOfWindow > 1 then
        -- TODO is this correct for sticky windows that are on multiple spaces??
        -- Ignore sticky windows or windows where we do not get the space
        return
    end
    local space = spacesOfWindow[1]
    if not self.splitWindowsPerSpace[space] then
        self.splitWindowsPerSpace[space] = SplitWindows:new()
    end
    self.splitWindowsPerSpace[space]:addWindowIntoSplit(window, split)
end
