local utils = require "src.utils"

local sprite = {}

-- default data
local Sprite = {
    image = nil,
    batch = nil,
    xmlData = nil,
    animations = {},

    curAnim = {
        name = '',
        quads = {},
        length = 0,
        framerate = 24,
        loop = false,
        finished = false
    },
    safeFrame = 1,
    curTime = 0
}
Sprite.__index = Sprite

function Sprite:update(dt)
    local rate = self.curAnim.framerate / 60

    self.curTime = self.curTime + dt
    if self.curTime >= rate then
        self.curTime = self.curTime - rate
    end
end

function Sprite:draw(x, y, r, sx, sy, ox, oy, kx, ky)
    local spriteNum = math.floor(self.curTime / (self.curAnim.framerate / 60) * #self.curAnim.quads) + 1
    if (not self.curAnim.loop and self.curAnim.finished) or self.curAnim.quads[spriteNum] == nil then
        spriteNum = self.safeFrame
    end

    love.graphics.draw(self.image, self.curAnim.quads[spriteNum], x, y, r, sx, sy, ox, oy, kx, ky)

    if not self.curAnim.loop and spriteNum == self.curAnim.length then
        self.curAnim.finished = true
    end

    self.safeFrame = spriteNum
end

function Sprite:addAnim(name, prefix, framerate, loop)
    if framerate == nil then
        framerate = 24
    end
    if loop == nil then
        loop = false
    end

    local totalAnims = utils.tablelength(self.xmlData)

    for i = 1, totalAnims do
        local data = self.xmlData[i]
        local lePrefix = string.sub(data["@name"], 1, -6)

        if lePrefix == prefix then
            local quads = {}
            local length = 0

            for i = 1, totalAnims do
                local data = self.xmlData[i]
                if string.starts(data["@name"], lePrefix) then
                    -- local trimmed = data["@frameX"] ~= nil
                    -- local rotated = data["@rotated"] ~= nil and data["@rotated"] == "true"

                    -- local kx = 0
                    -- local ky = 0
                    -- if trimmed then
                    --     kx = data["@frameX"]
                    --     ky = data["@frameY"]
                    -- end

                    table.insert(quads, love.graphics
                        .newQuad(data["@x"], data["@y"], data["@width"], data["@height"], self.image:getDimensions()))
                    length = length + 1
                end
            end

            self.animations[name] = {
                name = name,
                quads = quads,
                length = length,
                framerate = framerate,
                loop = loop
            }

            break
        end
    end
end

function Sprite:playAnim(anim)
    self.curAnim = self.animations[anim]
    self.curAnim.finished = false
    self.safeFrame = 1
end

function sprite.newSprite(image, xml)
    local self = {}
    setmetatable(self, Sprite)

    self.image = image
    self.batch = love.graphics.newSpriteBatch(image)
    self.xmlData = utils.parseAtlas(xml)

    return self
end

return sprite
