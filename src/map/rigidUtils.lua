
-- Rigid structure will be a table consisting of 4 values 
--  {topLimit, rightLimit, bottomLimit, leftLimit}

function generateRigidListFromSmartTileMap(smartTileMap)
    log:info("Generating Rigid List from the smart Tile Map")
    local rigidList = {}

    local tileMap = smartTileMap.map 
    local furnitureMap = smartTileMap.furnitureMap

    for i, row in pairs(tileMap) do 
        for j, tile in pairs(row) do
            if isTileIdRigid(tile.id) then
                table.insert(rigidList, tile:generateRigidRect())
            end
        end 
    end

    -- for i, furniture in pairs(furnitureMap) do 
        
    -- end

    return rigidList
end