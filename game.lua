-- game.lua
local GridManager = require "util.gridManager"
local CharacterManager = require "util.characterManager"
local BattleManager = require "util.battleManager"

local Game = {}
Game.__index = Game

function Game:new()
    local self = setmetatable({}, Game)

    -- initialize grid, characters, and battle logic
    self.gridManager = GridManager("campMap")
    self.characterManager = CharacterManager:new(self.gridManager)
    self.battleManager = BattleManager:new(self.characterManager)

    -- Create some example teams
    local playerTeam = {
        self.characterManager:addCharacter("Hero", "human", "warrior", 1, 3, 4),
        self.characterManager:addCharacter("Archer", "elf", "ranger", 1, 5, 4)
    }

    local aiTeam = {
        self.characterManager:addCharacter("Goblin", "orc", "fighter", 1, 8, 4),
        self.characterManager:addCharacter("Shaman", "orc", "mage", 1, 9, 5)
    }

    self.battleManager:assignTeams(playerTeam, aiTeam)
    self.battleManager:startBattle()

    return self
end

function Game:update(dt)
    self.battleManager:update(dt)
    self.characterManager:update(dt)
end

function Game:draw()
    self.gridManager:draw()
    self.characterManager:draw()
end

function Game:mousepressed(x, y, button)
    local gridX, gridY = self.gridManager:screenToGrid(x, y)

    if button == 1 then
        -- Left-click: handle selection
        local char = self.characterManager:selectAt(gridX, gridY)
        if char then
            self.battleManager:selectCharacter(char)
        else
            -- maybe attempt movement or attack if one is selected
            self.battleManager:moveCharacter(gridX, gridY)
        end

    elseif button == 2 then
        -- Right-click: cancel selection or end action
        self.battleManager.selectedCharacter = nil
        print("Cancelled selection.")
    end
end

return Game
