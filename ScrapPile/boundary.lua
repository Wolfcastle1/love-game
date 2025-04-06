Boundary = {}

-- Determines a Rectangular boundary 
    -- marks an area on the screen marked for a reason

function Boundary:new(xMin, xMax, yMin, yMax)
    local obj = {
        xMin = xMin,
        xMax = xMax,
        yMin = yMin,
        yMax = yMax
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Boundary:draw()
    love.graphics.rectangle("line", self.xMin, self.yMin, self.xMax - self.xMin, self.yMax - self.yMin)
end

function Boundary:contains(x, y)
    return (x >= self.xMin and x <= self.xMax and y >= self.yMin and y <= self.yMax)
end

return Boundary