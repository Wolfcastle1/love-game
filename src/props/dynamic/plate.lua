Plate = setmetatable({}, {__index = Prop})
Plate.__index = Plate 

local plateImages = {
    small = buildImage("small__plate")
}

function Plate:new(location, size) 
    local obj = Prop:new("Plate", location, 0, plateImages[size])
    setmetatable(obj, self)
    return obj 
end