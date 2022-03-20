local titlestate = {}

function titlestate.load()
    gf = utils.makeSprite("gfDanceTitle")
    gf:addAnim("idle", "gfDance")
    gf:playAnim("idle")

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
    gf:update(dt)
    logo:update(dt)
    titleText:update(dt)

    music:update()
end

function titlestate.draw()
    gf:draw(512, 40)
    logo:draw(-100, -50)
    titleText:draw(100, 576)
end

return titlestate
