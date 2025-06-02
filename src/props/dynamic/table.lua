Table = setmetatable({}, {__index = Prop})
Table.__index = Table

local woodTableImage = buildImage("wood__table")

function Table:new(location) 
    local obj = Prop:new("Table", location, 0, woodTableImage)
    setmetatable(obj, self)
    return obj
end