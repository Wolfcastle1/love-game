PiggyBank = setmetatable({}, {__index = Prop})
PiggyBank.__index = PiggyBank

local img = love.graphics.newImage("src/assets/props/bank.png")

function PiggyBank:new(location, rotation)
    local obj = Prop:new("PiggyBank")

    obj.location = location
    obj.rotation = rotation

    setmetatable(obj, self)
    return obj
end

function PiggyBank:draw()
    love.graphics.rotate(math.rad(self:rotationDegree()))
    love.graphics.draw(img, self.location.x, self.location.y, 0, 10, 10)
    love.graphics.origin()
end

