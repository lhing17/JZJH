
function townPortal takes nothing returns nothing
    local integer i = 1 + GetPlayerId(DzGetTriggerKeyPlayer())
    call BJDebugMsg("松开了H键")
    call SetUnitPosition(udg_hero[i],-1174,-678)
    call PanCameraToTimedForPlayer(DzGetTriggerKeyPlayer(),-1174,-678,0)
endfunction

function BlizzardEventSystem takes nothing returns nothing
    //local trigger t = CreateTrigger()
    //call BJDebugMsg("加载暴雪事件系统")
    //call DzTriggerRegisterKeyEvent(t, 'G', 1, true, "townPortal")
    //set t = null
endfunction

