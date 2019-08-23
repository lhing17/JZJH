globals
    constant integer QIAN_ZHU_SHOU = 'A0BL' // 千蛛手
    constant integer YIN_XIE_SHU = '' // 引蝎术

    constant integer SHUANG_SHOU = 'A07U' // 双手互搏
    constant integer KUI_HUA = 'A07W' // 葵花宝典
endglobals

// 千蛛手的蜘蛛
function qianZhuZhu takes nothing returns nothing
	local player p = GetOwningPlayer(GetAttacker())
	local integer i = 1 + GetPlayerId(p)
	local unit u = udg_hero[i]
	local unit uc = GetTriggerUnit()
	local real shanghai = 0.
	local real shxishu = 1. //初始伤害系数


	set shanghai = ShangHaiGongShi(u, uc, 64., 78., shxishu, QIAN_ZHU_SHOU)
	call WuGongShangHai(u, uc, shanghai)
	if GetRandomInt(1, 100) <= 50 then
	    call WanBuff(u, uc, 13) // 中毒
	else
	    call WanBuff(u, uc, 14) // 深度中毒
	endif
	set uc = null
	set u = null
	set p = null
endfunction


function qianZhuShouCondition takes nothing returns boolean
	return IsUnitEnemy(GetFilterUnit(),GetOwningPlayer(GetAttacker())) and IsUnitAliveBJ(GetFilterUnit())
endfunction

// 千蛛手的AOE效果
function qianZhuShouAoe takes nothing returns nothing
    local unit uc = GetEnumUnit()
	local unit u = GetAttacker()
	local integer i = 1 + GetPlayerId(GetOwningPlayer(u))
	local real shxishu=1.
	local real shanghai=0.

    if special_attack[i] >= 10 then
        set shxishu = shxishu + 1
    endif
    if GetUnitAbilityLevel(u, KUI_HUA)>=1 then
        set shxishu = shxishu + 0.8
    endif

	set shanghai=ShangHaiGongShi(u, uc, 16., 20.,shxishu, QIAN_ZHU_SHOU)
    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Demon\\RainOfFire\\RainOfFireTarget.mdl", uc, "overhead"))
	call WuGongShangHai(u,uc,shanghai)
    // 经脉达到20中毒
    if jingmai[i] >= 20 and GetRandomInt(1, 100) < 50 then
        call WanBuff(u, uc, 13)
    endif



	set u=null
    set uc=null
endfunction


// 千蛛手：对周围敌人造成少量AOE伤害
// 经脉 > 20：中毒
// 福缘 > 20：几率召唤毒蛛
// 双手：召唤毒蛛数量加倍
// 特殊攻击 > 10：伤害+100%
// 葵花：伤害+80%
function qianZhuShou takes nothing returns nothing
    local unit u = GetAttacker()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	local integer id = 'n00Y'
	local unit temp = null
    local group g=CreateGroup()
    local real r = 500. + 40. * GetUnitAbilityLevel(u, QIAN_ZHU_SHOU)

    if GetRandomInt(1, 100) <= 15 + fuyuan[i] / 5 then
        call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), r, Condition(function qianZhuShouCondition))
        call ForGroup(g, function qianZhuShouAoe)
        call WuGongShengChong(u, QIAN_ZHU_SHOU, 900.)
    endif
    if fuyuan[i] >=20 and GetRandomInt(1, 100) <= 15 + fuyuan[i] / 5 then
        set temp = CreateUnit(p, id, GetUnitX(u), GetUnitY(u), 270)
    	call UnitApplyTimedLifeBJ(3, 'BTLF', temp)
    	if GetUnitAbilityLevel(u, SHUANG_SHOU)>=1 then
    	    set temp = CreateUnit(p, id, GetUnitX(u), GetUnitY(u), 270)
            call UnitApplyTimedLifeBJ(3, 'BTLF', temp)
    	endif
    endif

    call GroupClear(g)
    call DestroyGroup(g)
    set g=null
	set p=null
	set u=null
	set temp = null
endfunction

// 引蝎术
function yinXieShu takes nothing returns nothing
    local unit temp = null
    local unit u = GetTriggerUnit()
    local player p = GetOwningPlayer(u)
    local real x = GetUnitX(u)
    local real y = GetUnitY(u)
    call WuGongShengChong(u, YIN_XIE_SHU, 100)
    set temp = CreateUnit(p, id, x, y, 270)
    call zw(temp, u, 1, 250, 1000, 1500, 75)

    set temp = null
    set u = null
endfunction