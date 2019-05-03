---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2019/4/30 10:44
---

local g = require 'jass.globals'
--- 清理地图上物品
--- @param p player
--- @param s string
et.game:event '玩家-聊天' (function (self, p, s)
    if s == '-clean' or s == '-clear' then
        if not p.readyToClear then
            p:send_message("|cffff0000请确保地图上没有有用的物品，然后再次输入-clean")
            p.readyToClear = true
        else
            jass.EnumItemsInRect(g.bj_mapInitialPlayableArea, nil, function()
                local it = jass.GetEnumItem()
                jass.RemoveItem(it)
            end)
            p.readyToClear = false
        end
    end
end)