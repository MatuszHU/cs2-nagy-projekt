-- game.lua
local GridManager = require "util.gridManager"
local CharacterManager = require "util.characterManager"
local BattleManager = require "util.battleManager"
local Phase = require "../enums.battlePhases"

local Game = {}
Game.__index = Game

function Game:new()
    local self = setmetatable({}, Game)

    
    self:init()

    -- Create some example teams
    local playerTeam = self.battleManager.playerRoster:getTeam()

    local aiTeam = {
        self.characterManager:addCharacter("Orc Grunt", "orc", "knight", 1, 8, 4),
        self.characterManager:addCharacter("Orc Grunt2", "orc", "knight", 1, 9, 5)
    }

    self.battleManager:assignTeams(playerTeam, aiTeam)
    self.battleManager:startBattle()

    return self
end

function Game:init()
    local screenW, screenH = love.graphics.getDimensions()
    self.gridManager = GridManager:new("assets/maps/ForestCampMeta", "assets/maps/ForestCamp.png", screenW, screenH)
    self.characterManager = CharacterManager:new(self.gridManager)
    self.battleManager = BattleManager:new(self.characterManager)

end

function Game:update(dt)
    self.battleManager:update(dt)
end

function Game:draw()
    self.gridManager:draw()
    self.characterManager:draw()

    if self.battleManager.isBattleOver then
            local winner = self.battleManager.winner or "Unknown"
            local w, h = love.graphics.getDimensions()

            love.graphics.setColor(0, 0, 0, 0.6)
            love.graphics.rectangle("fill", 0, 0, w, h)

            love.graphics.setColor(1, 1, 1)
            love.graphics.printf("Battle Over!", 0, h / 2 - 40, w, "center")
            love.graphics.printf(winner .. " Wins!", 0, h / 2, w, "center")
            love.graphics.printf("Press Enter to restart", 0, h / 2 + 40, w, "center")
    end
end


function Game:mousepressed(x, y, button)
     if button ~= 1 then return end -- only handle left click

    local gridX, gridY = self.gridManager:screenToGrid(x, y)

    local clicked = self.characterManager:getCharacterAt(gridX, gridY)

    local phase = self.battleManager.phase

    if phase == Phase.SELECT then
        if clicked then
            self.battleManager:selectCharacter(clicked)
        else
            print("No character at clicked cell.")
        end
        return
    end

    if phase == Phase.MOVE then
        -- attempt to move to the clicked grid cell
        -- allow click on empty cell to move; if clicked a character, ignore (can't move onto chars)
        if clicked then
            print("Cannot move to occupied cell.")
            return
        end
        self.battleManager:moveCharacter(gridX, gridY)
        return
    end

    if phase == Phase.ATTACK then
        if not self.battleManager.selectedCharacter then
            print("No selected attacker.")
            return
        end

        if clicked then
            -- if clicked target is allied, forbid; else attack
            if self.battleManager:isCharacterOnCurrentTeam(clicked) then
                print("Cannot attack allies.")
                return
            end
            self.battleManager:attack(clicked)
        else
            print("No target at clicked cell.")
        end
        return
    end
end

function Game:keypressed(key)
     if self.battleManager.isBattleOver and key == "k" then
        self.battleManager:endBattle()
     end
end



return Game
