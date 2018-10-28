love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib/;")
debug = false

function love.load()
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
    if key == "f1" then
        debug = not debug
    elseif key == "escape" then
        love.event.quit()
    elseif key == "space" then
        love.event.quit('restart')
    end
end


--https://www.redblobgames.com/grids/hexagons/implementation.html

--https://www.redblobgames.com/grids/hexagons/