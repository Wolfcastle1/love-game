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

function Item:collect()
    log:debug("Collecting ", self.name)
    self.collected = true
end

function Item:remove()
    self.location = nil
end