local titlestate = { }

function titlestate.load()
-- logo png
    logo = love.graphics.newImage("assets/images/logoBumpin.png")
    frames = {}
    local width = logo:getWidth()
    local height = logo:getHeight()

    local frame_width = 939
    local frame_height = 703
    local maxFrames = 6
    --i know these are unoptimized as FUCK but this is the title screen, deal with it.
    table.insert(frames, love.graphics.newQuad(0, 0, frame_width, frame_height, width, height))
    table.insert(frames, love.graphics.newQuad(904, 0, frame_width, frame_height, width, height))
    table.insert(frames, love.graphics.newQuad(0, 713, frame_width, frame_height, width, height))
    table.insert(frames, love.graphics.newQuad(921, 713, frame_width, frame_height, width, height))
    table.insert(frames, love.graphics.newQuad(921, 713, frame_width, frame_height, width, height))
    table.insert(frames, love.graphics.newQuad(921, 713, frame_width, frame_height, width, height)) 
   
    currentFrame= 1
-- end of the logo thingy
    bg = love.graphics.newImage("assets/bg.png")
    noise = love.graphics.newImage("assets/noise.png")
    pepis = love.graphics.newImage("assets/peppinis.png")
  music = lovebpm.newTrack()
    :load("loop.ogg")
    :setBPM(127)
    :setLooping(true)
end

function titlestate.update(dt)
    currentFrame = currentFrame + 10 * dt
    if currentFrame >= 6 then 
        currentFrame = 1
    end
    if not source:isPlaying() then
        love.audio.play(source)
    end
end

function titlestate.draw()
    love.graphics.print('Test sucessful!', 400, 300)
    love.graphics.draw(noise, 300, 200)
    love.graphics.draw(pepis, 600, 100)
    love.graphics.draw(logo, frames[math.floor(currentFrame)], 300, 200)
end
return titlestate