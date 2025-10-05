-- Gyakorlatilag import
local love = require "love"
local button = require "Button"
--Minden globálisan érvényes érték itt legyen kezelve
local game = {
    --Játék állapotok
    state = {
        menu = true,
        paused = false,
        running = false,
    }
}

local buttons = {
    menu = {}
}
local function changeGameState(state)
    game.state["menu"] = state == "menu"
    game.state["paused"] = state == "paused"
    game.state["running"] = state == "running"
end
local mouse = {
    radius = 20,
    x = 30,
    y = 30
}

function love.mousepressed(x,y,button,touch,presses)
    if not game.state['running'] then
        if button == 1 then
            if game.state["menu"] then
                for index in pairs(buttons.menu) do
                    buttons.menu[index]:pressed(x,y, mouse.radius)
                end 
            elseif game.state["ended"] then
                for index in pairs(buttons.ended) do
                    buttons.ended[index]:pressed(x,y, mouse.radius)
                end 
            end
        end
    end
end

local font = {
    kis = {
        font = love.graphics.newFont(8),
        size = 8
    },
    kozep = {
        font = love.graphics.newFont(16),
        size = 16
    },
    gomb = {
        font = love.graphics.newFont(24),
        size = 24
    },
    nagy = {
        font = love.graphics.newFont(30),
        size = 30
    },
    cim = {
        font = love.graphics.newFont(60),
        size = 60
    }
}

function love.load()
    love.window.setFullscreen(true)
    love.window.setTitle("CS2 Nagy Projekt")
    buttons.menu.play = button("Start", nil, nil, 150, 40)
    buttons.menu.continue = button("Continue", nil, nil, 150, 40)
    buttons.menu.setting = button("Settings",nil, nil, 150, 40)
    buttons.menu.exit = button("Exit",love.event.quit, nil, 100, 40)
end

function love.update(dt)
    mouse.x, mouse.y = love.mouse.getPosition()
end

function love.draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    if game.state["menu"] then
        love.graphics.printf("Játék címe",font.cim.font,0,100,love.graphics.getWidth(), "center")
        love.graphics.setFont(font.gomb.font)
        buttons.menu.play:draw(screenWidth/2 - buttons.menu.play.width/2, 200, 10, 10)
        buttons.menu.continue:draw(screenWidth/2 - buttons.menu.continue.width/2, 270, 10, 10)
        buttons.menu.setting:draw(screenWidth/2 - buttons.menu.setting.width/2, 340, 10, 10)
        buttons.menu.exit:draw(screenWidth - buttons.menu.exit.width - 20, screenHeight - buttons.menu.exit.height - 20, 10, 10)

        love.graphics.setFont(font.kozep.font)
    end
--debug
love.graphics.printf("FPS:"..love.timer.getFPS().." Platform: "..love.system.getOS(), font.kis.font,10,love.graphics.getHeight()-30,love.graphics.getWidth())
end