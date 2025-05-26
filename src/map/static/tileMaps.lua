function StarterHouse()
 return {
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 0, 1, 1, 0},
    {0, 0, 0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 1, 1, 0, 1, 1, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0},

 }
end

function TestMap()
    return {
        
    }
end

function Office()
    return {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

end


function StarterHouse()
 return {
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 0, 1, 1, 0},
    {0, 0, 0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0, 0, 1, 0},
    {0, 0, 0, 1, 1, 0, 1, 1, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0},

 }
end

function TestMap()
    return {
        
    }
end

function Office()
    return {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

end


function RenderTileMap(map)
    for rowIndex, row in ipairs(map) do
        for colIndex, col in ipairs(row) do
            Render(Tile:new(TileNumberToType(col), colIndex-1, rowIndex-1))
        end
    end
end

function RenderRigidTileMap(rMap)
    for rowIndex, row in ipairs(rMap) do
        for colIndex, val in ipairs(row) do
            if val and DevToolsEnabled() then
                Render(Tile:new("Highlight", colIndex-1, rowIndex-1))
            end
        end
    end
end

function TileNumberToType(num)
    if num == 0 then return "grass" end
    if num == 1 then return "wall" end
end

TILE_TYPE_RIGID_MAP = {
    -- grass
    [0] = false,
    -- wall
    [1] = true
}

function EvaluateRigidTileMap(map)
    local rMap = CloneTable(map, false)
    for rIndex, row in ipairs(map) do
        for cIndex, val in ipairs(row) do
            rMap[rIndex][cIndex] = TILE_TYPE_RIGID_MAP[val]
        end
    end
    return rMap
end


