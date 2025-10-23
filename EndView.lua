local font = require "util/fonts"
local Button = require "Button"
local button = require "enums/button"
local changeGameState = require "util/changeGameState"
local uiHandler = require "util/ui"

local timer = 0
local holdTime = 1.2
local fadeInTime = 1
local fadeOutTime = 1
local finished = false

local endButtons = {
    menu = Button("Back to Menu", function() changeGameState("menu") end, nil, 150, 40),
    quit = 
}


local EndView = {}

function EndView.load()
    
end

function EndView.update(dt)

end

function EndView.draw()

end

return EndView