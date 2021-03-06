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
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF公告：|r|cffff00de"+info+"|r")
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF公告：|r|cffff00de"+info+"|r")
            call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS,20,"|CFF00FFFF公告：|r|cffff00de"+info+"|r")
        endif
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r按|CFF00EE00F9|r进入任务面板可查看游戏各个系统|r")
    elseif passed_time == 60 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r选择人物后直接回城（hg）可以选择自由门派|r")
    elseif passed_time == 80 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r基地右侧的NPC|CFF00EE00新手教官|r处查看游戏中的特殊玩法|r")
    	call PingMinimapForForce(bj_FORCE_ALL_PLAYERS, 398, -689, 5)
    elseif passed_time == 120 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r游戏开始2分钟内输入|CFF00EE00sw|r可激活试玩模式，一小时内不刷进攻怪|r")
    elseif passed_time == 160 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r历练是游戏中的主线任务，想快点提升伤害，请抓紧时间历练哦|r")
    elseif passed_time == 180 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r声望是影响历练进度最重要的属性，可以通过号令天下令刷练功房提高声望获取速度|r")
    elseif passed_time == 200 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r前期做|CFF00EE00辽国第一先锋|r任务、击杀|CFF00EE00林朝英|r和|CFF00EE00扫地神僧|r可以获得不错的声望|r")
    elseif passed_time == 220 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r|CFF00EE004个门派技能|r升级到|CFF00EE006重|r后可以获得掌门（唐门六合经为1重，明教乾坤大挪移为4重）|r")
    elseif passed_time == 240 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r搭配某些武功到达特定重数可以获得称号，游戏中有多达|CFF00EE0060多种|r称号（|CFF00EE00新手教官|r处查看）|r")
    elseif passed_time == 280 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r|CFF00EE00称号|r可以大幅提升属性，部分称号还可以使特定武功变强|r")
    elseif passed_time == 320 then
        call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 20, "|CFF00FFFF提示：|r历练5后可以到NPC|CFF00EE00游坦之|r处自创武功")
        call PingMinimapForForce(bj_FORCE_ALL_PLAYERS, -9000, -13169, 5)
    endif
	return false
endfunction




function EverySecond takes nothing returns nothing
	local trigger t = CreateTrigger()

	call TriggerRegisterTimerEventPeriodic(t, 1.)
	call TriggerAddCondition(t,Condition(function EverySecond_Conditions))
	set t = null
endfunction
