globals
    integer passed_time = 0 // 游戏时间
endglobals

function EverySecond_Conditions takes nothing returns boolean
    set passed_time = passed_time + 1
    if passed_time == 40 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|cfffff000欢迎来到|cffff00de决战江湖|r")
        // 获取服务器全局存档，信息提示
        set info = DzAPI_Map_GetMapConfig("info")
        if info != "无" then
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r|cffff00de"+info+"|r")
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r|cffff00de"+info+"|r")
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r|cffff00de"+info+"|r")
        endif
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r按|CFF00EE00F9|r进入任务面板可查看游戏各个系统|r")
    elseif passed_time == 80 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r基地右侧的NPC|CFF00EE00新手教官|r处查看游戏中的特殊玩法|r")
    	call PingMinimapForForce(GetPlayersAll(), 398, -689, 3)
    elseif passed_time == 120 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF提示：|r游戏开始2分钟内输入|CFF00EE00sw|r可激活试玩模式，一小时内不刷进攻怪|r")
    elseif passed_time == 160 then
    elseif passed_time == 200 then
    endif
	return false
endfunction




function EverySecond takes nothing returns nothing
	local trigger t = CreateTrigger()

	call TriggerRegisterTimerEventPeriodic(t, 1.)
	call TriggerAddCondition(t,Condition(function EverySecond_Conditions))
	set t = null
endfunction
