local love = require "love"

function SpriteManager()
    local spriteCache = {}

    return {
        path = "",
        image = nil,
        quads = {},
        sheetWidth = 0,
        sheetHeight = 0,
        cols = 3,
        rows = 2,
        sheet = nil,
        selectedIndex = 1,
        offsetX = 0,
        x = 0,
        y = 0,
        loadSprite = function(self, race, class, selectedIndex, offsetX)
            self.offsetX = offsetX or self.offsetX
            self.selectedIndex = selectedIndex or self.selectedIndex
            if class == nil or class == "" then
                self.path = string.format("assets/%ss.png", race)
            else
                self.path = string.format("assets/%s/%s.png", race, class)
            end

            if not spriteCache[self.path] then
                self.image = love.graphics.newImage(self.path)
                self.sheetWidth = self.image:getWidth()
                self.sheetHeight = self.image:getHeight()

                local quadWidth = self.sheetWidth / self.cols
                local quadHeight = self.sheetHeight / self.rows

                self.quads = {}

                for row = 1, self.rows do
                    for col = 1, self.cols do
                        local index = (row - 1) * self.cols + col
                        self.quads[index] = love.graphics.newQuad(
                            (col - 1) * quadWidth + offsetX,
                            (row - 1) * quadHeight,
                            quadWidth,
                            quadHeight,
                            self.sheetWidth,
                            self.sheetHeight
                        )
                    end
                end

                spriteCache[self.path] = {
                    image = self.image,
                    quads = self.quads
                }
            end

            self.sheet = spriteCache[self.path]
            self.selectedIndex = math.max(1, math.min(#self.quads, selectedIndex or 1))
        end,
        draw = function(self, sprite, x, y)
            self.x = x or self.x
            self.y = y or self.y
            local scale = 0.2

            if sprite and sprite.image and sprite.quads and sprite.quads[self.selectedIndex] then
                love.graphics.draw(sprite.image, sprite.quads[self.selectedIndex], self.x, self.y, 0, scale, scale)
            else
                love.graphics.print("No sprite!", x, y)
            end
        end
    }
end

return SpriteManager
