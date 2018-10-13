---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by apple.
--- DateTime: 2018/10/14 上午12:51
---

--- @class MainStage : Stage
MainStage = Class("MainStage",Stage)


function MainStage:init()
    self.area = Area(self)
    self.area:addPhysicsWorld()
    self.main_canvas = love.graphics.newCanvas(gw,gh)
    --self.player = self.area:addObject("Player",gw/2,gh/2)
    self.background = assets.graphics.Backgrounds.bg
    local title_font = assets.font.myfont(80)
    self.title = love.graphics.newText(title_font)
    self.title:set({{0,0,0},"武侠与江湖"})
    local menu_font = assets.font.myfont(32)
    self.menu = love.graphics.newText(menu_font)
    self.menu:addf({{1,1,1},"新的回忆"},200,'center',500,500)
    self.menu:addf({{1,1,1},"新的回忆"},200,"center",500,550)
    self.menu:addf({{1,1,1},"新的回忆"},200,"center",500,600)

    --self.text = love.graphics.newText(title_font)
    --self.text.add("武侠与江湖",200,200)
end

function MainStage:update(dt)
    if self.area then self.area:update(dt) end
end

function MainStage:draw()
    love.graphics.setCanvas(self.main_canvas)
    love.graphics.clear()
    camera:attach(0,0,gw,gh)
    --love.graphics.circle("line",gw/2,gh/2,50)
    love.graphics.draw(self.background)
    love.graphics.draw(self.title,gw/4,gh/6)
    love.graphics.draw(self.menu)
    if self.area then self.area:draw() end
    camera:detach()
    love.graphics.setCanvas()

    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode('alpha','premultiplied')
    love.graphics.draw(self.main_canvas,0,0,0,sx,sy)
    love.graphics.setBlendMode('alpha')
end

function MainStage:destroy()
    if self.area then
        self.area:destroy()
        self.area = nil
    end
end

return MainStage