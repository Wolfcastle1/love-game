Resource = {}

-- Resource represents a type of item with no limit on amount
    -- used as crafting-material / currency

function Resource:new(name, amount) 
    local obj = Item:new("Resource")

    obj.name = name
    obj.amount = amount

    setmetatable(obj, self)
    self.__index = self 
    return obj
end 

function Resource:changeAmount(val)
    self.amount = self.amount + val
end