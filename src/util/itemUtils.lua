function DoesPlayerCollectItem(player, item)
    local coinCollectBuffer = 20
    return IsCircularCollide(player.x, player.y, player.size, item.location.x, item.location.y, item.size, coinCollectBuffer)
end

function DetectItemCollections(player, items)
    for i, item in ipairs(items) do 
        if DoesPlayerCollectItem(player, item) then
            item:collect()
        end
    end
end

function DestroyItems(items) 
    for i, item in ipairs(items) do
        if item.destroy == true then
            log:debug("Removing ", item.type, " from map...")
            table.remove(items, i)
            -- item:remove()
        end
    end
end