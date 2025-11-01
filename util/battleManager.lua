-- util/battleManager.lua
local BattleManager = {}
BattleManager.__index = BattleManager

local Phase = require "../enums.battlePhases"
local PlayerRoster = require "util.playerRoster"


function BattleManager:new(characterManager)
    local self = setmetatable({}, BattleManager)
    self.characterManager = characterManager
    self.phase = Phase.IDLE

    self.playerRoster = PlayerRoster:new(self.characterManager)


    self.players = {
        { id = 1, name = "Player", team  = self.playerRoster:getTeam() },
        { id = 2, name = "AI", team = {} }
    }

    self.currentPlayerIndex = 1
    self.actedCharacters = {}
    self.selectedCharacter = nil
    self.isBattleOver = false
    self.winner = nil
    return self
end

function BattleManager:assignTeams(playerTeam, aiTeam)
    self.players[1].team = playerTeam or {}
    self.players[2].team = aiTeam or {}
end

function BattleManager:startBattle()
    self.phase = Phase.SELECT
    self.currentPlayerIndex = 1
    self.actedCharacters = {}
    self.selectedCharacter = nil
    self.isBattleOver = false
    self.winner = nil
    print("Battle started! " .. self:getCurrentPlayer().name .. " goes first.")
end

function BattleManager:levelUpCharacters()
    for _, char in ipairs(self.playerRoster:getTeam()) do
        char:levelUp()
    end
end

function BattleManager:endBattle()
    print("Ending battle...")

    if self.winner == "Player" then
        self:levelUpCharacters()
    end

    -- === Restore and reuse player roster ===
    self.playerRoster:resetAfterBattle()

    -- Remove all characters except your roster ones
    local newList = {}
    for _, c in ipairs(self.characterManager.characters) do
        for _, pc in ipairs(self.playerRoster:getTeam()) do
            if c == pc then
                table.insert(newList, c)
            else
                self.playerRoster.nameManager:removeName(c.name)
            end
            
        end
    end
    self.characterManager.characters = newList

    local newAiTeam = {
        self.characterManager:addCharacter(self.playerRoster.nameManager:getRandomName("orc","male"), "orc", "knight", 1, 8, 4),
        self.characterManager:addCharacter(self.playerRoster.nameManager:getRandomName("orc","male"), "orc", "knight", 1, 9, 5)
    }

    -- Assign updated teams
    self.characterManager:clearHighlight()
    self:assignTeams(self.playerRoster:getTeam(), newAiTeam)

    self:startBattle()
    print("A new battle begins! Your roster returns to fight again!")
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
    if char.isDefeated then
        print("Cannot select defeated character!")
        return false
    end
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
    if self.characterManager then
        self.characterManager:highlightReachable(char)
    end
    return true
end

function BattleManager:moveCharacter(gridX, gridY)
    if self.phase ~= Phase.MOVE or not self.selectedCharacter then return end

    local char = self.selectedCharacter
    local reachable = self.characterManager:getReachableCells(char)

    for _, cell in ipairs(reachable) do
        if cell.x == gridX and cell.y == gridY then
            char:moveTo(gridX, gridY)
            if self.characterManager then
                self.characterManager:clearHighlight()
            end
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

    if target.stats.hp <= 0 then
        print(target.name .. " has been defeated.")
        target.isDefeated = true
    end

    -- Check victory
    local playerAlive = false
    for _, c in ipairs(self.players[1].team) do
        if not c.isDefeated then
            playerAlive = true
            break
        end
    end

    local aiAlive = false
    for _, c in ipairs(self.players[2].team) do
        if not c.isDefeated then
            aiAlive = true
            break
        end
    end

    if not playerAlive or not aiAlive then
        local winner = playerAlive and self.players[1].name or self.players[2].name
        print("Battle over! " .. winner .. " wins!")

        self.winner = winner
        self.isBattleOver = true
        self.phase = Phase.IDLE
        return
    end

    if self:checkEndOfTurn() then
        self:endTurn()
    end
end

function BattleManager:calculateDamage(attacker, target)
    local atk = (attacker.stats and attacker.stats.attack) or 0
    local def = (target.stats and target.stats.defense) or 0
    local dmg = atk - def
    return math.max(0, dmg)
end

function BattleManager:checkEndOfTurn()
    local allActed = true
    for _, char in ipairs(self:getCurrentPlayer().team) do
        if (not self.actedCharacters[char]) and (not char.isDefeated) then
            allActed = false
            break
        end
    end
    return allActed
end

function BattleManager:endTurn()
    print(self:getCurrentPlayer().name .. "'s turn ended.")
    self.phase = Phase.END_TURN

    self.currentPlayerIndex = (self.currentPlayerIndex % #self.players) + 1
    self.actedCharacters = {}
    self.phase = Phase.SELECT
    print("Now it's " .. self:getCurrentPlayer().name .. "'s turn!")
end

function BattleManager:update(dt)
    -- Future: AI logic
end

function BattleManager:draw()
end

return BattleManager
