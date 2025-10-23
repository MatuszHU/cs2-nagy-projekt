local love = require "love"
local gameState = require "enums/gameState"

local function changeGameState(state)
    game.state["startUp"] = state == gameState.STARTUP
    game.state["menu"] = state == gameState.MENU
    game.state["diffSelect"] = state == gameState.DIFFSELECT
    game.state["paused"] = state == gameState.PAUSED
    game.state["running"] = state == gameState.RUNNING
end

return changeGameState(state)