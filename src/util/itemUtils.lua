function DoesPlayerCollectItem(player, item)
    local collectBuffer = 20
    return  (not item.collected) and IsCircularCollide(player.x, player.y, player.size, item.location.x, item.location.y, item.size, collectBuffer)
end

function DetectItemCollections(player, items)
    for i, item in ipairs(items) do 
        if DoesPlayerCollectItem(player, item) then
            item:collect()
            log:debug("Player had ", player.gold, " gold")
            player.gold = player.gold + 1
            log:debug("Player has ", player.gold, " gold now")
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