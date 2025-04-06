Item = {}

function Item:new(type)
    local obj = {
        type = type
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
