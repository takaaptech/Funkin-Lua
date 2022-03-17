local titlestate = { }

function titlestate.load()
  music = lovebpm.newTrack()
    :load("assets/music/freakyMenu.ogg")
    :setBPM(102)
    :setLooping(true)
  logo = love.graphics.newImage('assets/images/logoBumpin.png')  
  local g = anim8.newGrid(938, 703, logo:getWidth(), logo:getHeight())
  animation = anim8.newAnimation(g('1-14',1), 0.1)
end

function titlestate.update(dt)
    animation:update(dt)
    music:update()
    music:play()
end

function titlestate.draw()
    animate:draw(logo, 100, 100)
end
return titlestate