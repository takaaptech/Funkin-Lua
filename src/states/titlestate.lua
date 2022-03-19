local utils = require "src.utils"
local sprite = require "src.sprite";

local titlestate = {}

function titlestate.load()
    music = lovebpm.newTrack():load("assets/music/freakyMenu.ogg"):setBPM(102):setLooping(true)

    logo = sprite.newSprite(love.graphics.newImage("assets/images/logoBumpin.png"),
        xml:ParseXmlText(utils.readFile("assets/images/logoBumpin.xml")))
    logo:addAnim("bump", "logo bumpin instance ", 24, true)
    logo:playAnim("bump")
end

function titlestate.update(dt)
    logo:update(dt)

    music:update()
    music:play()
end

function titlestate.draw()
    logo:draw(-100, -50)
end

return titlestate
