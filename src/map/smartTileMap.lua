SmartTileMap = {}

function SmartTileMap:new(numMap)
    local obj = {

    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ParseBasicTileMap(numMap)

    local tileMap = {}

    for y = 1, #numMap do
        tileMap[y] = {}  -- Create a new row
        for x = 1, #numMap[y] do

            tileMap[y][x] = Tile:new(TileNumberToType(numMap[y][x]), x - 1, y - 1)

        end
    end

    return tileMap

end

function RenderSmartTileMap(map, ...)

    local args = {...}


    for rowIndex, row in ipairs(map) do
        for colIndex, col in ipairs(row) do
            local selectedTile = map[rowIndex][colIndex]
            if #args == 2 then
                if colIndex == args[1] and rowIndex == args[2] then
                    Render(Tile:new(selectedTile.type, selectedTile.xi, selectedTile.yi, true))
                end
            end
            Render(selectedTile)
        end
    end

    -- render selected tile
    if #args == 2 then
        local specialTile = map[args[2]][args[1]]
        Render(Tile:new(specialTile.type, specialTile.xi, specialTile.yi, true))
    end
end

return SmartTileMap