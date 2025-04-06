require("player")
local Coin = require("coin")
local Wall = require("wall")
local Actions = require("actions")
local Button = require("gui/button")
require("map/tile")
require("assets/colorUtils")
require("utilities")
require("map/tileMaps")
require("map/smartTileMap")


local player
local coins
local walls
local buttons

DEV_TOOLS_ENABLED = true
local PLAYER_SPEED = 150

local startingMap = Office()
local rigidMap
local currentMap

function love.load()

    love.window.setTitle("Sam's Sandbox")

    currentMap = ParseBasicTileMap(startingMap) -- creates a 2D array of Tiles

    rigidMap = EvaluateRigidTileMap(startingMap)

    SetBackground("blue")


    player = Player:new(150, 150, PLAYER_SPEED)

    coins = {
        Coin:new(200, 200, 3),
        Coin:new(300, 400, 3),
        Coin:new(400, 300, 3),
    }

end


function love.update(dt)

    -- player obj
    player:update(dt, rigidMap)



    -- all coin objs 
    for i, coin in ipairs(coins) do
        coin:update(dt)
    end

    DetectCoinCollections(player, coins)
    DestroyCoins(coins)
end


function love.draw()

    RenderSmartTileMap(currentMap, player:currentTileX(), player:currentTileY())
    -- RenderList(boundaries)
    RenderList(coins)
    -- RenderList(walls)
    -- RenderList(buttons)
    RenderRigidTileMap(rigidMap)
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