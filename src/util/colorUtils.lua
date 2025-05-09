local colorMap = {
    grey = {64, 64, 64},
    gold = {256, 256, 0},
    green = {20, 100, 20},
    hRed = {256, 10, 10},
    black = {0, 0, 0},
    black1 = {20, 20, 20},
    white = {256, 256, 256},

}

function SetColor(colorName, ...)
    local colorVal = colorMap[colorName]
    local args = {...}
    local colorOffset = 0

    if #args == 1 then
        colorOffset = args[1] / 256
    end

    local red = colorVal[1] / 256

    local green = colorVal[2] / 256
    local blue = colorVal[3] / 256

    red = applyColorOffset(red, colorOffset)

    green = applyColorOffset(green, colorOffset)
    blue = applyColorOffset(blue, colorOffset)

    if colorVal then
        love.graphics.setColor(red, green, blue)
    end
end

function applyColorOffset(orig, offset)
    local newVal = orig + offset
    if newVal > 1 then
        return 1
    end
    if newVal < 0 then
        return 0
    end
    return newVal
end
