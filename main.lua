io.stdout:setvbuf("no")
local titlestate = require("src.titlestate")
lovebpm = require("libs.lovebpm")
json = require ("libs.dkjson")
anim8 = require("libs.anim8")

function love.load()
    titlestate.load()
end

function love.update(dt)
    titlestate.update(dt)
end

function love.draw()
    titlestate.draw()
end