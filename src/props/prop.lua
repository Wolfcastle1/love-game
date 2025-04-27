Prop = {} 

function Prop:new(type, location, rotation)
    local obj = {
        type = type,
        location = location,
        rotation = rotation 
        -- rotation is a float representing rotation clockwise: 0 - "north", 1 - "east", 2 - "south", 3 - "west"
        --      It will have decimal granularity with 3.5 being "north west", 1.5 - "south east" etc. 
        --      Value will wrap around after 4, rotation % 4
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Prop:rotationDegree()
    return math.fmod(self.rotation, 4) * 90 
end



