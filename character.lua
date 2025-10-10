local races = require "race"
local classes = require "class"

local Character = {}

function createCharater(name, race, class)
    local race = races[race]
    local class = classes[class]

    local stats = {}
    for k,v in pairs(race.stats) do
        stats[k] = v + (class.stats[k] or 0)
    end

    return {
        name = name or "Hero",
        race = race.name,
        class = class.name,
        stats = stats
    }
end

return Character