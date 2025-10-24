local races = require "race"
local classes = require "class"
local SpriteManager = require "util/spriteManager"

local function Character(name, raceKey, classKey, spriteIndex, gridX, gridY)

      return {
        name = name or "Hero",
        race = races[raceKey],
        class = classes[classKey],
        stats = {},
        spriteIndex = 1,
        offsetX = 0,
        gridX = gridX,
        gridY = gridY,
        setStats = function(self)
            for k, v in pairs(self.race.stats) do
                self.stats[k] = v + (self.class.stats[k] or 0)
            end
        end,
        spriteManager = SpriteManager(),
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
        moveTo = function(newGridX, newGridY)
            self.gridX = newGridX
            self.gridY = newGridY
        end,

    }
end

return Character
