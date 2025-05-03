PiggyBank = setmetatable({}, {__index = Prop})
PiggyBank.__index = PiggyBank

local img = love.graphics.newImage("src/assets/props/bank.png")
img:setFilter("nearest", "nearest")
local scale = TILE_SIZE / img:getWidth()


function PiggyBank:new(location, rotation)
    local obj = Prop:new("PiggyBank")

    obj.location = location
    obj.rotation = rotation

    setmetatable(obj, self)
    return obj
end

function PiggyBank:draw()
    love.graphics.draw(img, self.location.x*TILE_SIZE, self.location.y*TILE_SIZE, math.rad(self:rotationDegree()), scale, scale, 0, 0)
end

