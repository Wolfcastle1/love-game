PiggyBank = setmetatable({}, {__index = Prop})
PiggyBank.__index = PiggyBank


function PiggyBank:new(location, rotation)
    local obj = Prop:new("PiggyBank", location, rotation, "bank")
    setmetatable(obj, self)
    return obj
end



