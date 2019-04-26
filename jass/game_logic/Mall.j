// 网易商城相关的逻辑

globals
    integer array tiezhang_flag
    integer array talent_flag
    string PROPERTY_TALENT = "AR98FE7J3P" // 天赋的道具
    string PROPERTY_DENOMINATION = "A198FYU9ME" // 解锁铁掌帮的道具
endglobals

function checkPurchase takes nothing returns nothing
    local integer i = 1
    loop
        exitwhen i > 5
        if DzAPI_Map_HasMallItem(Player(i-1), PROPERTY_TALENT) then
            set talent_flag[i] = 1
        endif
        if DzAPI_Map_HasMallItem(Player(i-1), PROPERTY_DENOMINATION) then
            set tiezhang_flag[i] = 1
        endif
        set i = i + 1
    endloop
endfunction


function mallInit takes nothing returns nothing
    local timer t = CreateTimer()
    local integer i = 1
    loop
        exitwhen i > 5
        set tiezhang_flag[i] = 0
        set talent_flag[i] = 0
        set i = i + 1
    endloop

    call TimerStart(t, 1, true, function checkPurchase)
    set t = null
endfunction