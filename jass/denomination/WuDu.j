globals
    constant integer QIAN_ZHU_SHOU = 'A0BL' // 千蛛手
    constant integer YIN_XIE_SHU = 'A0DU' // 引蝎术
    constant integer YU_SHE_SHU = 'A0DT' // 驭蛇奇术
    constant integer BU_TIAN_JING = 'A0DS' // 补天心经
    constant integer WAN_CHU_SHI_XIN = 'A0DR' // 万蜍噬心

    constant integer SHUANG_SHOU = 'A07U' // 双手互搏
    constant integer KUI_HUA = 'A07W' // 葵花宝典
    constant integer HUA_GU = 'A06L' // 化骨绵掌
    constant integer XI_XING = 'A07R' // 吸星大法

    constant integer LONG_XIANG = 'S002' // 龙象般若功
    constant integer XIAO_WU_XIANG = 'A083' // 小无相功

    constant integer POISONED_BUFF = 'BEsh' // 中毒buff
    constant integer DEEP_POISONED_BUFF = 'B01J' // 深度中毒buff

    constant integer ITEM_SHE_ZHANG = 'I09B' // 蛇杖物品
    constant integer ITEM_HAN_SHA = 'IIII' // 含沙射影
endglobals


/*
 * 技能：千蛛手
 * 技能效果：被动攻击触发，造成AOE伤害
 * 技能伤害：w1 = 16, w2 = 20
 * 升重速度：900
 * 技能搭配：
 *  经脉 > 20：对AOE伤害的目标50%几率造成中毒
 *  福缘 > 20：被动攻击时几率召唤毒蛛，与AOE几率单独结算 
 *      毒蛛攻击w1 = 64, w2 = 78，攻击时几率造成中毒/深度中毒
 *  + 双手：福缘>20时召唤毒蛛数量加倍
 *  特殊攻击 >= 10：伤害+(70 + 3 * 特攻)%
 *  + 葵花：伤害+80%
 *  FIXME 更换特效模型
 */
// 千蛛手的蜘蛛
function qianZhuZhu takes nothing returns nothing
	local player p = GetOwningPlayer(GetAttacker())
	local integer i = 1 + GetPlayerId(p)
	local unit u = udg_hero[i]
	local unit uc = GetTriggerUnit()
	local real shanghai = 0.
	local real shxishu = 1. //初始伤害系数

    if special_attack[i] >= 10 then
        set shxishu = shxishu + 0.7 + 0.3 * special_attack[i]
    endif
    if GetUnitAbilityLevel(u, KUI_HUA)>=1 then
        set shxishu = shxishu + 0.8
    endif

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

    // 特攻伤害加成
    if special_attack[i] >= 10 then
        set shxishu = shxishu + 0.7 + 0.3 * special_attack[i]
    endif
    // 葵花伤害加成
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

/*
 * 技能：引蝎术
 * 技能效果：主动释放，召唤毒蝎进行攻击
 * 技能伤害：w1 = 16, w2 = 20
 * 升重速度：900
 * 技能搭配：
 *  经脉 > 20：对AOE伤害的目标50%几率造成中毒
 *  福缘 > 20：被动攻击时几率召唤毒蛛，与AOE几率单独结算 
 *      毒蛛攻击w1 = 64, w2 = 78，攻击时几率造成中毒/深度中毒
 *  + 双手：福缘>20时召唤毒蛛数量加倍
 *  特殊攻击 >= 10：伤害+(70 + 3 * 特攻)%
 *  + 葵花：伤害+80%
 *  FIXME 更换特效模型
 */
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

/*
 * 技能：驭蛇奇术
 * 技能效果：被动攻击触发，造成单体伤害
 * 技能伤害：w1 = 30, w2 = 160
 * 升重速度：600
 * 技能搭配：
 *  被攻击单位中毒：引发毒爆AOE伤害：w1 = 16, w2 = 80
 *  + 蛇杖：伤害 + 200%
 *  + 化骨绵掌：破防
 *  + 葵花：虚弱
 */
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
    local real range = 600
    local group g = null

    // 1. 造成单体伤害
    if GetRandomInt(1, 100) <= fuyuan[i] / 5 + 15 then

        // 5. 蛇杖效果 伤害+200%，毒爆伤害也+200%伤害
        if UnitHaveItem(u, ITEM_SHE_ZHANG) then
            set shxishu = shxishu + 2
        endif
        set damage = ShangHaiGongShi(u, ut, 30, 160, shxishu, YU_SHE_SHU)
        call WuGongShangHai(u, ut, damage)
        // 3. 技能搭配 + 化骨：破防 
        if GetUnitAbilityLevel(u, HUA_GU)>=1 then
            call WanBuff(u, ut, 9)
        endif
        // 4. 技能搭配 + 葵花：虚弱
        if GetUnitAbilityLevel(u, KUI_HUA)>=1 then
            call WanBuff(u, ut, 16)
        endif

        // 2. 如果目标有中毒/深度中毒BUFF，造成毒爆

        if UnitHasBuffBJ(ut, POISONED_BUFF) or UnitHasBuffBJ(ut, DEEP_POISONED_BUFF) then
            if UnitHasBuffBJ(ut, DEEP_POISONED_BUFF) then
                set range = 900
            endif
            set g = CreateGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(ut), GetUnitY(ut), range, Condition(function qianZhuShouCondition))
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

/*
 * 技能：补天心经
 * 技能效果：使用后可以增加气血值或真实伤害，但是有一定概率直接死亡
 * 升重速度：60
 * 技能CD：60秒
 * 技能搭配：
 *  + 葵花：增加量翻倍，死亡概率翻倍
 *  + 小无相：不会死亡
 *  + 吸星大法：使用后10秒内大幅提升攻速
 *  + 龙象般若功：CD减半
 */
// 补天心经
function buTianJing takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local integer level = GetUnitAbilityLevel(u, BU_TIAN_JING)
    local integer lifeBase = 500
    local integer realDamageBase = 10
    local integer deathPossibility = 15 - level

    call WuGongShengChong(u, BU_TIAN_JING, 60.)

    // 搭配 +葵花 提升增加量，但同时提升死亡概率
    if GetUnitAbilityLevel(u, KUI_HUA)>=1 then
        set lifeBase = lifeBase * 2
        set deathPossibility = deathPossibility * 2
    endif 

    // 搭配 +小无相 不会死亡
    if GetUnitAbilityLevel(u, XIAO_WU_XIANG)>=1 then
        set deathPossibility = 0
    endif 

    // 搭配 +吸星大法 10秒之内提升攻速
    if GetUnitAbilityLevel(u, XI_XING)>=1 then
        call maJiaUseLeveldAbilityAtTargetLoc(u, 'e000',  'A08F', 4, $D0085, u, 3)
    endif 

    // 搭配 +龙象般若功 CD减半
    if GetUnitAbilityLevel(u, LONG_XIANG) >= 1 then
        call EXSetAbilityState(EXGetUnitAbility(u, BU_TIAN_JING), 1, EXGetAbilityState(EXGetUnitAbility(u, BU_TIAN_JING), 1) / 2)
    endif
    
    if GetRandomInt(1, 100) <= 50 then
        call LifeChange(u, 1, lifeBase * level, 'A0DQ')
    else
        call ModifyHeroStat(2, u, 0, realDamageBase * level)
    endif


    // 一定概率死亡
    if GetRandomInt(1, 100) <= deathPossibility then
        call KillUnit(u)
    endif

    set u = null
endfunction

/*
 * 技能：万蜍噬心
 * 技能效果：向周围1200码内敌人掷出数枚暗器毒蛤，造成当前血量百分比伤害，并使其深度中毒
 * 公式：23 + 0.3 * 等级
 * 升重速度：120
 * 技能CD：20秒
 * 技能搭配：
 *  + 双手：暗器数量加倍
 *  + 含沙射影：暗器数量加倍
 *  + 葵花：增加百分比伤害
 *  + 小无相：CD减半
 */
function wanChuCondition takes nothing returns boolean
    return DamageFilter(LoadUnitHandle(YDHT, GetHandleId(GetExpiredTimer()), 0), GetFilterUnit())
endfunction

function wanChuAction takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local unit u = LoadUnitHandle(YDHT, GetHandleId(t), 0)
    local player p = GetOwningPlayer(u)
    local integer j = LoadInteger(YDHT, GetHandleId(t), 1)
    local integer jmax = 4
    local group g = null
    local unit target = null
    local unit dummy = null
    if GetUnitAbilityLevel(u, SHUANG_SHOU)>=1 then
        set jmax = jmax * 2
    endif
    if UnitHaveItem(u, ITEM_HAN_SHA) then
        set jmax = jmax * 2
    endif
    if j < jmax then 
        set g = CreateGroup()
        call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 1200, Condition(function wanChuCondition))
        set target = GroupPickRandomUnit(g)
        set dummy = CreateUnit(p, 'e000', GetUnitX(u), GetUnitY(u), bj_UNIT_FACING)
        call ShowUnitHide(dummy)
        call UnitAddAbility(dummy, 'A0DK')
        call IssueTargetOrderById( dummy, $D007F, target )
        call UnitApplyTimedLife(dummy,'BHwe', 3)
        call DestroyGroup(g)
        call SaveInteger(YDHT, GetHandleId(t), 1, j + 1)
    else
        call FlushChildHashtable(YDHT, GetHandleId(t))
        call PauseTimer(t)
        call DestroyTimer(t)
    endif

    set g = null
    set target = null
    set dummy = null
    set t = null
    set u = null
    set p = null
endfunction

// 万蜍噬心
function wanChuShiXin takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local timer t = CreateTimer()
    call WuGongShengChong(u, WAN_CHU_SHI_XIN, 120.)

    // 搭配 +小无相 CD减半
    if GetUnitAbilityLevel(u, XIAO_WU_XIANG) >= 1 then
        call EXSetAbilityState(EXGetUnitAbility(u, WAN_CHU_SHI_XIN), 1, EXGetAbilityState(EXGetUnitAbility(u, WAN_CHU_SHI_XIN), 1) / 2)
    endif

    call SaveUnitHandle(YDHT, GetHandleId(t), 0, u)
    call TimerStart(t, 0.2, true, function wanChuAction)
    set u = null
endfunction


function wanChuEffect takes nothing returns nothing
    local unit u = udg_hero[1 + GetPlayerId(GetOwningPlayer(GetEventDamageSource()))]
    local unit target = GetTriggerUnit()
    // 葵花搭配：增加百分比伤害
    local real coeff = 0.77 - 0.03 * GetUnitAbilityLevel(u, WAN_CHU_SHI_XIN) * (1 + GetUnitAbilityLevel(u, KUI_HUA))

    call SetUnitState(target, UNIT_STATE_LIFE, GetUnitState(target, UNIT_STATE_LIFE) * coeff)
    call WanBuff(u, target, 14)

    set u = null
    set target = null
endfunction