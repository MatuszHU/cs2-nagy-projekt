local BattleManager = {}
BattleManager.__index = BattleManager

local Phase = require("../enums.battlePhases")

function BattleManager:new(characterManager)
    local self = setmetatable({}, BattleManager)
    self.characterManager = characterManager
    self.phase = Phase.IDLE

    self.players = {
        { id = 1, name = "Player", team = {} },
        { id = 2, name = "AI", team = {} }
    }

    self.currentPlayerIndex = 1
    self.actedCharacters = {}
    return self
end

-- Assign characters to teams before battle starts
function BattleManager:assignTeams(playerTeam, aiTeam)
    self.players[1].team = playerTeam or {}
    self.players[2].team = aiTeam or {}
end

function BattleManager:startBattle()
    self.phase = Phase.SELECT
    self.currentPlayerIndex = 1
    self.actedCharacters = {}
    print("Battle started! " .. self:getCurrentPlayer().name .. " goes first.")
end

function BattleManager:getCurrentPlayer()
    return self.players[self.currentPlayerIndex]
end

function BattleManager:isCharacterOnCurrentTeam(char)
    for _, c in ipairs(self:getCurrentPlayer().team) do
        if c == char then return true end
    end
    return false
end

function BattleManager:selectCharacter(char)
    if not self:isCharacterOnCurrentTeam(char) then
        print("Cannot control enemy units!")
        return false
    end
    if self.actedCharacters[char] then
        print(char.name .. " has already acted this turn.")
        return false
    end

    self.selectedCharacter = char
    self.phase = Phase.MOVE
    print("Selected " .. char.name .. " to act.")
    return true
end

function BattleManager:moveCharacter(gridX, gridY)
    if self.phase ~= Phase.MOVE or not self.selectedCharacter then return end

    local char = self.selectedCharacter
    local reachable = self.characterManager:getReachableCells(char)

    for _, cell in ipairs(reachable) do
        if cell.x == gridX and cell.y == gridY then
            char:moveTo(gridX, gridY)
            self.phase = Phase.ATTACK
            print(char.name .. " moved to (" .. gridX .. "," .. gridY .. ")")
            return
        end
    end

    print("Cannot move there!")
end

function BattleManager:attack(target)
    if self.phase ~= Phase.ATTACK or not self.selectedCharacter then return end
    if not target then
        print("No target selected.")
        return
    end
    if self:isCharacterOnCurrentTeam(target) then
        print("Cannot attack allies!")
        return
    end

    local attacker = self.selectedCharacter
    local damage = self:calculateDamage(attacker, target)
    target.stats.hp = math.max(0, target.stats.hp - damage)
    print(attacker.name .. " attacks " .. target.name .. " for " .. damage .. " damage! HP left: " .. target.stats.hp)

    self.actedCharacters[attacker] = true
    self.selectedCharacter = nil
    self.phase = Phase.SELECT

    if self:checkEndOfTurn() then
        self:endTurn()
    end
end

function BattleManager:calculateDamage(attacker, target)
    local atk = attacker.stats.attack or 0
    local def = target.stats.defense or 0
    return atk-def
end

function BattleManager:checkEndOfTurn()
    local allActed = true
    for _, char in ipairs(self:getCurrentPlayer().team) do
        if not self.actedCharacters[char] and char.stats.hp > 0 then
            allActed = false
            break
        end
    end
    return allActed
end

function BattleManager:endTurn()
    print(self:getCurrentPlayer().name .. "'s turn ended.")
    self.phase = Phase.END_TURN

    -- switch player
    self.currentPlayerIndex = (self.currentPlayerIndex % #self.players) + 1
    self.actedCharacters = {}
    self.phase = Phase.SELECT
    print("Now it's " .. self:getCurrentPlayer().name .. "'s turn!")
end

function BattleManager:update(dt)
    -- in future: handle AI logic, animations, etc.
end

function BattleManager:draw()
    -- optional: draw highlights, turn indicators, etc.
end

return BattleManager
