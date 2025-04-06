local utilities = {}

function utilities.moveObject(obj, direction, speed, dt)
    if direction == "up" then
        obj.y = obj.y - speed * dt
    elseif direction == "down" then
        obj.y = obj.y + speed * dt
    elseif direction == "left" then
        obj.x = obj.x - speed * dt
    elseif direction == "right" then
        obj.x = obj.x + speed * dt
    end
end 

function IsCircularCollide(x1, y1, r1, x2, y2, r2, buffer)
    local dx = x2 - x1
    local dy = y2 - y1
    local distance = math.sqrt(dx^2 + dy^2)


    return distance < r1 + r2 + buffer
end

function DoesPlayerCollectCoin(player, coin)
    local coinCollectBuffer = 20
    return IsCircularCollide(player.x, player.y, player.size, coin.x, coin.y, coin.size, coinCollectBuffer)
end

function DetectCoinCollections(player, coins)
    for i, coin in ipairs(coins) do 
        if DoesPlayerCollectCoin(player, coin) then
            coin:collect()
        end
    end
end

function DestroyCoins(coins)
    for i, coin in ipairs(coins) do
        if coin.destroy == true then
            table.remove(coins, i)
            print("Removed Coin: x-" .. coin.x .. " y-" .. coin.y)
        end
    end
end

function ResetColor() 
    love.graphics.setColor(1,1,1)
end

function SetBackground(color)
    if color == "blue" then
        love.graphics.setBackgroundColor(0/255, 70/255, 140/255)
    end
end

function MoveX(object, dx)
        object.x = object.x + dx
end

function MoveY(object, dy)
        object.y = object.y + dy
end

function CloneTable(referenceTable, defaultValue)
    local newTable = {}
    for row = 1, #referenceTable do
        newTable[row] = {}
        for col = 1, #referenceTable[row] do
            newTable[row][col] = defaultValue or 0
        end
    end
    return newTable
end

function DevToolsEnabled()
    return (DEV_TOOLS_ENABLED and love.keyboard.isDown("l"))
end

function ShowRectEdges(rigidRect, color)
    SetColor(color)
    local signalSize = 5
    love.graphics.circle("fill", rigidRect:leftLimit(), rigidRect:topLimit(), signalSize)
    love.graphics.circle("fill", rigidRect:rightLimit(), rigidRect:topLimit(), signalSize)
    love.graphics.circle("fill", rigidRect:leftLimit(), rigidRect:bottomLimit(), signalSize)
    love.graphics.circle("fill", rigidRect:rightLimit(), rigidRect:bottomLimit(), signalSize)

    ResetColor()
end

function canMakeMovement(rigidTileMap, newX, newY)

    -- loop through all tiles in rigidMap
    for i, row in ipairs(rigidTileMap) do
        for j, val in ipairs(row) do

            -- is the tile rigid? Will the player intersect it?
            if val and willSubjectIntersectTile(Tile:new(0, j-1, i-1), Player:new(newX, newY, 0)) then
                -- print("hit")
                return false -- dont allow the movement
            end

        end
    end

    -- print("ur good")
    return true -- allow the movement

end

function willSubjectIntersectTile(tile, subject)
    local leftBetween = subject:leftLimit() > tile:leftLimit() and subject:leftLimit() < tile:rightLimit()
    local rightBetween = subject:rightLimit() > tile:leftLimit() and subject:rightLimit() < tile:rightLimit()
    local topBetween = subject:topLimit() > tile:topLimit() and subject:topLimit() < tile:bottomLimit()
    local bottomBetween = subject:bottomLimit() > tile:topLimit() and subject:bottomLimit() < tile:bottomLimit()

    if (leftBetween or rightBetween) and (topBetween or bottomBetween) then
        return true
    end
    return false
end

return utilities