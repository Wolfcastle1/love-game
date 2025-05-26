
ACTION_BUTTON = "j"

function love.keypressed(key) 
    if key == ACTION_BUTTON then 
        actionInput()
        return
    end

    if key == "escape" then
        love.event.quit();
        return
    end

    if key == "r" then
        love.event.quit("restart")
        return
    end
end