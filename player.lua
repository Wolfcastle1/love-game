Player = {}

-- x, y represents the middle of the player
-- size represents half the width and height
function Player:new(x, y, speed)
    local obj = {x = x,
    y = y,
    speed = speed,
    size = 20,
    dx = 0,
    dy = 0,
    xfacing = "",
    yfacing = "",
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Player:update(dt, rMap)

    local dx = 0
    local dy = 0

    self:currentTileX()
    self:currentTileY()

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
    ResetColor()

    if DevToolsEnabled() then
        SetColor("black")
        love.graphics.rectangle("line", self.x-self.size, self.y-self.size, self.size*2, self.size*2)
        ShowRectEdges(self, "gold")
    end

    local xdrift = 0
    local ydrift = 0
    if self.xfacing == "right" then
        xdrift = self.size/2
    end
    if self.xfacing == "left" then
        xdrift = -self.size/2
    end
    if self.xfacing == "" then
        xdrift = 0
    end
    if self.yfacing == "up" then
        ydrift = -self.size/2
    end
    if self.yfacing == "down" then
        ydrift = self.size/2
    end
    if self.yfacing == "" then
        ydrift = 0
    end


    SetColor("black")
    love.graphics.circle("fill", self.x+xdrift, self.y+ydrift, self.size/4)
    ResetColor()
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
        self.yfacing = "down"
    end
    if dy < 0 then
        self.yfacing = "up"
    end
    if dy == 0 then
        self.yfacing = ""
    end
    if dx > 0 then
        self.xfacing = "right"
    end
    if dx < 0 then
        self.xfacing = "left"
    end
    if dx == 0 then
        self.xfacing = ""
    end
end

function Player:isMoving()
    -- print("dx", self.dx, " / dy:", self.dy)
    if self.dx == 0 and self.dy == 0 then
        return false
    end
    return true
end

-- determines tile location based on x,y coordinates and tileSize
function Player:currentTileX()
    local xTile = math.floor(self.x / TILE_SIZE) + 1
    -- print("Xtile: ", xTile)
    return xTile
end
function Player:currentTileY()
    local yTile = math.floor(self.y / TILE_SIZE) + 1
    -- print("Ytile: ", yTile)
    return yTile
end