Wall = {} 

local thickness = 5

function Wall:new(x, y, h, w, r)
    local obj = {
        x = x,
        y = y,
        h = h,
        w = w,
        r = r
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Wall:update()

end

function Wall:draw()

    love.graphics.push()
    love.graphics.translate(self.x + self.w / 2, self.y + self.h / 2)  -- Move to rectangle center
    love.graphics.rotate(math.rad(self.r))  -- Rotate around new origin
    love.graphics.rectangle("line", -self.w / 2, -self.h / 2, self.w, self.h)  -- Draw centered
    love.graphics.pop()

    -- code to make a rotated rectangle
    -- local x, y = 200, 200  -- Rectangle's top-left corner
    -- local w, h = 100, 50   -- Width and height
    -- local angle = math.rad(45)  -- Convert degrees to radians

    -- love.graphics.push()
    -- love.graphics.translate(x + w / 2, y + h / 2)  -- Move to rectangle center
    -- love.graphics.rotate(angle)  -- Rotate around new origin
    -- love.graphics.rectangle("line", -w / 2, -h / 2, w, h)  -- Draw centered
    -- love.graphics.pop()
end

return Wall