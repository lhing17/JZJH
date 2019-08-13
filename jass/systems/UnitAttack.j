//===========================================================
//被动技能范围伤害
//attacker = 攻击者
//attacker = 被攻击者
//spell_id = 技能ID
//range    = 技能范围
//damage   = 伤害值
//effects  = 特效
//possibility = 概率
//mana_cost = 蓝耗
//===========================================================
globals

endglobals


function UnitAttack_Conditions takes nothing returns boolean
	local unit u = GetAttacker()
	local unit ut = GetTriggerUnit()
	local player p = GetOwningPlayer(u)
	local integer i = 1 + GetPlayerId(p)
	local location loc = GetUnitLoc(u)
	local location loc2 = GetUnitLoc(ut)
	local location temp_loc = null
	local group g = null
	local integer j = 0
	local integer k = 0
	local real x = 0
	local real y = 0
	local unit dummy = null




	call RemoveLocation(loc)
	call RemoveLocation(loc2)
	set u = null
	set ut = null
	set loc = null
	set loc2 = null
	set p = null
	set dummy = null
	return false
endfunction


function UnitAttack takes nothing returns nothing
	local trigger t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(t,Condition(function UnitAttack_Conditions))
	set t = null
endfunction