Phones = setmetatable({}, {__index = Prop})
Phones.__index = Phones

local phoneImages = {
    buildImage("phone_1"),
    buildImage("phone_2"),
    buildImage("phone_3"),
    buildImage("phone_4"),
    buildImage("phone_5"),
    buildImage("phone_6")
}

function Phones:new(location, num)
    local obj = Prop:new("Phones", location, 0, phoneImages[num])
    setmetatable(obj, self)
    return obj
end
