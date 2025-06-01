Phones = setmetatable({}, {__index = Prop})
Phones.__index = Phones

function Phones:new(location, num)
    local obj = Prop:new("Phones", location, 0, "phone_" .. num)
    setmetatable(obj, self)
    return obj
end
