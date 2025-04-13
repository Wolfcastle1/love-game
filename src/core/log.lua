log = {}

-- 0 error 
-- 1 warn 
-- 2 info 
-- 3 debug 
-- 4 trace

function log:new(level)

    local obj = { level = level }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function log:error(...)  
    if self.level >= 0 then 
        print("\27[31mERROR\27[0m: ", ...)
    end
end

function log:warn(...)  
    if self.level >= 1 then 
        print("\27[33mWARN\27[0m: ", ...)
    end
end

function log:info(...)
    if self.level >= 2 then 
        print("INFO: ", ...)
    end
end

function log:debug(...)  
    if self.level >= 3 then 
        print("DEBUG: ", ...)
    end
end

function log:trace(...)  
    if self.level >= 4 then 
        print("TRACE: ", ...)
    end
end