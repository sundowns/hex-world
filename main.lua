love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib/;")
debug = false

local world = {}

function love.load()
    --Libraries
    Class = require("lib.class")
    Vector = require("lib.vector")
    Util = require("lib.util")
    constants = require("constants")

    --Classes
    require("class.hex")
    require("class.hexgrid")
    require("class.world")

    world = World(10, 10) 
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
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