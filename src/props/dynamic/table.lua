Table = setmetatable({}, {__index = Prop})
Table.__index = Table

function Table:new(location) 
    local obj = Prop:new("Plate", location, 0, "wood__table")
    setmetatable(obj, self)
    return obj
end