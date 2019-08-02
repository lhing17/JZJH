globals
    Frame array zwidget
    Frame array zbutton
    // UI设置对齐锚点的常量 DzFrameSetPoint achor定义，从0开始
    constant integer TOPLEFT = 0
    constant integer TOP = 1
    constant integer TOPRIGHT = 2
    constant integer LEFT = 3
    constant integer CENTER = 4
    constant integer RIGHT = 5
    constant integer BOTTOMLEFT = 6
    constant integer BOTTOM = 7
    constant integer BOTTOMRIGHT = 8

    //DzFrameSetScript  注册ui事件的事件ID
    constant integer NONE = 0
    constant integer FRAME_EVENT_PRESSED = 1
    constant integer FRAME_MOUSE_ENTER = 2
    constant integer FRAME_MOUSE_LEAVE = 3
    constant integer FRAME_MOUSE_UP = 4
    constant integer FRAME_MOUSE_DOWN = 5
    constant integer FRAME_MOUSE_WHEEL = 6
    constant integer FRAME_FOCUS_ENTER = FRAME_MOUSE_ENTER
    constant integer FRAME_FOCUS_LEAVE = FRAME_MOUSE_LEAVE
    constant integer FRAME_CHECKBOX_CHECKED = 7
    constant integer FRAME_CHECKBOX_UNCHECKED = 8
    constant integer FRAME_EDITBOX_TEXT_CHANGED = 9
    constant integer FRAME_POPUPMENU_ITEM_CHANGE_START = 10
    constant integer FRAME_POPUPMENU_ITEM_CHANGED = 11
    constant integer FRAME_MOUSE_DOUBLECLICK = 12
    constant integer FRAME_SPRITE_ANIM_UPDATE = 13
endglobals

function toggleFuncBoard takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[3].toggle()
    endif
endfunction

function toggleOpenButton takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[1].toggerHover("war3mapImported\\attr0.tga", "war3mapImported\\attr1.tga")
    endif
endfunction

function toggleWidget5 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[5].toggerHover("war3mapImported\\achievement01.tga", "war3mapImported\\achievement02.tga")
    endif
endfunction

function toggleWidget6 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[6].toggerHover("war3mapImported\\achievement01.tga", "war3mapImported\\achievement02.tga")
    endif
endfunction
function toggleWidget7 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[7].toggerHover("war3mapImported\\non_open01.tga", "war3mapImported\\non_open02.tga")
    endif
endfunction
function toggleWidget8 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[8].toggerHover("war3mapImported\\non_open01.tga", "war3mapImported\\non_open02.tga")
    endif
endfunction
function toggleWidget9 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[9].toggerHover("war3mapImported\\non_open01.tga", "war3mapImported\\non_open02.tga")
    endif
endfunction
function toggleWidget10 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[10].toggerHover("war3mapImported\\non_open01.tga", "war3mapImported\\non_open02.tga")
    endif
endfunction
function toggleWidget11 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[11].toggerHover("war3mapImported\\non_open01.tga", "war3mapImported\\non_open02.tga")
    endif
endfunction
function toggleWidget12 takes nothing returns nothing
    if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
        call zwidget[12].toggerHover("war3mapImported\\func0.tga", "war3mapImported\\func1.tga")
    endif
endfunction


function drawUI_Conditions takes nothing returns boolean
    call DzLoadToc("ui\\custom.toc")

    // 创建功能开启按钮背景
    set zwidget[1] = Frame.newImage1(GUI, "war3mapImported\\attr0.tga", 0.04, 0.053)
    call zwidget[1].setPoint(1, Frame.getFrame(DzFrameGetHeroBarButton(3)), 7, 0.0, -0.016)
    call zwidget[1].setAlpha(255)

    // 创建功能介绍
    set zwidget[2]= Frame.newText1(zwidget[1], "功能", "TXA10")
    call zwidget[2].setPoint(4, zwidget[1], 4, 0, 0)
    // 创建功能开启按钮
    set zbutton[1] = Frame.newTextButton(zwidget[1])
    call zbutton[1].setAllPoints(zwidget[1])
    call zbutton[1].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[1].regEvent(FRAME_MOUSE_ENTER, function toggleOpenButton)
    call zbutton[1].regEvent(FRAME_MOUSE_LEAVE, function toggleOpenButton)
    //call DzFrameSetScript(udg_UI_Gn_AN[1], 2, "Trig_GN_JiemianAActions", false)
    //call DzFrameSetScript(udg_UI_Gn_AN[1], 3, "Trig_GN_JiemianBActions", false)
    //call DzFrameSetScript(udg_UI_Gn_AN[1], 1, "Trig_GN_JiemianCActions", false)
    // 功能界面
    set zwidget[3] = Frame.newImage1(GUI, "war3mapImported\\jz01.tga", 0.3, 0.3)
    call zwidget[3].setPoint(4, GUI, 4, 0.0, 0.08)
    call zwidget[3].hide()

    // 关闭按钮贴图
    set zwidget[4] = Frame.newImage1(zwidget[3], "war3mapImported\\close.tga", 0.02, 0.02)
    call zwidget[4].setPoint(4, zwidget[3], 2, - 0.01, - 0.01)

    // 关闭按钮
    set zbutton[2] = Frame.newTextButton(zwidget[4])
    call zbutton[2].setAllPoints(zwidget[4])
    call zbutton[2].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)

    // 任务面板
    set zwidget[5] = Frame.newImage1(zwidget[3], "war3mapImported\\achievement01.tga", 0.04, 0.015)
    call zwidget[5].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.021)

    set zbutton[3] = Frame.newTextButton(zwidget[5])
    call zbutton[3].setAllPoints(zwidget[5])
    call zbutton[3].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[3].regEvent(FRAME_MOUSE_ENTER, function toggleWidget5)
    call zbutton[3].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget5)

    // 地图成就
    set zwidget[6] = Frame.newImage1(zwidget[3], "war3mapImported\\achievement01.tga", 0.04, 0.015)
    call zwidget[6].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.061)

    set zbutton[4] = Frame.newTextButton(zwidget[6])
    call zbutton[4].setAllPoints(zwidget[6])
    call zbutton[4].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[4].regEvent(FRAME_MOUSE_ENTER, function toggleWidget6)
    call zbutton[4].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget6)

    set zwidget[7] = Frame.newImage1(zwidget[3], "war3mapImported\\non_open01.tga", 0.04, 0.015)
    call zwidget[7].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.101)

    set zbutton[5] = Frame.newTextButton(zwidget[7])
    call zbutton[5].setAllPoints(zwidget[7])
    call zbutton[5].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[5].regEvent(FRAME_MOUSE_ENTER, function toggleWidget7)
    call zbutton[5].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget7)

    set zwidget[8] = Frame.newImage1(zwidget[3], "war3mapImported\\non_open01.tga", 0.04, 0.015)
    call zwidget[8].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.141)

    set zbutton[6] = Frame.newTextButton(zwidget[8])
    call zbutton[6].setAllPoints(zwidget[8])
    call zbutton[6].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[6].regEvent(FRAME_MOUSE_ENTER, function toggleWidget8)
    call zbutton[6].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget8)

    set zwidget[9] = Frame.newImage1(zwidget[3], "war3mapImported\\non_open01.tga", 0.04, 0.015)
    call zwidget[9].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.181)

    set zbutton[7] = Frame.newTextButton(zwidget[9])
    call zbutton[7].setAllPoints(zwidget[9])
    call zbutton[7].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[7].regEvent(FRAME_MOUSE_ENTER, function toggleWidget9)
    call zbutton[7].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget9)

    set zwidget[10] = Frame.newImage1(zwidget[3], "war3mapImported\\non_open01.tga", 0.04, 0.015)
    call zwidget[10].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.221)

    set zbutton[8] = Frame.newTextButton(zwidget[10])
    call zbutton[8].setAllPoints(zwidget[10])
    call zbutton[8].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[8].regEvent(FRAME_MOUSE_ENTER, function toggleWidget10)
    call zbutton[8].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget10)

    set zwidget[11] = Frame.newImage1(zwidget[3], "war3mapImported\\non_open01.tga", 0.04, 0.015)
    call zwidget[11].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.035,  -0.261)

    set zbutton[9] = Frame.newTextButton(zwidget[11])
    call zbutton[9].setAllPoints(zwidget[11])
    call zbutton[9].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[9].regEvent(FRAME_MOUSE_ENTER, function toggleWidget11)
    call zbutton[9].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget11)

    // 创建属性开启按钮背景
    set zwidget[12] = Frame.newImage1(GUI, "war3mapImported\\func0.tga", 0.04, 0.053)
    call zwidget[12].setPoint(1, zwidget[1], 7, 0.0, -0.016)
    call zwidget[12].setAlpha(255)

    // 创建属性介绍
    set zwidget[13]= Frame.newText1(zwidget[12], "属性", "TXA10")
    call zwidget[13].setPoint(4, zwidget[12], 4, 0, 0)
    // 创建属性开启按钮
    set zbutton[10] = Frame.newTextButton(zwidget[12])
    call zbutton[10].setAllPoints(zwidget[12])
    call zbutton[10].regEvent(FRAME_EVENT_PRESSED, function toggleFuncBoard)
    call zbutton[10].regEvent(FRAME_MOUSE_ENTER, function toggleWidget12)
    call zbutton[10].regEvent(FRAME_MOUSE_LEAVE, function toggleWidget12)

    set zwidget[1000] = Frame.newText1(zwidget[3], "杀狼任务（5/6）", "TXA15")
    call zwidget[1000].setPoint(TOPLEFT, zwidget[3], TOPLEFT, 0.11, -0.035)
    call zwidget[1000].setColor255(0, 0, 0)

    set zwidget[1001] = Frame.newImage1(zwidget[3], "war3mapImported\\doing.tga", 0.044, 0.033)
    call zwidget[1001].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.235,  -0.027)

    set zwidget[1002] = Frame.newText1(zwidget[3], "狼皮任务（15/10）", "TXA15")
    call zwidget[1002].setPoint(TOPLEFT, zwidget[3], TOPLEFT, 0.11, -0.09)
    call zwidget[1002].setColor255(0, 0, 0)

    set zwidget[1003] = Frame.newImage1(zwidget[3], "war3mapImported\\done.tga", 0.044, 0.033)
    call zwidget[1003].setPoint(TOPLEFT, zwidget[3], TOPLEFT,  0.235,  -0.082)

    set zwidget[1004] = Frame.newText1(zwidget[3], "狼皮任务（15/10）", "TXA15")
    call zwidget[1004].setPoint(TOPLEFT, zwidget[3], TOPLEFT, 0.11, -0.145)
    call zwidget[1004].setColor255(0, 0, 0)

    set zwidget[1006] = Frame.newText1(zwidget[3], "狼皮任务（15/10）", "TXA15")
    call zwidget[1006].setPoint(TOPLEFT, zwidget[3], TOPLEFT, 0.11, -0.2)
    call zwidget[1006].setColor255(0, 0, 0)

    set zwidget[1008] = Frame.newText1(zwidget[3], "狼皮任务（15/10）", "TXA15")
    call zwidget[1008].setPoint(TOPLEFT, zwidget[3], TOPLEFT, 0.11, -0.255)
    call zwidget[1008].setColor255(0, 0, 0)

    return false
endfunction


function initUI takes nothing returns nothing
    local trigger t = CreateTrigger()

	call TriggerRegisterTimerEventSingle(t, 1.)
	call TriggerAddCondition(t,Condition(function drawUI_Conditions))
	set t = null
    set t = null
endfunction