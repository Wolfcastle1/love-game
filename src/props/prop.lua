Prop = {} 

function Prop:new(type, location, rotation, img)    
    local scale = TILE_SIZE / img:getWidth()

    local obj = {
        type = type,
        location = location,
        rotation = rotation, 
        image = img,
        scale = scale
        
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

function Prop:draw()
    love.graphics.draw(
        self.image, 
        self.location.x*TILE_SIZE + TILE_SIZE/2,
        self.location.y*TILE_SIZE + TILE_SIZE/2, 
        math.rad(self:rotationDegree()), 
        self.scale, self.scale, 
        self.image:getWidth()/2, self.image:getHeight()/2
    )
end

function buildImage(imageName)
    local img = love.graphics.newImage("src/assets/props/".. imageName .. ".png")
    img:setFilter("nearest", "nearest")
    return img
end



