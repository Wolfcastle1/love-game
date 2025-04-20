Metal = {} 

function Metal:new(amount, location)
    local obj = Resource:new("Metal", amount, location)

    obj.size = amount

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Metal:draw()


    log:trace("Metal Location: ", Location.toString(self.location))
    if self.location then
        local coinOffset = 4

        log:trace("Printing Metal Item:")
        SetColor("gold")
        love.graphics.circle("fill", self.location.x, self.location.y, self.size, self.size)
        SetColor("black")
        love.graphics.circle("line", self.location.x, self.location.y, self.size, self.size)
        SetColor("gold")
        love.graphics.circle("fill", self.location.x+coinOffset, self.location.y+coinOffset, self.size, self.size)
        SetColor("black")
        love.graphics.circle("line", self.location.x+coinOffset, self.location.y+coinOffset, self.size, self.size)
        SetColor("gold")
        love.graphics.circle("fill", self.location.x-coinOffset, self.location.y+coinOffset, self.size, self.size)
        SetColor("black")
        love.graphics.circle("line", self.location.x-coinOffset, self.location.y+coinOffset, self.size, self.size)
        ResetColor()
    end
end