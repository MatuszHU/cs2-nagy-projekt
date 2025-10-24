-- characterManager.lua
local Character = require "character"

local CharacterManager = {}
CharacterManager.__index = CharacterManager

function CharacterManager:new(gridManager)
    local self = setmetatable({}, CharacterManager)
    self.characters = {}           -- stores all Character instances
    self.selectedCharacter = nil   -- currently selected unit
    self.gridManager = gridManager
    return self
end

function CharacterManager:addCharacter(name, race, class, spriteIndex, gridX, gridY)
    local char = Character(name, race, class, spriteIndex, gridX, gridY)
    char:loadSprite()
    -- dynamically calculate scale based on sprite size
    local cw, ch = self.gridManager.cellW, self.gridManager.cellH
    local sw = char.spriteManager.sheetWidth
    local sh = char.spriteManager.sheetHeight
    char.scale = {
        x = cw / (sw/3),
        y = ch / (sh/2)
    }
    self:alignToGridCenter(char)
    table.insert(self.characters, char)
    return char
end

function CharacterManager:alignToGridCenter(char)
    local cw, ch = self.gridManager.cellW, self.gridManager.cellH
    local sw = char.spriteManager.sheetWidth
    local sh = char.spriteManager.sheetHeight
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
    local mapScale = self.gridManager.scale

    for _, char in ipairs(self.characters) do
        local baseX, baseY = self.gridManager:gridToScreen(char.gridX, char.gridY)
        local drawX = baseX + (char.offsetX or 0) * mapScale
        local drawY = baseY + (char.offsetY or 0) * mapScale
        char:draw(drawX, drawY, mapScale * char.scale.x, mapScale * char.scale.y)
    end
end

return CharacterManager
