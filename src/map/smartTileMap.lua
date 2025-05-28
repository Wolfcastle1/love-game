SmartTileMap = {}

function SmartTileMap:new(numMap, fmap, player)
    local obj = {
        map = ParseTileMap(numMap),
        furnitureMap = ParseFurnitureMap(fmap),
        -- itemMap = ParseItemMap(),
        -- rigidMap = ParseRigidMap(),
        player = player
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function SmartTileMap:draw() 
    RenderSmartTileMap(self.map, self.player:currentTileX(), self.player:currentTileY(), self.player:getFocusX(), self.player:getFocusY())
    Render(self.furnitureMap[4][9])
    Render2Dother(self.furnitureMap)
end

function ParseTileMap(numMap)

    local tileMap = {}

    for y = 1, #numMap do
        tileMap[y] = {}  -- Create a new row
        for x = 1, #numMap[y] do

            tileMap[y][x] = Tile:new(TileNumberToType(numMap[y][x]), x - 1, y - 1)

        end
    end

    return tileMap

end

function ParseFurnitureMap(numMap)
    local fmap = {} 

    for y = 1, #numMap do
        fmap[y] = {} 
        for x = 1, #numMap[y] do

            fmap[y][x] = generateFurniture(numMap[y][x], Location.new(x - 1, y - 1))
            
        end 
    end
    log:info("row 2,5 ", #fmap[2])
    return fmap
end

function RenderSmartTileMap(map, currentX, currentY, focusX, focusY)

    Render2D(map)

    log:trace("focusX ", focusX)
    log:trace("focusY ", focusY)


    -- render selected tile
    local currentTile = map[currentY][currentX]
    local focusTile = map[focusY][focusX]
    Render(Tile:new(currentTile.type, currentTile.xi, currentTile.yi, true))
    Render(Tile:new(focusTile.type, focusTile.xi, focusTile.yi, false))
end

function Render2D(map)
    for rowIndex, row in ipairs(map) do
        for colIndex, item in ipairs(row) do
            Render(item)
        end
    end
end

function Render2Dother(map)
    -- log:info("Render 2D ", #map)
    for rowIndex, row in pairs(map) do
        -- log:info("Render List row ", #row)
        for colIndex, item in pairs(row) do
            Render(item)
        end
    end
end

return SmartTileMap