Tile = {}

local imageArray = {
    [2] = love.graphics.newImage("src/assets/tiles/bwTile.png"), 
    [3] = love.graphics.newImage("src/assets/tiles/dw_floor.png"),
}

for _, img in pairs(imageArray) do 
    img:setFilter("nearest", "nearest")
end

function Tile:new(id, xi, yi, ...)
    local args = {...}
    local debugOnly = false
    
    local pullTileImage

    if #args == 1 then
        debugOnly = args[1]
    end

    local obj = {
        id = id,
        xi = xi,
        yi = yi, 
        debugOnly = debugOnly,
    }
    
    setmetatable(obj, self)
    self.__index = self
    return obj
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


function Tile:draw() 
    local id = self.id 
    local xi = self.xi 
    local yi = self.yi 

    if self.debugOnly and not DevToolsEnabled() then return end -- filter the debugOnly stuff

    if id == -2 then drawColorTile("hRed", xi, yi) return end -- draw highlighted tile
    if id == -1 then drawFocusTile(xi, yi) return end -- focus Tile

    if id == 0 then drawColorTile("green", xi, yi) return end -- grass
    if id == 1 then drawColorTile("grey", xi, yi) return end -- wall
    if id == 2 then drawPngTile(id, xi, yi) return end -- Black and white kitchen tile
    if id == 3 then drawPngTile(id, xi, yi) return end -- dark wood floor tile
end 

function Tile:generateRigidRect()
    local rigidRect = {self:topLimit(), self:rightLimit(), self:bottomLimit(), self:leftLimit()}
    return rigidRect;
end

function drawPngTile(id, xi, yi) 
    local img = imageArray[id]
    local imgWidth = img:getWidth()
    local imgHeight = img:getHeight()
    local scale = TILE_SIZE / imgWidth

    love.graphics.draw(
        img,
        xi*TILE_SIZE + TILE_SIZE/2,
        yi*TILE_SIZE + TILE_SIZE/2,
        0,
        scale, scale,
        imgWidth/2, imgHeight/2
    )
end

function drawFocusTile(xi, yi) -- draw a focus Tile by setting ID to -1 
    SetColor("black")
    love.graphics.rectangle("line", xi*TILE_SIZE, yi*TILE_SIZE, TILE_SIZE, TILE_SIZE)
    ResetColor()
end

function drawColorTile(color, xi, yi)
    SetColor(color)
    love.graphics.rectangle("fill", xi*TILE_SIZE, yi*TILE_SIZE, TILE_SIZE, TILE_SIZE)
    ResetColor()
end

return Tile