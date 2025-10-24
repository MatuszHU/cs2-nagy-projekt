-- characterManager.lua
local Character = require "character"

local CharacterManager = {}
CharacterManager.__index = CharacterManager

function CharacterManager:new(gridManager)
    local self = setmetatable({}, CharacterManager)
    self.characters = {}           -- stores all Character instances
    self.selectedCharacter = nil   -- currently selected unit
    self.gridManager = gridManager
    local cw, ch = gridManager.cellW, gridManager.cellH
    self.scale = { x = cw / 512, y = ch / 512 }
    return self
end

function CharacterManager:addCharacter(name, race, class, spriteIndex, gridX, gridY)
    local char = Character(name, race, class, spriteIndex, gridX, gridY)
    char:loadSprite()
    table.insert(self.characters, char)
    return char
end

function CharacterManager:selectAt(gridX, gridY)
    for _, char in ipairs(self.characters) do
        if char.gridX == gridX and char.gridY == gridY then
            self.selectedCharacter = char
            print("Selected: " .. char.name)
            return char
        end
    end
    self.selectedCharacter = nil
    return nil
end

function CharacterManager:moveSelectedTo(gridX, gridY)
    if self.selectedCharacter then
        self.selectedCharacter:moveTo(gridX, gridY)
    end
end

function CharacterManager:update(dt)
    for _, char in ipairs(self.characters) do
        if char.update then
            char:update(dt)
        end
    end
end

function CharacterManager:draw()
    for _, char in ipairs(self.characters) do
        local screenX, screenY = self.gridManager:gridToScreen(char.gridX, char.gridY)
        char:draw(screenX, screenY, self.scale.x, self.scale.y)
    end
end

return CharacterManager
