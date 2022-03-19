local utils = {}

function utils.tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

function utils.readFile(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function utils.parseAtlas(xml)
    local anims = {}
    local texList = xml.TextureAtlas.SubTexture
    for i = 1, utils.tablelength(texList) do
        table.insert(anims, texList[i])
    end
    return anims
end

function utils.makeSprite(path)
    path = "assets/images/" .. path
    return sprite.newSprite(love.graphics.newImage(path .. ".png"), xml:ParseXmlText(utils.readFile(path .. ".xml")))
end

return utils
