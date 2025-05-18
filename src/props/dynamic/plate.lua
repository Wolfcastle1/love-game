Plate = setmetatable({}, {__index = Prop})
Plate.__index = Plate 

function Plate:new(location, size) 
    local obj = Prop:new("Plate", location, 0, size .."__plate")
    setmetatable(obj, self)
    return obj 
end