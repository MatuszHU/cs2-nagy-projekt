local love = require "love"

local gameState = {
    STARTUP = "STARTUP",
    MENU = "MENU",
    DIFFSELECT = "DIFFSELECT",
    PAUSED = "PAUSED",
    RUNNING = "RUNNING",
    ENDGAME = "ENDGAME"
}

return gameState