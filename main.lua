require("src/entities/player")

require("src/gui/button")

require("src/util/actions")
require("src/util/utilities")
require("src/util/colorUtils")
require("src/util/itemUtils")
Location = require("src/util/location")

require("src/map/tile")
require("src/map/tileMaps")
require("src/map/smartTileMap")

require("src/items/item")
require("src/items/resources/resource")
require("src/items/resources/gold")

require("src/props/prop")
require("src/props/dynamic/piggyBank")

require("src/core/log")

log = log:new(3)

local player
local piggyBank
local resources

DEV_TOOLS_ENABLED = true
local PLAYER_SPEED = 150

local startingMap = Office()
local rigidMap
local currentMap

function love.load()

    log:error("ENABLED")
    log:warn("ENABLED")
    log:info("ENABLED")
    log:debug("ENABLED")
    log:trace("ENABLED")

    love.window.setTitle("Sam's Sandbox")

    currentMap = ParseBasicTileMap(startingMap) -- creates a 2D array of Tiles

    rigidMap = EvaluateRigidTileMap(startingMap)

    SetBackground("blue")


    player = Player:new(150, 150, PLAYER_SPEED)
    piggyBank = PiggyBank:new(Location.new(100, 100), 90)

    resources = { 
        Gold:new(10, Location.new(300,300)), 
    }

end


function love.update(dt)

    -- player obj
    player:update(dt, rigidMap)


    if #resources < 1 then 
        table.insert(resources, Gold:new(10, Location.new(500,500)))
    end
    

    for i, resource in ipairs(resources) do
        resource:update(dt)
    end

    DetectItemCollections(player, resources)
    DestroyItems(resources)

end


function love.draw()

    RenderSmartTileMap(currentMap, player:currentTileX(), player:currentTileY())

    DrawHUD()

    -- RenderList(boundaries)
    RenderList(resources)
    RenderRigidTileMap(rigidMap)

    piggyBank:draw()

    player:draw()
end

function RenderList(list)
    for _,obj in ipairs(list) do
        Render(obj)
    end
end

function Render(obj)
    obj:draw()
end

function DrawHUD()
    love.graphics.print("Gold: " .. player.gold, 750, 10)
end 