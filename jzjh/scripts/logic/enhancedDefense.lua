---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2019/5/3 0003 9:05
---

local jass = require 'jass.common'
local japi = require 'jass.japi'
local g = require 'jass.globals'
local slk = require 'jass.slk'

local attackers = {
    'ugho', 'uskm', 'nowe', 'nano', 'nchr', 'ngst', 'uban',
    'njg1', 'otbr', 'nwld', 'nftt', 'edcm', 'hdhw', 'ndrh',
    'umtw', 'nrdk', 'nfrb', 'otbk', 'nzom', 'okod', 'ndqt',
    'ndrv', 'nfgl', 'echm', 'ntrt', 'nltl', 'espv', 'ninf',
}

local bosses = { 'ncer', 'nhea', 'nlkl', 'nele', 'nenp', 'nbda', 'n002', 'nbds', }

et.game:event '玩家-聊天'(function(self, p, s)
    if g.udg_isTest[p:get() - 1] and s == 'showJapi' then
        for k, v in pairs(japi) do
            log.debug(k, v)
        end
    end
    if g.udg_isTest[p:get() - 1] and s == 'maxDiff' then
        g.udg_nandu = 6
        g.udg_boshu = 15
        p:send_message('难度已经设置为7')
    end
end)

--- @param r rect 区域，即全图
--- @param u unit 进入区域的单位
GLOBALS.MAP_AREA:event '单位-进入区域'(function(r, u)
    if g.udg_nandu == 6 then
        if base.is_include(u:get_type_id(), attackers) then
            -- 加强防御
            -- 设置增加的防御值为5*波数的平方
            u:add_bonus('armor', g.udg_boshu * g.udg_boshu * 5)
        end
        if base.is_include(u:get_type_id(), bosses) and not u.shield then
            u.shield = et.effect.add_to_unit("war3mapImported\\DefensiveBarrierBig.mdx", u, 'chest')
            u.shield_percent = 100
        end
    end
end)

--- @param source unit
--- @param target unit
--- @param damage number
et.game:event '单位-受到伤害' (function(self, source, target, damage)
    if target.shield_percent and target.shield_percent > 0 then
        local boss_index = math.floor((g.udg_boshu - 1) / 4) + 1
        local loss = 2 ^ (math.log(damage, 10)) * 100 / (2 ^ (10 + boss_index))
        target.shield_percent = target.shield_percent - loss
        japi.EXSetEventDamage(0)
    end
    if target.shield_percent and target.shield_percent <= 0 then
        target.shield:destroy()
    end
end)