local love = require "love"
local button = require "enums.button"
local Button = require "Button"
local ui = require "util.ui"
local ilm = require "enums.inLineMode"
local button = require "enums.button"

uiHandler = ui()

function DifficultySelectorView()
    return {
        difficulties = {
            easy = 1,
            medium = 2,
            hard = 3
        },

        -- Kép
        bg = love.graphics.newImage("assets/difficultySelectorCrop.png"),

        pos_x = 0,
        pos_y = 0,

        width = love.graphics.getWidth()/3,
        height = love.graphics.getHeight()/(3*4),

        titleText = "Nehézség kiválasztása",

        displayed = false,

        selected = nil,

        buttons = {
            easy = nil,
            medium = nil,
            hard = nil
        },

        setDifficulty = function (self, diff)
            self.selected = diff
            
        end,

        changeDisplay = function(self)
            self.displayed = not self.displayed
        end,

        loadButtons = function(self)
            self.buttons.easy = Button("Easy", function() self:setDifficulty(self.difficulties.easy) end, nil, 105, 36)
            self.buttons.medium = Button("Medium", function() self:setDifficulty(self.difficulties.medium) end, nil, 105, 36)
            self.buttons.hard = Button("Hard", function() self:setDifficulty(self.difficulties.hard) end, nil, 105, 36)
        end,

        draw = function(self, pos_x, pos_y)
            self.pos_x = pos_x or self.pos_x
            self.pos_y = pos_y or self.pos_y


            love.graphics.draw(self.bg, 0, 0, 0, love.graphics.getWidth()/self.bg:getWidth(), love.graphics.getHeight()/self.bg:getHeight())
        
           

            
            uiHandler:drawButtonsInLine(
                ilm.EQ_SP,
                100,
                (love.graphics.getHeight()-(love.graphics.getHeight()/10))-(button.DEFAULT_HEIGHT/2),
                love.graphics.getWidth()-100,
                button.DEFAULT_WIDTH, 
                self.buttons.easy,
                self.buttons.medium,
                self.buttons.hard
            )

            love.graphics.setColor(1, 1, 1, 1)
        end
    }
end

return DifficultySelectorView
