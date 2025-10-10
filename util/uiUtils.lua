local love = require "love"
local button = require "button"
local buttonEnum = require "enums/buttonEnum"

function uiUtil()
    return {
        drawButtonsInLine = function(self, mode, displayWidth, b_height, ...)
           
            local buttons = {...}
            local mode = mode or "equalSpace" --equalSpace, stretch
            local maxWidth = displayWidth or love.graphics.getWidth()
            local height = b_height or buttonEnum.DEFAULT_HEIGHT
            local width = b_width or buttonEnum.DEFAULT_WIDTH
            local gaps = #buttons
            if (buttonEnum.DEFAULT_WIDTH * #button) < maxWidth then
                self:drawButtonsInLine(mode, displayWidth-15, height, buttons)
            end
            
        end
    }
end

return uiUtil