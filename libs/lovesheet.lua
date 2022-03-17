local ls = {}

--need to be able to get texture and quad for love.graphics.draw call

function ls.LoadSpriteSheet(tex, xml)
    local s = {}
    s.Texture = tex

    --TODO: Since this game only has one sprite sheet, I don't need todo much else here.
    --But, later(never) add support for multiple sheets.
    ls.Sheet = s

    local data = xml
    local sheetWidth = nil
    local sheetHeight = nil
    for line in data:gmatch("([^\n]*)\n?") do
        if string.find(line, "<sprite") ~= nil then
            local name = ls.getProperty(line, "n")
            s[name] = love.graphics.newQuad(tonumber(ls.getProperty(line, "x")), tonumber(ls.getProperty(line, "y")), tonumber(ls.getProperty(line, "w")), tonumber(ls.getProperty(line, "h")), sheetWidth, sheetHeight)
        else
            if string.find(line, "<TextureAtlas") ~= nil then
                sheetWidth = tonumber(ls.getProperty(line, "width"))
                sheetHeight = tonumber(ls.getProperty(line, "height"))
            end
        end
    end

end

function ls.getProperty(line, property)
    local i, nameStart = string.find(line, property .. "=\"")
    i, j = string.find(line, "\"", nameStart + 1)

    return string.sub(line, nameStart + 1, i - 1)
end

function ls.GetDraw(name)
    --return texture and quad ?
    return ls.Sheet.Texture, ls.Sheet[name]
end

return ls