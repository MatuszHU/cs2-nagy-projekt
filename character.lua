local races = require "race"
local classes = require "class"
local SpriteManager = require "util/spriteManager"

local function Character(name, raceKey, classKey, spriteIndex, gridX, gridY)

    local function randomAllocate(statPoints, statsPool)
        local allocation = {}
        local remaining = statPoints

        while remaining > 0 do
            local randomStat = statsPool[math.random(1, #statsPool)]
            allocation[randomStat] = (allocation[randomStat] or 0) + 1
            remaining = remaining - 1
        end

        return allocation
    end

      return {
        name = name or "Hero",
        race = races[raceKey],
        class = classes[classKey],
        level = 1,
        statPoints = 0,
        baseStats = {},
        bonusStats = {},
        stats = {},
        spriteIndex = 1,
        isDefeated = false,
        offsetX = 0,
        gridX = gridX,
        gridY = gridY,
        setStats = function(self)
            for k, v in pairs(self.race.stats) do
                self.baseStats[k] = v + (self.class.stats[k] or 0)
                self.bonusStats[k] = self.bonusStats[k] or 0
                self.stats[k] = self.baseStats[k] + self.bonusStats[k]
            end
            self.stats.max_hp = self.stats.hp
        end,
        spriteManager = SpriteManager(),
        levelUp = function(self)
            self.level = self.level + 1
            self.statPoints = self.statPoints + (math.floor((self.level - 1) / 4) + 3)
            
            local availableStats = {}
            for statName in pairs(self.baseStats) do
                table.insert(availableStats, statName)
            end

            local allocation = randomAllocate(self.statPoints, availableStats)
            
            for stat, points in pairs(allocation) do
                self.bonusStats[stat] = (self.bonusStats[stat] or 0) + points
            end

            self.statPoints = 0
            self:setStats()
        end,
        loadSprite = function(self, offsetX)
            self.spriteIndex = spriteIndex or self.spriteIndex
            self.offsetX = offsetX or self.offsetX
            self.spriteManager:loadSprite(self.race.name, self.class.name, self.spriteIndex, self.offsetX)
        end,
        draw = function(self, x, y, scaleX, scaleY)
            scaleX = scaleX or 1
            scaleY = scaleY or 1
            self.spriteManager:draw(self.spriteManager.sheet, x, y, scaleX, scaleY)
        end,
        moveTo = function(self, newGridX, newGridY)
            self.gridX = newGridX or self.gridX
            self.gridY = newGridY or self.gridY
        end,

    }
end

return Character
