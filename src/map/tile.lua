Tile = {}

TILE_SIZE = 50

local tileColorMap = {
    grass = "green",
    wall = "grey",
    Highlight = "hRed",
}

function Tile:new(type, xi, yi, ...)
    local args = {...}
    local subject = false
    if #args == 1 then
        subject = args[1]
    end
    local obj = {
        type = type,
        xi = xi,
        yi = yi, 
        subject = subject
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function Tile:draw()
    SetColor(tileColorMap[self.type])

    love.graphics.rectangle("fill", self.xi*TILE_SIZE, self.yi*TILE_SIZE, TILE_SIZE, TILE_SIZE)

    if self.subject then
        SetColor(tileColorMap[self.type], 100)
        print("Subject Tile: ", self.xi, self.yi )
    end

    ResetColor()

    if self.subject then

        SetColor("black")
        love.graphics.rectangle("line", self.xi*TILE_SIZE, self.yi*TILE_SIZE, TILE_SIZE, TILE_SIZE)
        ResetColor()
    end
end

function Tile:leftLimit()
    return self.xi*TILE_SIZE
end
function Tile:rightLimit()
    return self.xi*TILE_SIZE + TILE_SIZE
end
function Tile:topLimit()
    return self.yi*TILE_SIZE
end
function Tile:bottomLimit()
    return self.yi*TILE_SIZE + TILE_SIZE
end

