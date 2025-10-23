local font = require "util.fonts"
local Button = require "Button"
local button = require "enums.button"
local changeGameState = require "util.changeGameState"
local uiHandler = require "util.ui"

local timer = 0
local holdTime = 1.2
local fadeInTime = 1
local fadeOutTime = 1
local finished = false

local endButtons = {
    menu = Button("Back to Menu", function() changeGameState("menu") end, nil, 150, 40),
    quit = Button("Quit Game", function() love.event.quit() end, nil, 150, 40)
}


local EndView = {}

function EndView.load()
    
end

function EndView.update(dt)

end

function EndView.draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    love.graphics.clear(0, 0, 0)
    love.graphics.setFont(font.title.font)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Game Over", font.title.font, 0, screenHeight / 2 - 100, screenWidth, "center")
    love.graphics.setFont(font.button.font)
    endButtons.menu:texturedDraw(screenWidth / 2 - endButtons.menu.width / 2, screenHeight / 2)
    endButtons.quit:texturedDraw(screenWidth / 2 - endButtons.quit.width / 2, screenHeight / 2 + 60)
end

return EndView