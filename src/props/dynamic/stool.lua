Stool = setmetatable({}, {__index = Prop})
Stool.__index = Stool

local stoolImage = buildImage("stool")

function Stool:new(location) 
    local obj = Prop:new("Stool", location, 0, stoolImage)
    setmetatable(obj, self)
    return obj
end