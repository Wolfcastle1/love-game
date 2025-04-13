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

function log:error(message)  
    if self.level >= 0 then 
        print("\27[31mERROR\27[0m: ", message)
    end
end

function log:warn(message)  
    if self.level >= 1 then 
        print("\27[33mWARN\27[0m: ", message)
    end
end

function log:info(message)
    if self.level >= 2 then 
        print("INFO: ", message)
    end
end

function log:debug(message)  
    if self.level >= 3 then 
        print("DEBUG: ", message)
    end
end

function log:trace(message)  
    if self.level >= 4 then 
        print("TRACE: ", message)
    end
end