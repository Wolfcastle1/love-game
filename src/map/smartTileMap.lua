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

function RenderSmartTileMap(map, currentX, currentY, focusX, focusY)

    for rowIndex, row in ipairs(map) do
        for colIndex, col in ipairs(row) do
            local selectedTile = map[rowIndex][colIndex]
            Render(selectedTile)
        end
    end

    log:trace("focusX ", focusX)
    log:trace("focusY ", focusY)


    -- render selected tile
    local currentTile = map[currentY][currentX]
    local focusTile = map[focusY][focusX]
    Render(Tile:new(currentTile.type, currentTile.xi, currentTile.yi, true))
    Render(Tile:new(focusTile.type, focusTile.xi, focusTile.yi, false))
end

function ParseFurnitureMap(numMap)
    return "test"
end

return SmartTileMap