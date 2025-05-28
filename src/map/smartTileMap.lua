SmartTileMap = {}

function SmartTileMap:new(tMap, fmap, iMap, player)
    local obj = {
        map = TransformNumberMap(tMap, generateTile),
        furnitureMap = TransformNumberMap(fmap, generateFurniture),
        itemMap = TransformNumberMap(iMap, generateItem),
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
    Render2Dother(self.itemMap)
end

function TransformNumberMap(numMap, transformationFunction)
    local map = {}
    for y = 1, #numMap do
        map[y] = {}  -- Create a new row
        for x = 1, #numMap[y] do
            map[y][x] = transformationFunction(numMap[y][x], Location.new(x - 1, y - 1))
        end
    end
    return map
end

function ParseTileMap(numMap)

    local tileMap = {}

    for y = 1, #numMap do
        tileMap[y] = {}  -- Create a new row
        for x = 1, #numMap[y] do

            tileMap[y][x] = Tile:new(numMap[y][x], x - 1, y - 1)

        end
    end

    return tileMap

end

function RenderSmartTileMap(map, currentX, currentY, focusX, focusY)

    Render2D(map)

    log:trace("focusX ", focusX)
    log:trace("focusY ", focusY)


    -- render selected tile
    local currentTile = map[currentY][currentX]
    local focusTile = map[focusY][focusX]
    Render(Tile:new(-1, currentTile.xi, currentTile.yi, true))
    Render(Tile:new(-1, focusTile.xi, focusTile.yi, false))
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

function generateRigidVal(val)
    return TILE_TYPE_RIGID_MAP[val]
end

function RenderRigidTileMap(rMap)
    for rowIndex, row in ipairs(rMap) do
        for colIndex, val in ipairs(row) do
            if val and DevToolsEnabled() then
                Render(Tile:new(-2, colIndex-1, rowIndex-1))
            end
        end
    end
end

return SmartTileMap