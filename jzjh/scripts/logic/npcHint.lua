---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2019/4/26 16:22
---

local suifeng = { name = '新手教官', loc = et.point(438.9, -667.8) }
local fengling1 = { name = '积分商店', loc = et.point(-1451.6, -1346) }
local fengling2 = { name = '道具商城', loc = et.point(-1268.9, -1365.7) }
local cangqiong = { name = '等级奖励', loc = et.point(-1352.2, -182.6) }

local function createHint(tab, adjust)
    local loc = tab.loc + adjust
    et.tag.create(tab.name, loc, 14, 100, 100, 100, 0, 50)
end

local adjust = {-50, 0}
createHint(suifeng, adjust)
createHint(fengling1, adjust)
createHint(fengling2, adjust)
createHint(cangqiong, adjust)