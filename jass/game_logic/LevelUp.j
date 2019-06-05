// 武功升重系统

function QiJueCoefficient takes unit u returns integer
	// 是否激活九阳真经残卷
	local integer jyd = JYd[1+GetPlayerId(GetOwningPlayer(u))]
	// 是否有王语嫣称号
	local boolean wyy =  LoadBoolean(YDHT,GetHandleId(u),StringHash("神仙姐姐"))

	// 九阳残卷、七绝、王语嫣400%升重
	if (UnitHaveItem(u, 'I01J') or UnitHaveItem(u, 'I0DB')) and jyd == 1 and wyy then
		return 8
	endif
	// 九阳残卷、王语嫣300%升重
	if jyd == 1 and wyy then
		return 6
	endif
	// 九阳残卷和七绝200%升重，王语嫣和七绝200%升重
	if (UnitHaveItem(u, 'I01J') or UnitHaveItem(u, 'I0DB')) and (jyd == 1 or wyy) then
		return 4
	endif
	// 九阳残卷100%升重，王语嫣100%升重
	if jyd == 1 or wyy then
		return 2
	endif
	// 七绝或新手神器50%升重
	if UnitHaveItem(u, 'I01J') or UnitHaveItem(u, 'I0DB') or jyd == 1 then
		return 1
	endif
	return 0
endfunction


//武功升重及掌门称号系统
function WuGongShengChong takes unit u,integer id,real r returns nothing
 local integer level=GetUnitAbilityLevel(u, id)
 local player p=GetOwningPlayer(u)
 local integer idd= 0
 local integer i=1 + GetPlayerId(p)
 local integer jingyan = 0
	if level > 0 and level < 7 then
		set jingyan = ( 3 + udg_xinggeA[i] ) * ( wuxing[i] + 5 + GetRandomInt(0, R2I(r / 60)) ) * ( 4 + 2 * udg_jwjs[i] ) * ( 2 + QiJueCoefficient(u) ) / 40
		// 慕容家训
		if UnitHasBuffBJ(u, 'B010') then
		    set jingyan = ( 3 + udg_xinggeA[i] ) * ( wuxing[i] + 5 + GetRandomInt(0, R2I(r / 60)) ) * ( 5 + GetUnitAbilityLevel(u, 'A02V') / 2 + 2 * udg_jwjs[i] ) * ( 2 + QiJueCoefficient(u) ) / 40
		endif
		// 天赋：天纵奇才 增加升重速度
		if UnitHasBuffBJ(u, 'B01O') then
		    set jingyan = jingyan * (2 + bigTalent[i])
		endif
        call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id, LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id) + jingyan)
		call SaveStr(YDHT, GetHandleId(GetOwningPlayer(u)), id * 2, I2S(LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id)) + "/" + I2S(R2I(r * level)))
		if LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id) > R2I(r) * level then
		    call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id, 0)
		    call IncUnitAbilityLevel(u, id)
		    call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id * 5, GetUnitAbilityLevel(u, id))
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "领悟了武功：" + GetObjectName(id) + "第" + I2S(level + 1) + "重")
			if id == 'A0DP' then // 归元吐纳功
				set fuyuan[i] = fuyuan[i] + 2
				set gengu[i] = gengu[i] + 2
				set wuxing[i] = wuxing[i] + 2
				set jingmai[i] = jingmai[i] + 2
				set danpo[i] = danpo[i] + 2
				set yishu[i] = yishu[i] + 2
			endif
        endif
    elseif level > 0 and level < 9 then
        if ( GetRandomReal(1., r * I2R(level)) <= I2R(wuxing[i]) / 2 * ( 1 + 0.6 * udg_jwjs[i] ) ) or ( (UnitHasBuffBJ(u, 'B010') or UnitHasBuffBJ(u, 'B01O')) and GetRandomReal(1., r * I2R(level)) <= I2R(wuxing[i]) / 2 * ( 2 + 0.3 * GetUnitAbilityLevel(u, 'A02V') + 0.6 * udg_jwjs[i] ) ) then
       		if id != 'A07W' then
	        	call IncUnitAbilityLevel(u, id)
	        	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id * 5, GetUnitAbilityLevel(u, id))
            	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "领悟了武功：" + GetObjectName(id) + "第" + I2S(level + 1) + "重")
            	if level + 1 == 9 and Ce[i] == 8 then
					set wuxuedian[i]=wuxuedian[i] + 2
					call DisplayTextToPlayer(p, 0, 0, "|cff66ff00精武师有技能升级到九重，获得两个自创武学点")
					if ( udg_jwjs[i] <= 2 ) and udg_jwjsbool[i] == false then
						set udg_jwjs[i]=udg_jwjs[i] + 1
						call DisplayTextToPlayer(p, 0, 0, "|CFF66FF00恭喜您练成第" + I2S(udg_jwjs[i]) + "个九重武功，练成3个可获得宗师哦")
					endif
					if ( udg_jwjs[i] == 3 ) and udg_jwjsbool[i] == false then
						set udg_jwjsbool[i]=true
						if udg_zhangmen[i] == true then
						else
							call SaveStr(YDHT, GetHandleId(p), GetHandleId(p), "〓精武宗师〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
						endif
						call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 15, "|CFF66FF00恭喜" + GetPlayerName(p) + "获得精武宗师")
						call SetPlayerName(p, "〓精武宗师〓" + GetPlayerName(p))
					endif
				endif
        	endif
        else
            if udg_xinggeB[i] >= 4 or UnitHaveItem(u , 'I01J') or UnitHaveItem(u , 'I0DB') or JYd[i] == 1 then
	            if id != 'A07W' then
	            	if UnitHasBuffBJ(u, 'B010') then
	            	    set jingyan = LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id) + ( 3 + udg_xinggeA[i] ) * ( wuxing[i] + 5 + GetRandomInt(0, R2I(r / 60)) ) * ( 2 + QiJueCoefficient(u) ) / 20 * ( 2 + GetUnitAbilityLevel(u, 'A02V') / 4 + udg_jwjs[i] ) / 3 * 2
	            	else
	            	    set jingyan = LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id) + ( 3 + udg_xinggeA[i] ) * ( wuxing[i] + 5 + GetRandomInt(0, R2I(r / 60)) ) * ( 2 + QiJueCoefficient(u) ) / 20 * ( 2 + udg_jwjs[i] ) / 3 * 2
            		endif
            		// 天赋：天纵奇才 增加升重速度
                    if UnitHasBuffBJ(u, 'B01O') then
                        set jingyan = jingyan * (2 + bigTalent[i])
                    endif
	            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id, jingyan)
        		endif
		        call SaveStr(YDHT, GetHandleId(GetOwningPlayer(u)), id * 2, I2S(LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id)) + "/" + I2S(R2I(r * level)))
		        if LoadInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id) > R2I(r) * level then
		            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id, 0)
		            call IncUnitAbilityLevel(u, id)
		            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), id * 5, GetUnitAbilityLevel(u, id))
                    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "领悟了武功：" + GetObjectName(id) + "第" + I2S(level + 1) + "重")
					if id == 'A0DP' then // 归元吐纳功
						set fuyuan[i] = fuyuan[i] + 2
						set gengu[i] = gengu[i] + 2
						set wuxing[i] = wuxing[i] + 2
						set jingmai[i] = jingmai[i] + 2
						set danpo[i] = danpo[i] + 2
						set yishu[i] = yishu[i] + 2
					endif
                    if level + 1 == 9 and Ce[i] == 8 then
						set wuxuedian[i]=wuxuedian[i] + 2
						call DisplayTextToPlayer(p, 0, 0, "|cff66ff00精武师有技能升级到九重，获得两个自创武学点")
						if ( udg_jwjs[i] <= 2 ) and udg_jwjsbool[i] == false then
							set udg_jwjs[i]=udg_jwjs[i] + 1
							call DisplayTextToPlayer(p, 0, 0, "|CFF66FF00恭喜您练成第" + I2S(udg_jwjs[i]) + "个九重武功，练成3个可获得宗师哦")
						endif
						if ( udg_jwjs[i] == 3 ) and udg_jwjsbool[i] == false then
							set udg_jwjsbool[i]=true
							if udg_zhangmen[i] == true then
							else
								call SaveStr(YDHT, GetHandleId(p), GetHandleId(p), "〓精武宗师〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
							endif
							call DisplayTimedTextToForce(bj_FORCE_ALL_PLAYERS, 15, "|CFF66FF00恭喜" + GetPlayerName(p) + "获得精武宗师")
							call SetPlayerName(p, "〓精武宗师〓" + GetPlayerName(p))
						endif
					endif
                endif
            endif
        endif
    endif
    //掌门系统
    if (IsUnitType((u ), ( UNIT_TYPE_HERO)) != null) and udg_zhangmen[i] == false then // INLINED!!
        if GetUnitAbilityLevel(u, 'A0C7') >= 6 and GetUnitAbilityLevel(u, 'A0C2') >= 6 and GetUnitAbilityLevel(u, 'A0C5') >= 6 and ( GetUnitAbilityLevel(u, 'A0C4') >= 6 or GetUnitAbilityLevel(u, 'A0C6') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：峨眉掌门")
            call ModifyHeroStat(0, u, 0, 240)
            call ModifyHeroStat(1, u, 0, 170)
            call SetPlayerName(p, "〓峨眉掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=1
            if GetUnitAbilityLevel(u, 'A07N') >= 1 and UnitHaveItem(u , 'I00B') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：芷若")
                call ModifyHeroStat(0, u, 0, 480)
                // 九阴白骨爪加2级
                call SetUnitAbilityLevel(u, 'A07N', IMinBJ(GetUnitAbilityLevel(u, 'A07N') + 2, 9))
                call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07N' * 5, GetUnitAbilityLevel(u, 'A07N'))
            	call SetPlayerName(p, "〓芷若〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set zhiruo[i] = true
        	endif
        	if GetUnitAbilityLevel(u, 'A0C6') >= 1 and UnitHaveItem(u , 'I09D') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：小东邪")
            	call ModifyHeroStat(1, u, 0, 360)
            	call SetPlayerName(p, "〓小东邪〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("小东邪"),true)
        	endif
        elseif GetUnitAbilityLevel(u, 'A0C9') >= 6 and GetUnitAbilityLevel(u, 'A0CB') >= 6 and GetUnitAbilityLevel(u, 'A0C8') >= 6 and ( GetUnitAbilityLevel(u, 'A0CA') >= 6 or GetUnitAbilityLevel(u, 'A0DI') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：丐帮帮主")
            call ModifyHeroStat(0, u, 0, 480)
            call SetPlayerName(p, "〓丐帮帮主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=2
			// 学降龙、打狗，带打狗棒
            if GetUnitAbilityLevel(u, 'A07L') >= 1 and GetUnitAbilityLevel(u, 'A07E') >= 1 and UnitHaveItem(u , 'I097') then
                    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：北丐")
                    call ModifyHeroStat(0, u, 0, 480)
                    call SetUnitAbilityLevel(u, 'A07L', IMinBJ(GetUnitAbilityLevel(u, 'A07L') + 4, 9))
                    call SetUnitAbilityLevel(u, 'A07E', IMinBJ(GetUnitAbilityLevel(u, 'A07E') + 4, 9))
                    call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07L' * 5, GetUnitAbilityLevel(u, 'A07L'))
                    call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07E' * 5, GetUnitAbilityLevel(u, 'A07E'))
                    call SetPlayerName(p, "〓北丐〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
        	endif
			// 降龙3级以上，拥有擒龙控鹤，带打狗棒
			if GetUnitAbilityLevel(u, 'A07E') >= 3 and GetUnitAbilityLevel(u, 'A03V') > 0 and UnitHaveItem(u , 'I097') then
				call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：北乔峰")
				call ModifyHeroStat(0, u, 0, 500)
				call ModifyHeroStat(1, u, 0, 500)
				call ModifyHeroStat(2, u, 0, 500)
				// 降龙奖励到9级
				call SetUnitAbilityLevel(u, 'A07E', 9)
				call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07L' * 5, GetUnitAbilityLevel(u, 'A07L'))
				call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07E' * 5, GetUnitAbilityLevel(u, 'A07E'))
				call SetPlayerName(p, "〓北乔峰〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set beiqiaofeng[i] = true
			endif
        elseif GetUnitAbilityLevel(u, 'A0CF') >= 6 and GetUnitAbilityLevel(u, 'A0DA') >= 6 and GetUnitAbilityLevel(u, 'A0CM') >= 6 and ( GetUnitAbilityLevel(u, 'A0CH') >= 6 or GetUnitAbilityLevel(u, 'A0DE') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：全真掌教")
            call ModifyHeroStat(1, u, 0, 360)
            call SetPlayerName(p, "〓全真掌教〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=3
            if GetUnitAbilityLevel(u, 'A017') >= 1 and GetUnitAbilityLevel(u, 'A07U') >= 1 and GetUnitAbilityLevel(u, 'A0D1') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：老顽童")
            	call ModifyHeroStat(1, u, 0, 360)
            	call SetUnitAbilityLevel(u, 'A017', 9)
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A017' * 5, GetUnitAbilityLevel(u, 'A017'))
            	call SetPlayerName(p, "〓老顽童〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set laowantong[i] = true
        	endif
        	if GetUnitAbilityLevel(u, 'A06P') >= 1 and GetUnitAbilityLevel(u, 'A07S') >= 1 and GetUnitAbilityLevel(u, 'A0CH') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：中神通")
            	call ModifyHeroStat(0, u, 0, 300)
            	call ModifyHeroStat(1, u, 0, 300)
            	call ModifyHeroStat(2, u, 0, 300)
            	call SetUnitAbilityLevel(u, 'A0CH', 9)
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0CH' * 5, GetUnitAbilityLevel(u, 'A0CH'))
            	call SetPlayerName(p, "〓中神通〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set zhongshentong[i] = true
        	endif
        elseif GetUnitAbilityLevel(u, 'A0CI') >= 6 and GetUnitAbilityLevel(u, 'A0CJ') >= 6 and GetUnitAbilityLevel(u, 'A0CN') >= 6 and ( GetUnitAbilityLevel(u, 'A0CK') >= 6 or GetUnitAbilityLevel(u, 'A0DH') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：血刀掌门")
            call ModifyHeroStat(2, u, 0, 1200)
            call SetPlayerName(p, "〓血刀掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=4
            if UnitHaveItem(u , 'I098') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：血刀老祖")
                call ModifyHeroStat(0, u, 0, 480)
                // 一刀绝空加2级
                call SetUnitAbilityLevel(u, 'A0DH', IMinBJ(GetUnitAbilityLevel(u, 'A0DH') + 2, 9))
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0DH' * 5, GetUnitAbilityLevel(u, 'A0DH'))
            	call SetPlayerName(p, "〓血刀老祖〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set xuedaolaozu[i] = true
        	endif
        	if GetUnitAbilityLevel(u, 'A07X') >= 1 and GetUnitAbilityLevel(u, 'A06J') >= 1 and GetUnitAbilityLevel(u, 'A071') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：空心菜")
            	call ModifyHeroStat(0, u, 0, 200)
            	call ModifyHeroStat(1, u, 0, 200)
            	call ModifyHeroStat(2, u, 0, 360)
            	call SetPlayerName(p, "〓空心菜〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				// 爆伤+100%
				set	udg_baojishanghai[i] = udg_baojishanghai[i] + 5.0
        	endif
        elseif GetUnitAbilityLevel(u, 'A09E') >= 6 and GetUnitAbilityLevel(u, 'A09J') >= 6 and GetUnitAbilityLevel(u, 'A09M') >= 6 and ( GetUnitAbilityLevel(u, 'A09T') >= 6 or GetUnitAbilityLevel(u, 'A09U') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：古墓掌门")
            call ModifyHeroStat(0, u, 0, 240)
            call ModifyHeroStat(1, u, 0, 240)
            call SetPlayerName(p, "〓古墓掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=5
            if GetUnitAbilityLevel(u, 'A07G') >= 1 and UnitHaveItem(u , 'I099') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：神雕侠")
            	call ModifyHeroStat(0, u, 0, 480)
            	call SetUnitAbilityLevel(u, 'A07G', IMinBJ(GetUnitAbilityLevel(u, 'A07G') + 3, 9))
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07G' * 5, GetUnitAbilityLevel(u, 'A07G'))
            	call SetPlayerName(p, "〓神雕侠〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
        	endif
        	if GetUnitAbilityLevel(u, 'A07U') >= 1 and UnitHaveItem(u , 'I09A') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：小龙女")
            	call ModifyHeroStat(2, u, 0, 600)
            	call SetPlayerName(p, "〓小龙女〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
        	endif
        	if GetUnitAbilityLevel(u, 'A07G') >= 1 and GetUnitAbilityLevel(u, 'A07U') >= 1 and UnitHaveItem(u , 'I09C') then
	        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：神雕侠侣")
	        	call ModifyHeroStat(0, u, 0, 480)
            	call ModifyHeroStat(2, u, 0, 600)
            	call SetUnitAbilityLevel(u, 'A07G', IMinBJ(GetUnitAbilityLevel(u, 'A07G') + 6, 9))
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07G' * 5, GetUnitAbilityLevel(u, 'A07G'))
            	call SetPlayerName(p, "〓神雕侠侣〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				// 送神雕
				call unitadditembyidswapped('I04A' , u)
        	endif
        	if GetUnitAbilityLevel(u, 'A07A') >= 6 then
	        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：赤炼仙子")
	        	call SetPlayerName(p, "〓赤炼仙子〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
	        	call SetUnitAbilityLevel(u, 'A07A', IMinBJ(GetUnitAbilityLevel(u, 'A07A') + 6, 9))
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07A' * 5, GetUnitAbilityLevel(u, 'A07A'))
            	set chilian[i]=true
        	endif
        elseif GetUnitAbilityLevel(u, 'A05G') >= 6 and GetUnitAbilityLevel(u, 'A000') >= 6 and GetUnitAbilityLevel(u, 'A05K') >= 6 and ( GetUnitAbilityLevel(u, 'A05O') >= 6 or GetUnitAbilityLevel(u, 'S000') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：少林方丈")
            call ModifyHeroStat(0, u, 0, 170)
            call ModifyHeroStat(1, u, 0, 190)
            call ModifyHeroStat(2, u, 0, 480)
            call SetPlayerName(p, "〓少林方丈〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=6
            if GetUnitAbilityLevel(u, 'A05O') >= 1 and yishu[i] >= 32 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：扫地神僧")
            	call ModifyHeroStat(1, u, 0, 720)
            	call SetPlayerName(p, "〓扫地神僧〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("扫地神僧"),true)
        	endif
            // 拥有易筋A09D或洗髓A080，称号达摩，毕业技能到9级
            if GetUnitAbilityLevel(u, 'A09D') >= 1 or GetUnitAbilityLevel(u, 'A080') >= 1 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：达摩祖师")
            	call SetPlayerName(p, "〓达摩祖师〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
                call ModifyHeroStat(0, u, 0, 200)
                call ModifyHeroStat(1, u, 0, 220)
                call ModifyHeroStat(2, u, 0, 200)
                if ( GetUnitAbilityLevel(u, 'A05O') >= 6 ) then
            		call SetUnitAbilityLevel(u, 'A05O', 9)
        		elseif ( GetUnitAbilityLevel(u, 'S000') >= 6 ) then
            		call SetUnitAbilityLevel(u, 'S000', 9)
        		endif
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("达摩祖师"),true)
            endif
            // 小无相、无相劫指、悟性31以上
            if GetUnitAbilityLevel(u, 'A083') >= 1 or GetUnitAbilityLevel(u, 'A03P') >= 1 and wuxing[i] >= 31 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：大轮明王")
            	call SetPlayerName(p, "〓大轮明王〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
                call ModifyHeroStat(0, u, 0, 200)
                call ModifyHeroStat(1, u, 0, 200)
                call ModifyHeroStat(2, u, 0, 200)
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("大轮明王"),true)
            endif
            // 龙象，根骨31
            if GetUnitAbilityLevel(u, 'S002') >= 1 and gengu[i] >= 31 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：金轮法王")
            	call SetPlayerName(p, "〓金轮法王〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
                call ModifyHeroStat(0, u, 0, 200)
                call ModifyHeroStat(1, u, 0, 200)
                call ModifyHeroStat(2, u, 0, 200)
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("金轮法王"),true)
            endif
        elseif GetUnitAbilityLevel(u, 'A04D') >= 6 and GetUnitAbilityLevel(u, 'A08S') >= 6 and GetUnitAbilityLevel(u, 'A08R') >= 6 and ( GetUnitAbilityLevel(u, 'A08Q') >= 6 or GetUnitAbilityLevel(u, 'A08V') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：武当掌门")
            call ModifyHeroStat(0, u, 0, 240)
            call ModifyHeroStat(2, u, 0, 600)
            call SetPlayerName(p, "〓武当掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=7
            if GetUnitAbilityLevel(u, 'A0DN') >= 1 and GetUnitAbilityLevel(u, 'A09D') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：邋遢仙人")
				call ModifyHeroStat(1, u, 0, 420)
				// 蓝量加500
				call YDWEGeneralBounsSystemUnitSetBonus(u,1,0,500)
				call DisplayTextToPlayer(p,0,0,"魔法上限+500")
            	call SetPlayerName(p, "〓邋遢仙人〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
        	endif
			// 太极拳9级，带真武剑
            if GetUnitAbilityLevel(u, 'A08R') >= 9 and UnitHaveItem(u , 'I0DK') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：张三丰")
				call ModifyHeroStat(0, u, 0, 300)
				call ModifyHeroStat(1, u, 0, 300)
				call ModifyHeroStat(2, u, 0, 300)
            	call SetPlayerName(p, "〓张三丰〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("张三丰"),true)
        	endif
        elseif GetUnitAbilityLevel(u, 'A0BP') >= 6 and GetUnitAbilityLevel(u, 'A0BS') >= 6 and GetUnitAbilityLevel(u, 'A0BQ') >= 6 and ( GetUnitAbilityLevel(u, 'A0BT') >= 6 or GetUnitAbilityLevel(u, 'A0BV') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：星宿掌门")
            call ModifyHeroStat(0, u, 0, 360)
            call ModifyHeroStat(2, u, 0, 360)
            call SetPlayerName(p, "〓星宿掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=8
            if GetUnitAbilityLevel(u, 'A07P') >= 1 and GetUnitAbilityLevel(u, 'A083') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：星宿老仙")
            	call ModifyHeroStat(1, u, 0, 600)
            	call ModifyHeroStat(2, u, 0, 300)
            	if ( GetUnitAbilityLevel(u, 'A0BT') >= 6 ) then
            		call SetUnitAbilityLevel(u, 'A0BT', 9)
        		elseif ( GetUnitAbilityLevel(u, 'A0BV') >= 6 ) then
            		call SetUnitAbilityLevel(u, 'A0BV', 9)
        		endif
            	call SetPlayerName(p, "〓星宿老仙〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set xingxiulaoxian[i] = true
        	endif
        elseif GetUnitAbilityLevel(u, 'A08W') >= 6 and GetUnitAbilityLevel(u, 'A08X') >= 6 and GetUnitAbilityLevel(u, 'A08Y') >= 6 and ( GetUnitAbilityLevel(u, 'A037') >= 6 or GetUnitAbilityLevel(u, 'A091') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：华山掌门")
            call ModifyHeroStat(1, u, 0, 170)
            call ModifyHeroStat(2, u, 0, 290)
            call SetPlayerName(p, "〓华山掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=9
            if GetUnitAbilityLevel(u, 'A07T') >= 1 and GetUnitAbilityLevel(u, 'A07J') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：君子剑")
            	call ModifyHeroStat(0, u, 0, 600)
                call SetUnitAbilityLevel(u, 'A07J', 9) // 辟邪剑法9级
				call unitadditembyidswapped('I069' , u) // 送辟邪残章
            	call SetPlayerName(p, "〓君子剑〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("君子剑岳不群"),true)
            endif
            // 风清扬，学会5级独孤九剑
            if GetUnitAbilityLevel(u, 'A07F') >= 5 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：风清扬")
                call ModifyHeroStat(0, u, 0, 250)
                call ModifyHeroStat(1, u, 0, 250)
                call ModifyHeroStat(2, u, 0, 200)
                call SetUnitAbilityLevel(u, 'A07F', 9) // 独孤九剑9级
				call unitadditembyidswapped('I066' , u) // 送独孤残章
                call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07F' * 5, GetUnitAbilityLevel(u, 'A07F'))
                call SetPlayerName(p, "〓风清扬〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				// 送仙鹤
				call unitadditembyidswapped('I04B' , u)
            endif
        elseif GetUnitAbilityLevel(u, 'A01Z') >= 6 and GetUnitAbilityLevel(u, 'A021') >= 6 and GetUnitAbilityLevel(u, 'A0CD') >= 6 and ( GetUnitAbilityLevel(u, 'A023') >= 6 or GetUnitAbilityLevel(u, 'A024') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：恒山掌门")
            call ModifyHeroStat(1, u, 0, 460)
            call SetPlayerName(p, "〓恒山掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=10
            // 前3个技能大于等于7级，获得仪琳称号
            if  GetUnitAbilityLevel(u, 'A01Z') >= 7 and GetUnitAbilityLevel(u, 'A021') >= 7 and GetUnitAbilityLevel(u, 'A0CD') >= 7 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：仪琳")
                call ModifyHeroStat(1, u, 0, 200)
                call ModifyHeroStat(2, u, 0, 200)
                // 拂尘到9级
                call SetUnitAbilityLevel(u, 'A01Z', 9)
                call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A01Z' * 5, GetUnitAbilityLevel(u, 'A01Z'))
                call SetPlayerName(p, "〓仪琳〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("仪琳"),true)
            endif
        elseif GetUnitAbilityLevel(u, 'A02B') >= 6 and GetUnitAbilityLevel(u, 'A02C') >= 6 and GetUnitAbilityLevel(u, 'A02F') >= 6 and ( GetUnitAbilityLevel(u, 'A02G') >= 6 or GetUnitAbilityLevel(u, 'A02H') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：灵鹫宫主")
            call ModifyHeroStat(0, u, 0, 220)
            call ModifyHeroStat(1, u, 0, 220)
            call ModifyHeroStat(2, u, 0, 220)
            call SetPlayerName(p, "〓灵鹫宫主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=12
            // 大招学八荒，同时学会生死符（冰魄加北冥）
            if GetUnitAbilityLevel(u, 'A02G') >= 6 and GetUnitAbilityLevel(u, 'A07A') >= 1 and GetUnitAbilityLevel(u, 'A082') >= 1 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：天山童姥")
                call ModifyHeroStat(0, u, 0, 280)
                call ModifyHeroStat(1, u, 0, 280)
                call ModifyHeroStat(2, u, 0, 320)
                // 八荒奖励2级
				call SetUnitAbilityLevel(u, 'A02G', IMinBJ(GetUnitAbilityLevel(u, 'A02G') + 2, 9))
				// 如意加2级
				call SetUnitAbilityLevel(u, 'A02F', IMinBJ(GetUnitAbilityLevel(u, 'A02F') + 2, 9))
                call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A02G' * 5, GetUnitAbilityLevel(u, 'A02G'))
                call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A02F' * 5, GetUnitAbilityLevel(u, 'A02F'))
                call SetPlayerName(p, "〓天山童姥〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            endif
            // 虚竹：北冥，冰魄，玉扳指，罗汉
            if GetUnitAbilityLevel(u, 'A07A') >= 1 and GetUnitAbilityLevel(u, 'A082') >= 1 and GetUnitAbilityLevel(u, 'A07O') >= 1 and UnitHaveItem(u , 'I0DT') then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：虚竹子")
                call ModifyHeroStat(0, u, 0, 100)
                call ModifyHeroStat(1, u, 0, 500)
                call ModifyHeroStat(2, u, 0, 100)
                call SetPlayerName(p, "〓虚竹子〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("虚竹子"),true)
            endif
		elseif GetUnitAbilityLevel(u, 'A08A') >= 6 and GetUnitAbilityLevel(u, 'A08B') >= 6 and GetUnitAbilityLevel(u, 'A08E') >= 6 and ( GetUnitAbilityLevel(u, 'A08G') >= 6 or GetUnitAbilityLevel(u, 'A08H') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：泰山掌门")
            call ModifyHeroStat(0, u, 0, 320)
            call ModifyHeroStat(1, u, 0, 220)
            call ModifyHeroStat(2, u, 0, 120)
            call SetPlayerName(p, "〓泰山掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=24
            // 天门道长，学会小无相
			 if GetUnitAbilityLevel(u, 'A083') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：天门道长")
            	call ModifyHeroStat(0, u, 0, 300)
				call ModifyHeroStat(1, u, 0, 600)
            	call SetPlayerName(p, "〓天门道长〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("天门道长"),true)
        	endif

        elseif GetUnitAbilityLevel(u, 'A02K') >= 6 and GetUnitAbilityLevel(u, 'A0CC') >= 6 and GetUnitAbilityLevel(u, 'A02M') >= 6 and ( GetUnitAbilityLevel(u, 'A02R') >= 6 or GetUnitAbilityLevel(u, 'A02V') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：慕容家主")
            call ModifyHeroStat(0, u, 0, 100)
            call ModifyHeroStat(1, u, 0, 280)
            call ModifyHeroStat(2, u, 0, 300)
            call SetPlayerName(p, "〓慕容家主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=13
            // 慕容龙城，搭配斗转
            if GetUnitAbilityLevel(u, 'A07Q') >= 1  then // +斗转星移
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：慕容龙城")
                call ModifyHeroStat(0, u, 0, 200)
                call ModifyHeroStat(1, u, 0, 250)
                call ModifyHeroStat(2, u, 0, 200)
                call SetPlayerName(p, "〓慕容龙城〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set muronglc[i] = true
            endif
        elseif GetUnitAbilityLevel(u, 'A04M') >= 6 and GetUnitAbilityLevel(u, 'A04N') >= 6 and GetUnitAbilityLevel(u, 'A04P') >= 6 and ( GetUnitAbilityLevel(u, 'A026') >= 6 or GetUnitAbilityLevel(u, 'A04R') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：衡山掌门")
            call ModifyHeroStat(0, u, 0, 350)
            call ModifyHeroStat(1, u, 0, 260)
            call ModifyHeroStat(2, u, 0, 100)
            call SetPlayerName(p, "〓衡山掌门〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=15
            if GetUnitAbilityLevel(u, 'A04M') >= 7 and GetUnitAbilityLevel(u, 'A04N') >= 7 and GetUnitAbilityLevel(u, 'A04P') >= 7 then
				call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：莫大先生")
	            call SetPlayerName(p, "〓莫大先生〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				set L7[i]=1
				loop
					exitwhen L7[i] > wugongshu[i]
					if ( I7[20 * ( i - 1 ) + L7[i]] != 'AEfk' ) then
						if ( ( L7[i] == wugongshu[i] ) ) then
							call SetUnitAbilityLevel(u, 'A04M', 9)
							call SetUnitAbilityLevel(u, 'A04N', 9)
							call SetUnitAbilityLevel(u, 'A04P', 9)
            				call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A04M' * 5, 9)
            				call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A04N' * 5, 9)
            				call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A04P' * 5, 9)
						endif
					else
						if GetUnitAbilityLevel(u, 'A026') >= 6 then
							set idd='A04R'
						else
							set idd='A026'
						endif
						call UnitAddAbility(u, idd)
						call UnitMakeAbilityPermanent(u, true, idd)
						set I7[20 * ( i - 1 ) + L7[i]]=idd
						exitwhen true
					endif
					set L7[i]=L7[i] + 1
				endloop
            endif
        elseif GetUnitAbilityLevel(u, 'A04W') >= 6 and GetUnitAbilityLevel(u, 'A04Z') >= 6 and GetUnitAbilityLevel(u, 'A051') >= 6 and ( GetUnitAbilityLevel(u, 'A057') >= 6 or GetUnitAbilityLevel(u, 'A059') >= 6 ) then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：男神龙")
            call ModifyHeroStat(0, u, 0, 350)
            call ModifyHeroStat(2, u, 0, 200)
            call SetPlayerName(p, "〓男神龙〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=16
			// 学九阳+龙象，神龙教主
			if GetUnitAbilityLevel(u, 'A0DN') >= 1 and GetUnitAbilityLevel(u, 'S002') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：神龙教主")
            	call ModifyHeroStat(0, u, 0, 200)
				call ModifyHeroStat(1, u, 0, 400)
				call ModifyHeroStat(2, u, 0, 300)
            	call SetPlayerName(p, "〓神龙教主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("神龙教主"),true)
        	endif
        elseif GetUnitAbilityLevel(u, 'A056') >= 6 and GetUnitAbilityLevel(u, 'A054') >= 6 and GetUnitAbilityLevel(u, 'A04X') >= 6 and ( GetUnitAbilityLevel(u, 'A057') >= 6 or GetUnitAbilityLevel(u, 'A059') >= 6 ) then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：女神龙")
            call ModifyHeroStat(0, u, 0, 200)
            call ModifyHeroStat(1, u, 0, 350)
            call SetPlayerName(p, "〓女神龙〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=17
			// 学九阴+小无相，教主夫人
			if GetUnitAbilityLevel(u, 'A07S') >= 1 and GetUnitAbilityLevel(u, 'A083') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：教主夫人")
            	call ModifyHeroStat(0, u, 0, 400)
				call ModifyHeroStat(1, u, 0, 200)
				call ModifyHeroStat(2, u, 0, 300)
            	call SetPlayerName(p, "〓教主夫人〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("教主夫人"),true)
        	endif
        elseif GetUnitAbilityLevel(u, 'A06Y') >= 6 and GetUnitAbilityLevel(u, 'A06Z') >= 6 and GetUnitAbilityLevel(u, 'A07Y') >= 6 and ( GetUnitAbilityLevel(u, 'A070') >= 6 or GetUnitAbilityLevel(u, 'A0DP') >= 6 ) then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：铁掌帮主")
            call ModifyHeroStat(0, u, 0, 300)
            call ModifyHeroStat(2, u, 0, 225)
            call SetPlayerName(p, "〓铁掌帮主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=27
			// 学乾坤+双手，铁掌水上漂
			if GetUnitAbilityLevel(u, 'A07W') >= 1 and GetUnitAbilityLevel(u, 'A07U') >= 1 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：铁掌水上漂")
            	call ModifyHeroStat(0, u, 0, 300)
				call ModifyHeroStat(1, u, 0, 200)
				call ModifyHeroStat(2, u, 0, 100)
            	call SetPlayerName(p, "〓铁掌水上漂〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
				call SaveBoolean(YDHT,GetHandleId(u),StringHash("铁掌水上漂"),true)
        	endif
        elseif GetUnitAbilityLevel(u, 'A098') >= 6 and GetUnitAbilityLevel(u, 'A09A') >= 6 and GetUnitAbilityLevel(u, 'A0B0') >= 6 and ( GetUnitAbilityLevel(u, 'A0B6') >= 1 or GetUnitAbilityLevel(u, 'A0B1') >= 6 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：唐门门主")
            call ModifyHeroStat(1, u, 0, 225)
            call ModifyHeroStat(2, u, 0, 300)
            call SetPlayerName(p, "〓唐门门主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=28
            // 学小无相+冰魄银针6重，搜魂侠
            if GetUnitAbilityLevel(u, 'A083') >= 1 and GetUnitAbilityLevel(u, 'A07A') >= 1 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：搜魂侠")
                call ModifyHeroStat(0, u, 0, 300)
                call ModifyHeroStat(1, u, 0, 200)
                call ModifyHeroStat(2, u, 0, 300)
                call SetPlayerName(p, "〓搜魂侠〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
                call SaveBoolean(YDHT,GetHandleId(u),StringHash("搜魂侠"),true)
            endif
		elseif GetUnitAbilityLevel(u, 'A030') >= 6 and GetUnitAbilityLevel(u, 'A032') >= 6 and GetUnitAbilityLevel(u, 'A06R') >= 6 and ( GetUnitAbilityLevel(u, 'A034') >= 6 or GetUnitAbilityLevel(u, 'A07W') >= 4 ) then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：明教教主")
            call ModifyHeroStat(0, u, 0, 210)
            call ModifyHeroStat(1, u, 0, 310)
            call ModifyHeroStat(2, u, 0, 160)
            call SetPlayerName(p, "〓明教教主〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=14
            if GetUnitAbilityLevel(u, 'A030') >= 9 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：白眉鹰王")
	            call SetPlayerName(p, "〓白眉鹰王〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
	            call ModifyHeroStat(2, u, 0, 500)
            endif
            if GetUnitAbilityLevel(u, 'A032') >= 9 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：青翼幅王")
	            call SetPlayerName(p, "〓青翼幅王〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
	            call ModifyHeroStat(1, u, 0, 300)
            endif
            if GetUnitAbilityLevel(u, 'A06R') >= 9 and GetUnitAbilityLevel(u, 'A07M') >= 3 and UnitHaveItem(u , 'I00D') then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：金毛狮王")
	            call SetPlayerName(p, "〓金毛狮王〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
	            call SetUnitAbilityLevel(u, 'A07M', IMinBJ(GetUnitAbilityLevel(u, 'A07M') + 6, 9))
	            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07M' * 5, GetUnitAbilityLevel(u, 'A07M'))
	            call ModifyHeroStat(0, u, 0, 300)
            endif
            if GetUnitAbilityLevel(u, 'A07W') >= 6 and GetUnitAbilityLevel(u, 'A0DN') >= 1 and GetUnitAbilityLevel(u, 'A08R') >= 4 then
	            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：无忌")
	            call SetPlayerName(p, "〓无忌〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
	            call SetUnitAbilityLevel(u, 'A08R', IMinBJ(GetUnitAbilityLevel(u, 'A08R') + 3, 9))
	            call SetUnitAbilityLevel(u, 'A07W', 7)
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07W' * 5, GetUnitAbilityLevel(u, 'A07W'))
            	call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A08R' * 5, GetUnitAbilityLevel(u, 'A08R'))
	            call ModifyHeroStat(1, u, 0, 1000)
	            call ModifyHeroStat(2, u, 0, 500)
				// 送白猿
				call unitadditembyidswapped('I0CS' , u)
            endif
        elseif GetUnitAbilityLevel(u, 'A07S') >= 1 and GetUnitAbilityLevel(u, 'A0D2') >= 1 and GetUnitAbilityLevel(u, 'A0D6') >= 1 and GetUnitAbilityLevel(u, 'A0D4') >= 1 and GetUnitAbilityLevel(u, 'A07N') >= 4 and GetUnitAbilityLevel(u, 'A0D3') >= 4 and GetUnitAbilityLevel(u, 'A0D1') >= 4 then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：真·九阴真人")
            call SetPlayerName(p, "〓真·九阴真人〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            call SetUnitAbilityLevel(u, 'A07N', IMinBJ(GetUnitAbilityLevel(u, 'A07N') + 3, 9))
            call SetUnitAbilityLevel(u, 'A0D3', IMinBJ(GetUnitAbilityLevel(u, 'A0D3') + 3, 9))
            call SetUnitAbilityLevel(u, 'A0D1', IMinBJ(GetUnitAbilityLevel(u, 'A0D1') + 3, 9))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07N' * 5, GetUnitAbilityLevel(u, 'A07N'))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0D3' * 5, GetUnitAbilityLevel(u, 'A0D3'))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0D1' * 5, GetUnitAbilityLevel(u, 'A0D1'))
            call ModifyHeroStat(1, u, 0, 2900)
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=11
        elseif GetUnitAbilityLevel(u, 'A089') >= 5 and GetUnitAbilityLevel(u, 'A084') >= 1 and GetUnitAbilityLevel(u, 'A0D2') >= 1 and UnitHaveItem(u , 'I09B') then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：西毒")
            call SetPlayerName(p, "〓西毒〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            call ModifyHeroStat(0, u, 0, 600)
            call ModifyHeroStat(2, u, 0, 360)
            call unitadditembyidswapped('I070' , u)
            call SetUnitAbilityLevel(u, 'A089', IMinBJ(GetUnitAbilityLevel(u, 'A089') + 2, 9))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A089' * 5, GetUnitAbilityLevel(u, 'A089'))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=19
			call SaveBoolean(YDHT,GetHandleId(u),StringHash("西毒"),true)
		elseif GetUnitAbilityLevel(u, 'A06H') >= 5 and GetUnitAbilityLevel(u, 'A018') >= 5 and UnitHaveItem(u , 'I09D') then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：东邪")
            call SetPlayerName(p, "〓东邪〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            call ModifyHeroStat(1, u, 0, 240)
            call ModifyHeroStat(2, u, 0, 300)
            call SetUnitAbilityLevel(u, 'A06H', 9)
            call SetUnitAbilityLevel(u, 'A018', 9)
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A06H' * 5, GetUnitAbilityLevel(u, 'A06H'))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A018' * 5, GetUnitAbilityLevel(u, 'A018'))
            call unitadditembyidswapped('I04Q' , u)
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=22
			set dongxie[i] = true
        elseif GetUnitAbilityLevel(u, 'A06P') >= 5 and GetUnitAbilityLevel(u, 'A0CH') >= 3 and GetUnitAbilityLevel(u, 'A0D4') >= 1 and udg_runamen[i] != 5 then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：南帝")
            call SetPlayerName(p, "〓南帝〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
            call ModifyHeroStat(1, u, 0, 480)
            call ModifyHeroStat(2, u, 0, 600)
            call SetUnitAbilityLevel(u, 'A06P', 9)
            call SetUnitAbilityLevel(u, 'A0CH', 7)
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A06P' * 5, GetUnitAbilityLevel(u, 'A06P'))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0CH' * 5, GetUnitAbilityLevel(u, 'A0CH'))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=23
        elseif GetUnitAbilityLevel(u, 'A07N') >= 5 and GetUnitAbilityLevel(u, 'A0D1') >= 5 and GetUnitAbilityLevel(u, 'A0D3') >= 5 and GetUnitAbilityLevel(u, 'A07G') >= 3 and ( GetUnitTypeId(u) == 'O023' or GetUnitTypeId(u) == 'O02H' or GetUnitTypeId(u) == 'O02I' or GetUnitTypeId(u) == 'O003' or GetUnitTypeId(u) == 'O002' ) then
        	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：瑶琴")
            call SetPlayerName(p, "〓瑶琴〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
			call ModifyHeroStat(0, u, 0, 700)
            call ModifyHeroStat(1, u, 0, 200)
            call SetUnitAbilityLevel(u, 'A0D1', 9)
            call SetUnitAbilityLevel(u, 'A0D3', 7)
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0D1' * 5, GetUnitAbilityLevel(u, 'A0D1'))
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A0D3' * 5, GetUnitAbilityLevel(u, 'A0D3'))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=18
			set yaoqin[i] = true
            //自创武功命名为虾米神拳
        elseif s__ZiZhiWuGong_name[zizhiwugong[i]] == "虾米神拳" and GetUnitAbilityLevel(u, 'A036') >= 1 and GetUnitAbilityLevel(u, 'A07I') >= 5 and udg_runamen[i] == 11 then
			call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：小虾米")
            call SetPlayerName(p, "〓小虾米〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
			call ModifyHeroStat(0, u, 0, 1000)
            call ModifyHeroStat(1, u, 0, 1000)
            call ModifyHeroStat(2, u, 0, 1000)
            call SetUnitAbilityLevel(u, 'A07I', 9)
            call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07I' * 5, GetUnitAbilityLevel(u, 'A07I'))
            set udg_zhangmen[i]=true
            set udg_whichzhangmen[i]=21
			call SaveBoolean(YDHT,GetHandleId(u),StringHash("小虾米"),true)
		elseif GetUnitAbilityLevel(u, 'A07E') >= 5 and GetUnitAbilityLevel(u, 'A017') >= 5 and GetUnitAbilityLevel(u, 'A07S') >= 1 and GetUnitAbilityLevel(u, 'A07U') >= 1 and udg_runamen[i] == 11 then
			// 不能是丐帮，降龙5级、空明拳5级、九阴真经、双手互博
			// 奖励招式300、内力500、真实300，降龙加3级，空明加3级
			call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：郭大侠")
			call SetPlayerName(p, "〓郭大侠〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
			call ModifyHeroStat(0, u, 0, 300)
			call ModifyHeroStat(2, u, 0, 500)
			call ModifyHeroStat(2, u, 0, 300)
			call SetUnitAbilityLevel(u, 'A07E', IMinBJ(GetUnitAbilityLevel(u, 'A07E') + 3, 9))
			call SetUnitAbilityLevel(u, 'A017', IMinBJ(GetUnitAbilityLevel(u, 'A017') + 3, 9))
			call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07E' * 5, GetUnitAbilityLevel(u, 'A07E'))
			call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A017' * 5, GetUnitAbilityLevel(u, 'A017'))
			set udg_zhangmen[i]=true
			set udg_whichzhangmen[i]=25
			set beixia[i] = true // 北侠
		elseif GetUnitAbilityLevel(u, 'A07S') >= 1 and GetUnitAbilityLevel(u, 'A0DN') >= 1 and GetUnitAbilityLevel(u, 'A07O') >= 1 and GetUnitAbilityLevel(u, 'A07R') >= 1 and GetUnitAbilityLevel(u, 'A07T') >= 1  and GetUnitAbilityLevel(u, 'A07Q') >= 1 and GetUnitAbilityLevel(u, 'A07W') >= 1 and GetUnitAbilityLevel(u, 'A07U') >= 1 then
			// 王语嫣：九阴、九阳、罗汉、吸星、葵花、斗转、乾坤、双手
			call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：神仙姐姐")
			call SetPlayerName(p, "〓神仙姐姐〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
			call ModifyHeroStat(0, u, 0, 300)
			call ModifyHeroStat(2, u, 0, 500)
			call ModifyHeroStat(2, u, 0, 300)
			call SetUnitAbilityLevel(u, 'A07E', IMinBJ(GetUnitAbilityLevel(u, 'A07E') + 3, 9))
			call SetUnitAbilityLevel(u, 'A017', IMinBJ(GetUnitAbilityLevel(u, 'A017') + 3, 9))
			call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07E' * 5, GetUnitAbilityLevel(u, 'A07E'))
			call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A017' * 5, GetUnitAbilityLevel(u, 'A017'))
			set udg_zhangmen[i]=true
			set udg_whichzhangmen[i]=26
			call SaveBoolean(YDHT,GetHandleId(u),StringHash("神仙姐姐"),true)
        endif
    endif
    if (IsUnitType((u ), ( UNIT_TYPE_HERO)) != null) and udg_whichzhangmen[i] == 10 and GetUnitAbilityLevel(u, 'A07F') >= 1 and GetUnitAbilityLevel(u, 'A09D') >= 1 and GetUnitAbilityLevel(u, 'A07R') >= 1 and GetUnitAbilityLevel(u, 'A08W') >= 1 then // INLINED!!
    	call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff66ff00恭喜玩家" + I2S(i) + "获得了称号：笑傲江湖")
        call SetPlayerName(p, "〓笑傲江湖〓" + LoadStr(YDHT, GetHandleId(p), GetHandleId(p)))
        call ModifyHeroStat(0, u, 0, 480)
        call ModifyHeroStat(0, u, 0, 500)
        call ModifyHeroStat(2, u, 0, 600)
        call SetUnitAbilityLevel(u, 'A07F', 9)
        call SetUnitAbilityLevel(u, 'A08W', IMinBJ(GetUnitAbilityLevel(u, 'A08W') + 5, 9))
        call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A07F' * 5, GetUnitAbilityLevel(u, 'A07F'))
        call SaveInteger(YDHT, GetHandleId(GetOwningPlayer(u)), 'A08W' * 5, GetUnitAbilityLevel(u, 'A08W'))
        set udg_whichzhangmen[i]=20
    endif
    set p=null
endfunction


/*
 * 几率触发被动武功(AOE)
 * @param filter 筛选伤害周围单位的条件，通常为活着、敌人
 * @param callback 对筛选出的单位进行伤害的函数，包括物效
 */
function PassiveWuGongAction takes unit playerControllingUnit, unit enemy, real possibility, real range, boolexpr filter, code callback, integer abilityId, real upgradeSpeed returns nothing
	local location loc = GetUnitLoc(playerControllingUnit)
	local integer i = 1 + GetPlayerId(GetOwningPlayer(playerControllingUnit))
	if (GetRandomInt(1, 100)<=fuyuan[i]/5+possibility) then
		call ForGroupBJ(YDWEGetUnitsInRangeOfLocMatchingNull(range,loc,filter),callback)
		call WuGongShengChong(playerControllingUnit, abilityId, upgradeSpeed)
	endif
	call RemoveLocation(loc)
	set loc = null
endfunction

