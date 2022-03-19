local titlestate = {}

function titlestate.load()
    logo = utils.makeSprite("logoBumpin")
    logo:addAnim("bump", "logo bumpin instance ", 24, false)

    titleText = utils.makeSprite("titleEnter")
    titleText:addAnim("idle", "Press Enter to Begin")
    titleText:addAnim("press", "ENTER PRESSED")
    titleText:playAnim("idle")

    music = lovebpm.newTrack():load("assets/music/freakyMenu.ogg"):setBPM(102):setLooping(true):on("beat", function(n)
        logo:playAnim("bump")
    end):play()
end

function titlestate.update(dt)
    logo:update(dt)
    titleText:update(dt)

    music:update()
end

function titlestate.draw()
    logo:draw(-100, -50)
    titleText:draw(100, 576)
end

return titlestate
