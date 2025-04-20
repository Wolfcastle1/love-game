Item = {}

function Item:new(type, location)
    local obj = {
        type = type,
        location = location
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Item:pickup()
    self.location = nil
end