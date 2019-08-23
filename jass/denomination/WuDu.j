globals
    constant integer QIAN_ZHU_SHOU = 'A0BL' // 千蛛手
    constant integer YIN_XIE_SHU = 'A0DU' // 引蝎术
    constant integer YU_SHE_SHU = 'A0DT' // 驭蛇奇术
    constant integer BU_TIAN_JING = 'A0DS' // 补天心经
    constant integer WAN_CHU_SHI_XIN = 'A0DR' // 万蜍噬心

    constant integer SHUANG_SHOU = 'A07U' // 双手互搏
    constant integer KUI_HUA = 'A07W' // 葵花宝典

    constant integer POISONED_BUFF = 'BEsh' // 中毒buff
    constant integer DEEP_POISONED_BUFF = 'B01J' // 深度中毒buff

    constant integer ITEM_SHE_ZHANG = 'I09B' // 蛇杖物品
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
    set temp = CreateUnit(p, 'n00Z', x, y, 270)
    call zw(temp, u, 1, 250, 1000, 1500, 75)

    set temp = null
    set u = null
endfunction

// 驭蛇术引发毒爆
function yuSheShuExplosion takes nothing returns nothing
    local unit uc = GetEnumUnit()
	local unit u = GetAttacker()
	local integer i = 1 + GetPlayerId(GetOwningPlayer(u))
	local real shxishu=1.
	local real shanghai=0.

    // 蛇杖效果 毒爆伤害+200%
    if UnitHaveItem(u, ITEM_SHE_ZHANG) then
        set shxishu = shxishu + 2
    endif

	set shanghai=ShangHaiGongShi(u, uc, 16., 80.,shxishu, YU_SHE_SHU)
    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Demon\\RainOfFire\\RainOfFireTarget.mdl", uc, "overhead"))
	call WuGongShangHai(u,uc,shanghai)

	set u=null
    set uc=null
endfunction


// 驭蛇奇术
function yuSheShu takes nothing returns nothing
    local unit u = GetAttacker()
    local unit ut = GetTriggerUnit()
    local player p = GetOwningPlayer(u)
    local integer i = 1 + GetPlayerId(p)
    local real shxishu = 1.
    local real damage = 1.
    local group g = null

    // 1. 造成单体伤害
    if GetRandomInt(1, 100) <= fuyuan[i] / 5 + 15 then

        // 5. 蛇杖效果 伤害+200%，毒爆伤害也+200%伤害
        if UnitHaveItem(u, ITEM_SHE_ZHANG) then
            set shxishu = shxishu + 2
        endif
        set damage = ShangHaiGongShi(u, ut, 30, 160, shxishu, YU_SHE_SHU)
        call WuGongShangHai(u, ut, damage)
        // 3. 技能搭配 破防

        // 4. 技能搭配 降特防


        // 2. 如果目标有中毒/深度中毒BUFF，造成毒爆

        if UnitHasBuffBJ(ut, POISONED_BUFF) or UnitHasBuffBJ(ut, DEEP_POISONED_BUFF) then
            set g = CreateGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(ut), GetUnitY(ut), 600, Condition(function qianZhuShouCondition))
            call ForGroup(g, function yuSheShuExplosion)
            call DestroyGroup(g)
        endif

        // 6. 武功升重
        call WuGongShengChong(u, YU_SHE_SHU, 600.)
    endif

    set g = null
    set u = null
    set ut = null
endfunction

// 补天心经
function buTianJing takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local integer level = GetUnitAbilityLevel(u, BU_TIAN_JING)
    local integer lifeBase = 500
    local integer realDamageBase = 10
    local integer deathPossibility = 10 - level

    call WuGongShengChong(u, BU_TIAN_JING, 60.)
    if GetRandomInt(1, 100) <= 50 then
        call LifeChange(u, 1, lifeBase * level, 'A0DQ')
    else
        call ModifyHeroStat(2, u, 0, realDamageBase * level)
    endif

    // 搭配 提升增加量，但同时提升死亡概率

    // 搭配绝内 不会死亡

    // 搭配 短期之内提升攻速

    // 一定概率死亡
    if GetRandomInt(1, 100) <= deathPossibility then
        call KillUnit(u)
    endif

    set u = null
endfunction

function wanChuCondition takes nothing returns boolean
    return DamageFilter(GetTriggerUnit(), GetFilterUnit())
endfunction

// 万蜍噬心
function wanChuShiXin takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local player p = GetOwningPlayer(u)
    local integer j = 1
    local integer jmax = 4
    local group g = null
    local unit target = null
    local unit dummy = null
    call WuGongShengChong(u, WAN_CHU_SHI_XIN, 120.)
    loop
        exitwhen j > jmax
        set g = CreateGroup()
        call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 1200, Condition(function wanChuCondition))
        set target = GroupPickRandomUnit(g)
        set dummy = CreateUnit(p, 'e000', GetUnitX(u), GetUnitY(u), bj_UNIT_FACING)
        call ShowUnitHide(dummy)
        call UnitAddAbility(dummy, 'A0DK')
        call IssueTargetOrderById( dummy, $D007F, target )
        call UnitApplyTimedLife(dummy,'BHwe', 3)
        call DestroyGroup(g)
        call BJDebugMsg("执没执行啊兄弟")
        call PolledWait(0.2)
        call BJDebugMsg("执没执行啊兄弟2")
        set j = j + 1
    endloop
    set g = null
    set target = null
    set dummy = null
    set u = null
endfunction


function wanChuEffect takes nothing returns nothing
    local unit u = udg_hero[1 + GetPlayerId(GetOwningPlayer(GetEventDamageSource()))]
    local unit target = GetTriggerUnit()
    local real coeff = 0.77 - 0.03 * GetUnitAbilityLevel(u, WAN_CHU_SHI_XIN)

    call BJDebugMsg(I2S(R2I(GetUnitState(target,UNIT_STATE_MAX_LIFE) * coeff)))
    call LifeChange(target, 2, R2I(GetUnitState(target,UNIT_STATE_MAX_LIFE) * coeff), 'A0DQ')
    call WanBuff(u, target, 13)

    set u = null
    set target = null
endfunction