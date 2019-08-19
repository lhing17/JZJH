// 宠物技能

// 悟空：猴子猴孙
function isSunOfMonkey takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BD'
endfunction

function sunOfMonkey takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local player p = GetOwningPlayer(u)
    local integer i = 1
    local integer imax = GetRandomInt(5, 8)
    local unit ut = null
    if GetRandomInt(1, 100) <= 50 then
        set shengwang[1 + GetPlayerId(p)] = shengwang[1 + GetPlayerId(p)] + 100
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|cfffff000玩家" + GetPlayerName(p) + "的悟空发动了|CFF00EE00猴子猴孙|r技能，|CFF00EE00声望|r增加100点|r")
    else
        set shoujiajf[1 + GetPlayerId(p)] = shoujiajf[1 + GetPlayerId(p)] + 100
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|cfffff000玩家" + GetPlayerName(p) + "的悟空发动了|CFF00EE00猴子猴孙|r技能，|CFF00EE00守家积分|r增加100点|r")
    endif
    loop
        exitwhen i > imax
        set ut = CreateUnit(p,'n00X',-768.+GetRandomReal(-100, 100),-768.+GetRandomReal(-100, 100),270.)
        call IssueTargetOrderById( ut, $D0038, udg_ZhengPaiWL)
        set i = i + 1
    endloop
    set u = null
    set p = null
    set ut = null
 // 正派武林所在位置 -768.,-768
endfunction


function initPetSkill takes nothing returns nothing
    local trigger t = CreateTrigger()

    call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(t,Condition(function isSunOfMonkey))
    call TriggerAddAction(t,function sunOfMonkey)

    set t = null
endfunction
