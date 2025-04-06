Coin = {} 

function Coin:new(x,y,val)
    local obj = {
        x = x, 
        y = y,
        val = val, 
        size = val * 10,
        collected = false,
        destroy = false,
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end 

function Coin:collect()
    -- mark coin for removal 
    self.collected = true
end 

function Coin:update(dt)
    if self.collected == true then
        if self.size > 0 then
            self.size = self.size - 1;
        else
            self.destroy = true
        end
    end
end

function Coin:draw()
    SetColor("gold")
    love.graphics.circle("fill", self.x, self.y, self.size, self.size)
    ResetColor()
end

return Coin