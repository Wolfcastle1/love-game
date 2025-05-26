Player = {}

-- x, y represents the middle of the player
-- size represents half the width and height
function Player:new(x, y, speed)
    local obj = {
        x = x,
        y = y,

        speed = speed,
        size = 20,

        dx = 0,
        dy = 0,

        xfacing = 0,
        yfacing = 0,

        gold = 0,

        holding = nil
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Player:update(dt, rMap)

    local dx = 0
    local dy = 0


    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        dx = dx + self.speed*dt
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        dx = dx - self.speed*dt
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        dy = dy - self.speed*dt
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        dy = dy + self.speed*dt
    end

    if canMakeMovement(rMap, self.x+dx, self.y) then
        MoveX(self, dx)
    end

    if canMakeMovement(rMap, self.x, self.y+dy) then
        MoveY(self, dy)
    end

    self.dx = dx
    self.dy = dy
    self:setPlayersDirectionFacing(dx, dy)


end

function Player:draw()
    -- todo what happens when the second size is gone?
    SetColor("white")
    love.graphics.circle("fill", self.x, self.y, self.size)
    SetColor("black")
    love.graphics.circle("line", self.x, self.y, self.size)
    ResetColor()

    if DevToolsEnabled() then
        SetColor("black")
        love.graphics.rectangle("line", self.x-self.size, self.y-self.size, self.size*2, self.size*2)
        ShowRectEdges(self, "gold")
    end

    local xdrift = 0
    local ydrift = 0
    if self.xfacing == 1 then
        xdrift = self.size/2
    end
    if self.xfacing == -1 then
        xdrift = -self.size/2
    end
    if self.xfacing == 0 then
        xdrift = 0
    end
    if self.yfacing == -1 then
        ydrift = -self.size/2
    end
    if self.yfacing == 1 then
        ydrift = self.size/2
    end
    if self.yfacing == 0 then
        ydrift = 0
    end

    SetColor("black")
    love.graphics.circle("fill", self.x+xdrift, self.y+ydrift, self.size/4)
    ResetColor()

    Render(self.holding)
end

local LIMIT_REDUCTION = .7

function Player:leftLimit()
    return self.x - self.size * LIMIT_REDUCTION
end

function Player:rightLimit()
    return self.x + self.size * LIMIT_REDUCTION
end

function Player:topLimit()
    return self.y - self.size * LIMIT_REDUCTION
end

function Player:bottomLimit()
    return self.y + self.size * LIMIT_REDUCTION
end

-- will move a player to a tile indexs
function Player:toTile(xi, yi)
    self.x = xi*TILE_SIZE
    self.y = yi*TILE_SIZE
end

-- will set the direction the player should be facing based on the change in location 
function Player:setPlayersDirectionFacing(dx, dy)

    if not self:isMoving() then
        return
    end

    if dy > 0 then
        self.yfacing = 1
    end
    if dy < 0 then
        self.yfacing = -1
    end
    if dy == 0 then
        self.yfacing = 0
    end
    if dx > 0 then
        self.xfacing = 1
    end
    if dx < 0 then
        self.xfacing = -1
    end
    if dx == 0 then
        self.xfacing = 0
    end
end

function Player:isMoving()
    if self.dx == 0 and self.dy == 0 then
        return false
    end
    return true
end

-- determines tile location based on x,y coordinates and tileSize
function Player:currentTileX()
    local xTile = math.floor(self.x / TILE_SIZE) + 1
    return xTile
end
function Player:currentTileY()
    local yTile = math.floor(self.y / TILE_SIZE) + 1
    return yTile
end

function Player:getFocusX() 
    return self:currentTileX() + self.xfacing; 
end

function Player:getFocusY() 
    return self:currentTileY() + self.yfacing;
end

function Player:canCarry()
    return self.holding == nil
end

function Player:release()
    local item = self.holding
    self.holding = nil
    return item
end