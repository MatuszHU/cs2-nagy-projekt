local races = require "race"
local classes = require "class"
local SpriteManager = require "util/spriteManager"

local function Character(name, raceKey, classKey, spriteIndex)
    local self = {}

    local race = races[raceKey]
    local class = classes[classKey]

    self.name = name or "Hero"
    self.race = race.name
    self.class = class.name

    self.stats = {}
    for k, v in pairs(race.stats) do
        self.stats[k] = v + (class.stats[k] or 0)
    end

    self.spriteManager = SpriteManager()

    -- TODO: Remove nil
    function self:loadSprite(selectedIndex)
        self.spriteManager:loadSprite(self.race, nil, selectedIndex or 1, 20)
    end

    function self:draw(x, y)
        self.spriteManager:draw(self.spriteManager.sheet, x, y)
    end

    self:loadSprite(spriteIndex)

    return self
end

return Character
