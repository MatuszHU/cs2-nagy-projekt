local love = require "love"
local button = require "Button"
function SettingView()
    return {
        pos_x = 0,
        pos_y = 0,

        height = 1000,
        width = 500,

        titleText = "Béállítások more",

        displayed =  false,

        changeDisplay = function(self)
            if self.displayed then
                self.displayed =  false
            else
                self.displayed =  true
            end
            
        end,

        draw = function(self, pos_x, pos_y) 
            self.pos_x = pos_x or self.pos_x
            self.pos_y = pos_y or self.pos_y

            love.graphics.setColor(0.97, 0.89, 0.64, 1)
            love.graphics.rectangle("fill", self.pos_x, self.pos_y, self.width, self.height, 18, 18)
            love.graphics.setColor(0.77, 0.61, 0.19, 1) 
            love.graphics.setLineWidth(4)
            love.graphics.rectangle("line", self.pos_x, self.pos_y, self.width, self.height, 18, 18)

            love.graphics.setColor(0.3,0.2,0.15,1)
            local tw = love.graphics.getFont():getWidth(self.titleText)
            local th = love.graphics.getFont():getHeight()
            love.graphics.print(self.titleText, self.pos_x + (self.width-tw)/2, self.pos_y + th)

            love.graphics.setColor(1, 1, 1, 1)
        end
    }

end

return SettingView