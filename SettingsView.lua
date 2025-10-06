local love = require "love"
local button = require "Button"
function SettingView()
    return {
        pos_x = 0,
        pos_y = 0,
        displayed = false,

        open = function(self)
            self.displayed = true
        end,
        close = function(self)
            self.displayed = false
        end,
        draw = function(self, pos_x, pos_y) 
            if self.displayed then
                self.pos_x = pos_x or self.pos_x
                self.pos_y = pos_y or self.pos_y

                love.graphics.setColor(0.97, 0.89, 0.64, 1)
                love.graphics.rectangle("fill", self.pos_x, self.pos_y, 300, 500, 18, 18)
                love.graphics.setColor(0.77, 0.61, 0.19, 1) 
                love.graphics.setLineWidth(4)
                love.graphics.rectangle("line", self.pos_x, self.pos_y, 300, 500, 18, 18)
            end
        end
    }

end

return SettingView