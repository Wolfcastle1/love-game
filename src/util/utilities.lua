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

function canMakeMovement(rigidRectList, newX, newY)
    -- for each rigid Shape 
    for i, rigidShape in ipairs(rigidRectList) do
        -- Will the player intersect the rectangle
        if doesSubjectIntersectRect(Player:new(newX, newY, 0), rigidShape) then
            return false -- dont allow the movement
        end
    end
    return true -- allow the movement
end

function doesSubjectIntersectRect(subject, rect)
    
    local topBetween = subject:topLimit() > rect[1] and subject:topLimit() < rect[3]
    local bottomBetween = subject:bottomLimit() > rect[1] and subject:bottomLimit() < rect[3]
    
    local rightBetween = subject:rightLimit() > rect[4] and subject:rightLimit() < rect[2]
    local leftBetween = subject:leftLimit() > rect[4] and subject:leftLimit() < rect[2]
    
    if (leftBetween or rightBetween) and (topBetween or bottomBetween) then
        return true
    end
    return false
end

return utilities