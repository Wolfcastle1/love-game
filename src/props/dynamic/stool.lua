Stool = setmetatable({}, {__index = Prop})
Stool.__index = Stool


function Stool:new(location) 
    local obj = Prop:new("Stool", location, 0, "stool")
    setmetatable(obj, self)
    return obj
end