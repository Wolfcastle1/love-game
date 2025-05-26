require("src/entities/player")

require("src/gui/button")

require("src/util/utilities")
require("src/util/colorUtils")
require("src/util/itemUtils")
Location = require("src/util/location")

require("src/map/tile")
require("src/map/static/tileMaps")
require("src/map/smartTileMap")

require("src/items/item")
require("src/items/resources/resource")
require("src/items/resources/gold")

require("src/props/prop")
require("src/props/dynamic/table")
require("src/props/dynamic/plate")

require("src/core/log")
require("src/core/listeners")

log = log:new(3)

local player
local resources
local props

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

    love.window.setTitle("Sam's Personal Project")

    rigidMap = EvaluateRigidTileMap(startingMap)

    SetBackground("blue")


    player = Player:new(150, 150, PLAYER_SPEED)

    props = {
        Plate:new(Location.new(5,5), "small"),
        Table:new(Location.new(3,3)),
    }

    resources = { 
        Gold:new(10, Location.new(300,300)), 
    }

    currentMap = SmartTileMap:new(startingMap, "", player)
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

    Render(currentMap)

    DrawHUD()

    -- RenderList(boundaries)
    RenderList(resources)
    RenderRigidTileMap(rigidMap)
    RenderList(props)

    player:draw()
end

function RenderList(list)
    for _,obj in ipairs(list) do
        Render(obj)
    end
end

function Render(obj)
    if obj == nil then 
        return 
    end 
    obj:draw()
end

function DrawHUD()
    love.graphics.print("Gold: " .. player.gold, 750, 10)
end 

function actionInput()
    log:info("Perfoming Action: ", player.gold)
end