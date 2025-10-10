local love = require "love"
local button = require "Button"
function SettingView()
    return {

        windowState = {
            fullscreen = true,
            windowed = false,
            borderless = false
        },

        pos_x = 0,
        pos_y = 0,

        height = 1000,
        width = 500,

        titleText = "Beállítások",

        displayed = false,
        
        --Menu buttons
        buttons = {
            windowMode = {},
            devSettings = {},
            sound = {}
        },
        changeWindowMode = function (self, state)
            self.windowState["fullscreen"] = state == "fullscreen"
            self.windowState["windowed"] = state == "windowed"
            self.windowState["borderless"] = state == "borderless"

            if self.windowState["fullscreen"] then
                love.window.setMode(1000, 600, {fullscreen = true, borderless = false, centered = true})
            elseif self.windowState["windowed"] then
                love.window.setMode(1000, 600, {fullscreen = false, borderless = false, centered = true})
            else 
                love.window.setMode(1000, 600, {fullscreen = true, borderless = true, centered = true})
            end
        end,
    
        changeDisplay = function(self)
            if self.displayed then
                self.displayed =  false
            else
                self.displayed =  true
            end
            
        end,

        loadButtons = function (self)
            self.buttons.windowMode["fullscreen"] = button("Fullscreen",function() self:changeWindowMode("fullscreen") end, nil, 150, 50)
            self.buttons.windowMode["windowed"] = button("Windowed", function() self:changeWindowMode("windowed") end, nil, 150, 50)
            self.buttons.windowMode["borderless"] = button("Borderless",function() self:changeWindowMode("borderless") end, nil, 150, 50)
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

            self.buttons.windowMode["fullscreen"]:texturedDraw(50,75)
            self.buttons.windowMode["windowed"]:texturedDraw(50,150)
            self.buttons.windowMode["borderless"]:texturedDraw(50,225)

            love.graphics.setColor(1, 1, 1, 1)

            
        end
    }

end

return SettingView