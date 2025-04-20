Metal = {} 

function Metal:new(amount location)
    local obj = Resource:new("Metal", amount, location)

    obj.size = amount

    setMetatable(obj, self)
    self.__index = self
    return obj
end

function Metal:draw()
    if location then
        SetColor("gold")
        love.graphics.circle("fill", self.location.x, self.location.y, self.size, self.size)
        love.graphics.circle("fill", self.location.x+2, self.location.y+2, self.size, self.size)
        ResetColor()
    end
end