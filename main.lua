io.stdout:setvbuf("no")
local titlestate = require("src.titlestate")
lovebpm = require("libs.lovebpm")

function love.load()
    titlestate.load()
end

function love.update(dt)
    titlestate.update(dt)
end

function love.draw()
    titlestate.draw()
end