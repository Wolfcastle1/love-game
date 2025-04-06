Button = {} 

local font

function Button:new(text, x, y)
    local obj = {
        text = text,
        x = x,
        y = y,
        padding = 5,
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Button:update(dt)
    
end

function Button:draw()
    font = love.graphics.newFont(20)

    love.graphics.setFont(font)

    local padding = self.padding

    local width = font:getWidth(self.text) + padding * 2
    local height = font:getHeight() + padding * 2

    love.graphics.rectangle("line", self.x, self.y, width, height)
    love.graphics.print(self.text, self.x + padding, self.y + padding)
    love.graphics.setFont(love.graphics.newFont());
end

return Button