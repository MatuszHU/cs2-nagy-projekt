local love = require "love"
local button = require "button"
local button = require "enums/button"
local ilm = require "enum/inLineMode"

function uiUtil()
    return {
        drawButtonsInLine = function(self, mode, start_x, start_y, displayWidth, b_height, ...)
           
            local buttons = {...}
            local mode = mode or ilm.EQ_SP --equalSpace, stretch
            local maxWidth = displayWidth or love.graphics.getWidth()
            local height = b_height or button.DEFAULT_HEIGHT
            local width = b_width or button.DEFAULT_WIDTH
            local gaps = #buttons - 1
            local start_x = start_x or 0
            local start_y = start_y or 0
            if (button.DEFAULT_WIDTH * #buttons) > maxWidth then
                self:drawButtonsInLine(mode,start_x,start_y, width-15, height, buttons)
            end
            
        end
    }
end

return uiUtil