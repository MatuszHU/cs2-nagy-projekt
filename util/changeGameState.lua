local love = require "love"
local gameState = require "enums.gameState"
local game = "enums.game"

local function changeGameState(state)
    game.STARTUP = state == gameState.STARTUP
    game.MENU = state == gameState.MENU
    game.DIFFSELECT = state == gameState.DIFFSELECT
    game.PAUSED = state == gameState.PAUSED
    game.RUNNING = state == gameState.RUNNING
end

return changeGameState