// NPC提示

function createTagForNpc0 takes string text, real x, real y, real size, real zOffset, integer r, integer g, integer b, integer transparency returns nothing
    local texttag last = CreateTextTag()
    local real height = size * 0.023 / 10
    call SetTextTagText(last, text, height)
    call SetTextTagPos(last, x, y, zOffset)
    call SetTextTagColor(last, r * 255 / 100, g * 255 / 100, b * 255 / 100,  (100 - transparency) * 255 / 100)
    set last = null
endfunction

function createTagForNpc takes string s, real x, real y returns nothing
    call createTagForNpc0(s, x-50, y, 13, 100, 100, 100, 0, 50)
endfunction

function npcHint takes nothing returns nothing
    call createTagForNpc("新手教官", 365, -692)
    call createTagForNpc("积分商店", -1451.6, -1346)
    call createTagForNpc("道具商城", -1268.9, -1365.7)
    call createTagForNpc("等级奖励", -1396.8, -161.8)
    call createTagForNpc("驿站", -108.1, -1394.7)
    call createTagForNpc("古董商人", 670.9, -1270.5)
    call createTagForNpc("练功木桩", -35, -104)
    call createTagForNpc("副本传送", -1321, -1888)
    call createTagForNpc("贼哥", -1462, -470)
    call createTagForNpc("炼制丹药", -2032.3, -1442.2)
    call createTagForNpc("历练传送", -2081.6, -1962.8)
    call createTagForNpc("宝石商人", 598.6, -2015.8)
    call createTagForNpc("选择副职", -2053.7, -339.5)
    call createTagForNpc("新手任务", 1847, -2694)
endfunction