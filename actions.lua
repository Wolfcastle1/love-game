
function love.keypressed(key)
    if key == "escape" then
        love.event.quit();
    end
    if key == "r" then
        love.event.quit("restart")
    end
end
