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
        {1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }
end

function generateTile(num, loc)
    return Tile:new(num, loc.x, loc.y)
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




