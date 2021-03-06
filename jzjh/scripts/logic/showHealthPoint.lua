---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2019/4/28 0028 23:32
---


--- 超过100万血量的单位，当选中时提示血量，可以输入qxts取消血量的提示，kqts再次开启提示
function showHealthPoint()
    for i = 1, 5 do
        et.player[i].showHint = true
    end

    --- @param u unit
    --- @param p player
    et.game:event '单位-被选中'(function(self, u, p)
        if u:get_max_life() > 999999 and p.showHint then
            p:send_message(('单位%s|r的血量为%s / %s'):format(u:get_name(), u:get_life(), u:get_max_life()))
        end
        if u.shield_percent and p.showHint then
            p:send_message(('单位%s|r的护盾百分比为%s%%'):format(u:get_name(), u.shield_percent))
        end
    end)

    et.game:event '玩家-聊天' (function(self, p, s)
        if s == 'qxts' then
            p:send_message('|cffffff00取消血量提示')
            p.showHint = false
        end
        if s == 'kqts' then
            p:send_message('|cffffff00开启血量提示')
            p.showHint = true
        end
    end)
end
