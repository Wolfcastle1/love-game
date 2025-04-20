Resource = setmetatable({}, { __index = Item })  -- Inherit from Item
Resource.__index = Resource

-- Resource represents a type of item with no limit on amount
    -- used as crafting-material / currency

function Resource:new(name, amount, location) 
    local obj = Item:new("Resource")

    obj.name = name
    obj.amount = amount
    obj.location = location

    setmetatable(obj, self)
    return obj
end 

function Resource:changeAmount(val)
    self.amount = self.amount + val
end