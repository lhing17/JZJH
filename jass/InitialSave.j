


function CunWuGong takes integer num, integer id1, integer id2, string s, integer dp1, integer fy1, integer gg1, integer jm1, integer wx1, integer ys1 returns nothing
	local integer i = StringHash("武学")
	call SaveInteger(YDHT, i+num, 0, num)
	call SaveInteger(YDHT, i+num, 1, id1)
	call SaveInteger(YDHT, i+num, 2, id2)
	call SaveStr(YDHT, i+num, 3, s)
	call SaveInteger(YDHT, i+num, 4, dp1)
	call SaveInteger(YDHT, i+num, 5, fy1)
	call SaveInteger(YDHT, i+num, 6, gg1)
	call SaveInteger(YDHT, i+num, 7, jm1)
	call SaveInteger(YDHT, i+num, 8, wx1)
	call SaveInteger(YDHT, i+num, 9, ys1)
endfunction
function CunWuGongS takes nothing returns nothing
	//顺序：胆魄、福缘、根骨、经脉、悟性、医术
	call CunWuGong(1, 'I03J', 'A07A', "江湖武学", 0, 10, 0, 0, 14, 15)
	call CunWuGong(2, 'I03H', 'A06H', "江湖武学", 14, 12, 18, 0, 0, 0)
	call CunWuGong(3, 'I02V', 'A07Q', "江湖内功", 0, 12, 0, 18, 0, 14)
	call CunWuGong(4, 'I02U', 'A07P', "江湖内功", 17, 0, 0, 22, 0, 0)
	call CunWuGong(5, 'I03G', 'A06L', "江湖武学", 0, 0, 0, 15, 10, 12)
	call CunWuGong(6, 'I02Z', 'A0DN', "江湖内功", 17, 14, 18, 0, 0, 0)
	call CunWuGong(7, 'I02X', 'A07S', "九阴内功", 0, 17, 17, 17, 20, 0)
	call CunWuGong(8, 'I03I', 'A07N', "九阴武学", 13, 0, 12, 12, 16, 0)
	call CunWuGong(9, 'I02Y', 'A07T', "江湖内功", 22, 20, 0, 17, 0, 0)
	call CunWuGong(10, 'I03K', 'A06J', "江湖武学", 14, 0, 0, 16, 20, 0)
	call CunWuGong(11, 'I03D', 'A07O', "江湖内功", 0, 16, 0, 0, 0, 16)
	call CunWuGong(12, 'I03L', 'A07M', "江湖武学", 0, 14, 14, 14, 14, 0)
	call CunWuGong(13, 'I030', 'A07W', "江湖内功", 0, 0, 0, 23, 18, 17)
	call CunWuGong(14, 'I031', 'A07U', "江湖内功", 18, 20, 16, 0, 0, 0)
	call CunWuGong(15, 'I03E', 'A06M', "江湖武学", 0, 0, 18, 18, 0, 0)
	call CunWuGong(16, 'I033', 'A071', "江湖武学", 0, 12, 0, 16, 0, 11)
	call CunWuGong(17, 'I02W', 'A07R', "江湖内功", 0, 0, 0, 14, 12, 11)
	call CunWuGong(18, 'I03F', 'A06P', "江湖武学", 0, 0, 22, 17, 15, 0)
	call CunWuGong(19, 'I039', 'A07G', "绝世武学", 18, 21, 27, 0, 0, 0)
	call CunWuGong(20, 'I034', 'A07L', "绝世武学", 20, 0, 26, 18, 0, 0)
	call CunWuGong(21, 'I038', 'A07F', "绝世武学", 0, 19, 0, 22, 28, 0)
	call CunWuGong(22, 'I037', 'A07H', "绝世武学", 17, 25, 0, 0, 17, 0)
	call CunWuGong(23, 'I03B', 'A086', "绝世武学", 0, 23, 20, 0, 29, 0)
	call CunWuGong(24, 'I032', 'A07E', "绝世武学", 24, 0, 30, 24, 0, 0)
	call CunWuGong(25, 'I035', 'A085', "绝世武学", 0, 0, 0, 24, 19, 16)
	call CunWuGong(26, 'I036', 'A07J', "绝世武学", 23, 0, 0, 18, 0, 16)
	call CunWuGong(27, 'I03C', 'A089', "绝世武学", 23, 0, 0, 20, 22, 0)
	call CunWuGong(28, 'I03A', 'A07I', "绝世武学", 25, 0, 25, 25, 20, 0)
	call CunWuGong(29, 'I03S', 'A082', "绝世内功", 22, 32, 0, 22, 0, 25)
	call CunWuGong(30, 'I03O', 'A084', "绝世内功", 28, 19, 0, 28, 0, 0)
	call CunWuGong(31, 'I03T', 'S002', "绝世内功", 20, 0, 29, 0, 0, 23)
	call CunWuGong(32, 'I03Q', 'A07X', "绝世内功", 0, 23, 31, 33, 0, 0)
	call CunWuGong(33, 'I03M', 'A0D8', "绝世内功", 28, 24, 0, 33, 0, 30)
	call CunWuGong(34, 'I03P', 'A080', "绝世内功", 25, 0, 0, 32, 22, 32)
	call CunWuGong(35, 'I03U', 'A083', "绝世内功", 0, 24, 0, 30, 24, 21)
	call CunWuGong(36, 'I03R', 'A09D', "绝世内功", 0, 30, 0, 27, 34, 23)
	call CunWuGong(37, 'I09G', 'A0D2', "九阴内功", 0, 17, 17, 17, 20, 0)
	call CunWuGong(38, 'I09H', 'A0D4', "九阴内功", 0, 17, 17, 17, 20, 0)
	call CunWuGong(39, 'I09I', 'A0D6', "九阴内功", 0, 17, 17, 17, 20, 0) // 易筋断骨篇
	call CunWuGong(40, 'I09J', 'A0D1', "九阴武学", 13, 0, 12, 12, 16, 0) // 摧坚
	call CunWuGong(41, 'I09K', 'A0D3', "九阴武学", 13, 0, 12, 12, 16, 0) // 摧心掌
	call CunWuGong(42, 'I0C2', 'A03N', "奇武", 0, 0, 0, 15, 14, 16)
	call CunWuGong(43, 'I0C3', 'A03P', "奇武", 0, 18, 26, 0, 0, 16)
	call CunWuGong(44, 'I0C4', 'A03L', "奇武", 12, 14, 16, 0, 0, 0)
	call CunWuGong(45, 'I0C5', 'A03Q', "奇武", 17, 0, 0, 0, 20, 0)
	call CunWuGong(46, 'I0C6', 'A03O', "奇武", 14, 15, 16, 0, 0, 12)
	call CunWuGong(47, 'I0C8', 'A0CE', "奇武", 12, 0, 0, 0, 18, 0)
	call CunWuGong(48, 'I0C9', 'A03T', "奇武", 14, 17, 0, 16, 0, 0)
	call CunWuGong(49, 'I0CA', 'A03U', "奇武", 0, 0, 0, 20, 0, 0)
	call CunWuGong(50, 'I0CB', 'A03W', "奇武", 0, 0, 0, 14, 14, 0)
	call CunWuGong(51, 'I0CC', 'A03V', "奇武", 0, 0, 0, 0, 15, 12)
	call CunWuGong(52, 'I0CD', 'A03Z', "奇武", 13, 17, 16, 0, 0, 0)
	call CunWuGong(53, 'I0CJ', 'A04V', "奇武", 15, 0, 16, 0, 17, 0)
	call CunWuGong(54, 'I0CT', 'A06A', "奇武", 15, 0, 15, 15, 15, 0) //《寿木长生功》
	call CunWuGong(55, 'I0CU', 'A06B', "奇武", 20, 20, 0, 18, 0, 0) //《黄沙万里鞭法》
	call CunWuGong(56, 'I0CV', 'A06S', "奇武", 0, 0, 0, 25, 0, 25) //《九阳真经散篇》
endfunction

//万能装备系统
function Cun takes integer id,string name,string s11,real i11,string s12,real i12,string s13,real i13,string s14,real i14 returns nothing
	local item it=CreateItem(id,0,0)
	local integer hp=R2I(GetWidgetLife(it))
	local integer lv=0
	if HaveSavedInteger(YDHT,id,id)==false then
		call SaveInteger(YDHT,id,id,id)
	endif
	if StringLength(s11)>0 and i11>0 then
		call SaveReal(YDHT,id,StringHash(s11),i11)
	endif
	if StringLength(s12)>0 and i12>0 then
		call SaveReal(YDHT,id,StringHash(s12),i12)
	endif
	if StringLength(s13)>0 and i13>0 then
		call SaveReal(YDHT,id,StringHash(s13),i13)
	endif
	if StringLength(s14)>0 and i14>0 then
		call SaveReal(YDHT,id,StringHash(s14),i14)
	endif
	call SaveReal(YDHT, id, StringHash("升级概率"), 100.)
	call RemoveItem(it)
	set it=null
endfunction


/*
 * 万能装备属性存储
 */
function Cuns takes nothing returns nothing
	//攻击力、护甲、招式伤害、内力、真实伤害
	//call BJDebugMsg("开始存储装备属性")
	call Cun('I00C',"龙鳞剑","攻击力",5000,"招式伤害",750,"内力",200,"真实伤害",200)
	call Cun('I00B',"倚天剑","攻击力",4500,"招式伤害",700,"内力",190,"真实伤害",0)
	call Cun('I00D',"屠龙刀","攻击力",4850,"招式伤害",720,"内力",195,"真实伤害",300)
	call Cun('I04F',"断肠","攻击力",1000,"招式伤害",150,"内力",0,"真实伤害",80)
	call Cun('I00P',"晶玉扇","攻击力",3000,"招式伤害",250,"内力",150,"真实伤害",0)
	call Cun('I00Q',"紫金刀","攻击力",2700,"招式伤害",230,"内力",0,"真实伤害",100)
	call Cun('I01L',"精钢剑","攻击力",650,"招式伤害",80,"内力",0,"真实伤害",0)
	call Cun('I01N',"七星扇","攻击力",800,"招式伤害",100,"内力",0,"真实伤害",40)
	call Cun('I00X',"鸳鸯刀","攻击力",1500,"招式伤害",150,"内力",50,"真实伤害",0)
	call Cun('I097',"打狗棒","攻击力",4500,"招式伤害",650,"内力",0,"真实伤害",0)
	call Cun('I099',"君子剑","攻击力",2000,"招式伤害",100,"内力",50,"真实伤害",50)
	call Cun('I09B',"蛇杖","攻击力",4500,"招式伤害",0,"内力",0,"真实伤害",1000)
	call Cun('I09A',"淑女剑","攻击力",1800,"招式伤害",50,"内力",100,"真实伤害",50)
	call Cun('I09C',"双剑合璧","攻击力",3800,"招式伤害",220,"内力",220,"真实伤害",150)
	call Cun('I098',"血刀","攻击力",50000,"招式伤害",700,"内力",0,"真实伤害",0)
	call Cun('I09D',"玉箫","攻击力",4850,"招式伤害",0,"内力",900,"真实伤害",0)
	call Cun('I0DK',"真武剑","攻击力",2000,"招式伤害",0,"内力",400,"真实伤害",0)
	call Cun('I0DU',"拂尘","攻击力",3000,"招式伤害",300,"内力",300,"真实伤害",300)
	call Cun('I0DY',"镇岳尚方","攻击力",5000,"招式伤害",300,"内力",400,"真实伤害",0)
	call Cun('I0EJ',"铁掌令","攻击力",5000,"招式伤害",0,"内力",600,"真实伤害",0)
	call Cun('I0DZ',"毒龙鞭","攻击力",5000,"招式伤害",0,"内力",0,"真实伤害",700)
	call Cun('I0E0',"养吾剑","攻击力",4000,"招式伤害",0,"内力",300,"真实伤害",400)
	call Cun('I0E2',"东灵铁剑","攻击力",5000,"招式伤害",300,"内力",300,"真实伤害",0)
	call Cun('I08V',"江湖·忠","攻击力",10000,"招式伤害",350,"内力",350,"真实伤害",350)
	call Cun('I02S',"镇妖+1","攻击力",1000,"招式伤害",150,"内力",0,"真实伤害",0)
	call Cun('I02M',"镇妖+2","攻击力",2000,"招式伤害",300,"内力",0,"真实伤害",0)
	call Cun('I02Q',"镇妖+3","攻击力",3000,"招式伤害",450,"内力",0,"真实伤害",0)
	call Cun('I02R',"镇妖+4","攻击力",4000,"招式伤害",600,"内力",0,"真实伤害",0)
	call Cun('I02P',"镇妖+5","攻击力",5000,"招式伤害",750,"内力",0,"真实伤害",0)
	call Cun('I01F',"点金","攻击力",500,"招式伤害",50,"内力",20,"真实伤害",0)
	call Cun('I01S',"开山斧","攻击力",450,"招式伤害",30,"内力",0,"真实伤害",0)
	call Cun('I020',"青铜刀","攻击力",0,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01E',"秋叶刃","攻击力",600,"招式伤害",60,"内力",0,"真实伤害",0)
	call Cun('I021',"锁候枪","攻击力",200,"招式伤害",15,"内力",0,"真实伤害",0)
	call Cun('I016',"宣花斧","攻击力",800,"招式伤害",100,"内力",0,"真实伤害",0)
	call Cun('I013',"饮血枪","攻击力",1200,"招式伤害",120,"内力",0,"真实伤害",50)

	call Cun('I022',"布衣","防御",35,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01T',"彩衣","防御",60,"招式伤害",0,"内力",15,"真实伤害",0)
	call Cun('I01H',"虎皮衣","防御",85,"招式伤害",0,"内力",40,"真实伤害",0)
	call Cun('I01G',"蛇皮裘","防御",90,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I017',"开阳衣","防御",150,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I014',"烈火衣","防御",300,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01O',"七星锦服","防御",150,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I04E',"金蝉衣","防御",250,"招式伤害",0,"内力",80,"真实伤害",0)
	call Cun('I00O',"软猬甲","防御",450,"招式伤害",0,"内力",100,"真实伤害",0)
	call Cun('I00F',"六合纵横","防御",700,"招式伤害",200,"内力",100,"真实伤害",200)
	call Cun('I00G',"破军无双","防御",800,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I090',"决战·霸","防御",1000,"招式伤害",0,"内力",250,"真实伤害",0)
	call Cun('I0AL',"少林袈裟","防御",500,"招式伤害",300,"内力",0,"真实伤害",0)
	call Cun('I0DP',"七星道袍","防御",400,"招式伤害",0,"内力",300,"真实伤害",0)
	call Cun('I09Z',"通神","防御",500,"招式伤害",0,"内力",0,"真实伤害",0)

	call Cun('I01Q',"破军帽","防御",20,"招式伤害",0,"内力",0,"真实伤害",30)
	call Cun('I00M',"灭云冠","防御",300,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I08Z',"决战·恶","防御",500,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01R',"破军鞋","防御",25,"招式伤害",0,"内力",0,"真实伤害",30)
	call Cun('I00T',"神行鞋","防御",200,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I00N',"踏风靴","防御",200,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I08Y',"决战·魁",null,0,"招式伤害",0,"内力",0,"真实伤害",500)
	call Cun('I0AM',"神木王鼎",null,0,"招式伤害",100,"内力",100,"真实伤害",100)
	call Cun('I0EP',"子午砂",null,0,"招式伤害",80,"内力",80,"真实伤害",80)
	call Cun('I0DS',"玉扳指",null,0,"招式伤害",150,"内力",150,"真实伤害",150)
	call Cun('I0EQ',"观音泪",null,0,"招式伤害",120,"内力",120,"真实伤害",120)
	call Cun('I0DT',"燕国玉玺",null,0,"招式伤害",150,"内力",150,"真实伤害",150)
	call Cun('I01V',"苍蟒护腕","攻击力",0,"招式伤害",0,"内力",0,"真实伤害",10)
	call Cun('I01U',"纱绒护腕","攻击力",0,"招式伤害",15,"内力",0,"真实伤害",0)
	call Cun('I018',"彩云腕",null,0,"招式伤害",50,"内力",20,"真实伤害",0)
	call Cun('I01D',"天璇护腕",null,0,"招式伤害",100,"内力",100,"真实伤害",100)
	call Cun('I01M',"精钢护腕","防御",30,"招式伤害",40,"内力",20,"攻击力",250)
	call Cun('I00Z',"追月手",null,0,"招式伤害",120,"内力",0,"真实伤害",0)
	call Cun('I00R',"天玑毒掌","攻击力",1200,"招式伤害",0,"内力",0,"真实伤害",150)
	call Cun('I00S',"无魅雷手",null,0,"招式伤害",200,"内力",100,"真实伤害",0)
	call Cun('I00H',"魔影炎掌","攻击力",2000,"招式伤害",300,"内力",0,"真实伤害",0)
	call Cun('I00I',"踏风冰手","攻击力",1800,"招式伤害",0,"内力",150,"真实伤害",0)
	call Cun('I023',"护身符","防御",0,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I024',"环戒","攻击力",0,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01X',"琥珀项链",null,0,"招式伤害",0,"内力",15,"真实伤害",0)
	call Cun('I01Y',"水碧护符",null,0,"招式伤害",10,"内力",15,"真实伤害",0)
	call Cun('I01Z',"闪避护符","防御",0,"招式伤害",15,"内力",0,"真实伤害",0)
	call Cun('I01W',"传家符","防御",0,"招式伤害",0,"内力",0,"真实伤害",15)
	call Cun('I01J',"七绝护符",null,0,"招式伤害",50,"内力",50,"真实伤害",50)
	call Cun('I0DB',"新手神器",null,0,"招式伤害",100,"内力",100,"真实伤害",100)
	call Cun('I0DJ',"新手神器lv.1",null,0,"招式伤害",50,"内力",50,"真实伤害",50)
	call Cun('I0DL',"新手神器lv.2",null,0,"招式伤害",50,"内力",50,"真实伤害",50)
	
	call Cun('I0E8',"游侠印记",null,0,"招式伤害",50,"内力",50,"真实伤害",50)
	call Cun('I0E9',"小侠印记",null,0,"招式伤害",60,"内力",60,"真实伤害",60)
	call Cun('I0EA',"名侠印记",null,0,"招式伤害",90,"内力",90,"真实伤害",90)
	call Cun('I0EB',"大虾印记",null,0,"招式伤害",120,"内力",120,"真实伤害",120)
	call Cun('I0EC',"巨侠印记",null,0,"招式伤害",150,"内力",150,"真实伤害",150)
	call Cun('I0ED',"虾米印记",null,0,"招式伤害",200,"内力",200,"真实伤害",200)
	call Cun('I0EE',"十四天书",null,0,"招式伤害",300,"内力",300,"真实伤害",300)
	call Cun('I01K',"青竹戒指","攻击力",200,"招式伤害",20,"内力",0,"真实伤害",0)
	call Cun('I01I',"星云戒指",null,0,"招式伤害",30,"内力",0,"真实伤害",0)
	call Cun('I019',"白虎符","攻击力",300,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I01A',"蓝魔项链","防御",50,"招式伤害",0,"内力",40,"真实伤害",0)
	call Cun('I01B',"北斗护符","攻击力",500,"招式伤害",0,"内力",0,"真实伤害",60)
	call Cun('I01C',"梦蝶项链",null,0,"招式伤害",50,"内力",0,"真实伤害",40)
	call Cun('I01P',"七星戒指",null,0,"招式伤害",0,"内力",30,"真实伤害",0)
	call Cun('I010',"云海链",null,0,"招式伤害",120,"内力",60,"真实伤害",0)
	call Cun('I00Y',"七情束",null,0,"招式伤害",100,"内力",0,"真实伤害",0)
	call Cun('I011',"影岚护符",null,0,"招式伤害",100,"内力",0,"真实伤害",0)
	call Cun('I012',"玉修护符",null,0,"招式伤害",0,"内力",0,"真实伤害",50)
	call Cun('I00U',"云灭护符","攻击力",1000,"招式伤害",200,"内力",0,"真实伤害",0)
	call Cun('I00V',"抗魔护符",null,0,"招式伤害",0,"内力",150,"真实伤害",100)
	call Cun('I00W',"重生链","防御",100,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I00J',"神迹戒",null,0,"招式伤害",0,"内力",150,"真实伤害",200)
	call Cun('I00K',"如意戒","攻击力",1500,"招式伤害",0,"内力",150,"真实伤害",0)
	call Cun('I00L',"绿扳指","防御",200,"招式伤害",0,"内力",0,"真实伤害",0)
	call Cun('I08W',"江湖·情",null,0,"招式伤害",900,"内力",400,"真实伤害",0)
	call Cun('I08X',"江湖·义",null,0,"招式伤害",800,"内力",0,"真实伤害",500)

	//根骨、悟性、绝学领悟
	call Cun('I00C',"龙鳞剑","福缘",4,"全属性",1,"绝学领悟",2,null,0)
	call Cun('I00B',"倚天剑","悟性",3,"全属性",1,"绝学领悟",2,null,0)
	call Cun('I00D',"屠龙刀","经脉",3,"全属性",1,"绝学领悟",1,null,0)
	call Cun('I04F',"断肠","经脉",2,null,0,null,0,null,0)
	call Cun('I00P',"晶玉扇","悟性",2,"福缘",2,"绝学领悟",1,null,0)
	call Cun('I00Q',"紫金刀","经脉",2,"医术",2,null,0,null,0)
	call Cun('I01N',"七星扇","医术",1,null,0,null,0,null,0)
	call Cun('I01E',"秋叶刃","根骨",1,null,0,null,0,null,0)
	call Cun('I00X',"鸳鸯刀","福缘",2,null,0,null,0,null,0)
	call Cun('I097',"打狗棒","胆魄",3,"全属性",1,"绝学领悟",2,null,0)
	call Cun('I099',"君子剑","悟性",1,"医术",1,"绝学领悟",1,null,0)
	call Cun('I09B',"蛇杖","根骨",4,"全属性",2,"绝学领悟",1,null,0)
	call Cun('I09A',"淑女剑","福缘",1,"经脉",1,"绝学领悟",1,null,0)
	call Cun('I09C',"双剑合璧","悟性",3,"全属性",1,"绝学领悟",3,null,0)
	call Cun('I098',"血刀","根骨",7,"胆魄",4,"绝学领悟",2,null,0)
	call Cun('I09D',"玉箫","福缘",2,"全属性",2,"绝学领悟",3,null,0)
	call Cun('I0DK',"真武剑","悟性",2,"全属性",2,"绝学领悟",3,null,0)
	call Cun('I0DU',"拂尘","悟性",2,"全属性",2,"绝学领悟",3,null,0)
	call Cun('I0DY',"镇岳尚方","福缘",5,"悟性",4,"绝学领悟",3,null,0)
	call Cun('I0EJ',"铁掌令","胆魄",4,"悟性",4,"绝学领悟",2,null,0)
	call Cun('I0DZ',"毒龙鞭","经脉",3,"胆魄",5,"绝学领悟",2,null,0)
	call Cun('I0E0',"养吾剑","胆魄",5,"悟性",4,"绝学领悟",5,null,0)
	call Cun('I0E2',"东灵铁剑","胆魄",5,"经脉",4,"绝学领悟",5,null,0)
	call Cun('I08V',"江湖·忠","全属性",2,"绝学领悟",1,null,0,null,0)
	call Cun('I013',"饮血枪","胆魄",1,null,0,null,0,null,0)
	call Cun('I01L',"精钢剑","胆魄",1,null,0,null,0,null,0)

	call Cun('I01G',"蛇皮裘","经脉",1,null,0,null,0,null,0)
	call Cun('I014',"烈火衣","经脉",1,null,0,null,0,null,0)
	call Cun('I01O',"七星锦服","胆魄",1,null,0,null,0,null,0)
	call Cun('I04E',"金蝉衣","悟性",1,"福缘",1,null,0,null,0)
	call Cun('I00O',"软猬甲","根骨",2,"胆魄",2,"绝学领悟",1,null,0)
	call Cun('I00F',"六合纵横","根骨",2,"胆魄",2,"福缘",1,null,0)
	call Cun('I00G',"破军无双","医术",3,"悟性",2,null,0,null,0)
	call Cun('I090',"决战·霸","全属性",1,"绝学领悟",1,null,0,null,0)
	call Cun('I0AL',"少林袈裟","全属性",1,"根骨",2,null,0,null,0)
	call Cun('I0DP',"七星道袍","全属性",1,"胆魄",2,null,0,null,0)

	call Cun('I01Q',"破军帽","悟性",1,null,0,null,0,null,0)
	call Cun('I00M',"灭云冠","根骨",1,"悟性",2,"经脉",1,"绝学领悟",1)
	call Cun('I08Z',"决战·恶","全属性",1,"绝学领悟",1,null,0,null,0)
	call Cun('I01R',"破军鞋","福缘",1,null,0,null,0,null,0)
	call Cun('I00T',"神行鞋","福缘",3,"经脉",3,null,0,null,0)
	call Cun('I00N',"踏风靴","悟性",2,"福缘",1,"医术",1,null,0)
	call Cun('I08Y',"决战·魁","全属性",1,"绝学领悟",1,null,0,null,0)
	call Cun('I01V',"苍蟒护腕","根骨",1,null,0,null,0,null,0)
	call Cun('I01U',"纱绒护腕","悟性",1,null,0,null,0,null,0)
	call Cun('I01D',"天璇护腕","胆魄",3,null,0,null,0,null,0)
	call Cun('I015',"霓云手套","根骨",1,null,0,null,0,null,0)
	call Cun('I01M',"精钢护腕","根骨",1,null,0,null,0,null,0)
	call Cun('I00Z',"追月手","悟性",2,null,0,null,0,null,0)
	call Cun('I00R',"天玑毒掌","胆魄",2,"经脉",1,null,0,null,0)
	call Cun('I00S',"无魅雷手","悟性",3,"绝学领悟",1,null,0,null,0)
	call Cun('I00H',"魔影炎掌","根骨",2,"经脉",2,"绝学领悟",1,null,0)
	call Cun('I00I',"踏风冰手","悟性",2,"胆魄",2,null,0,null,0)
	call Cun('I01W',"传家符","医术",2,null,0,null,0,null,0)
	call Cun('I0AM',"神木王鼎","医术",5,null,0,null,0,null,0)
	call Cun('I0EP',"子午砂","胆魄",5,null,0,null,0,null,0)
	call Cun('I0DS',"燕国玉玺","悟性",5,null,0,null,0,null,0)
	call Cun('I0DT',"玉扳指","福缘",5,null,0,null,0,null,0)
	call Cun('I0EQ',"观音泪","悟性",4,"经脉",4,null,0,null,0)
	call Cun('I01X',"琥珀项链","经脉",1,null,0,null,0,null,0)
	call Cun('I01Y',"水碧护符","胆魄",1,null,0,null,0,null,0)
	call Cun('I01Z',"闪避护符","福缘",1,null,0,null,0,null,0)
	call Cun('I01J',"七绝护符","福缘",1,null,0,null,0,null,0)
	call Cun('I0DB',"新手神器","全属性",2,null,0,null,0,null,0)
	call Cun('I0DL',"新手神器lv.2","全属性",1,null,0,null,0,null,0)
	call Cun('I0E8',"游侠印记","全属性",1,null,0,null,0,null,0)
	call Cun('I0E9',"小侠印记","全属性",1,"福缘",1,null,0,null,0)
	call Cun('I0EA',"名侠印记","全属性",1,"福缘",2,null,0,null,0)
	call Cun('I0EB',"大虾印记","全属性",1,"福缘",3,null,0,null,0)
	call Cun('I0EC',"巨侠印记","全属性",1,"福缘",4,null,0,null,0)
	call Cun('I0ED',"虾米印记","全属性",1,"福缘",5,null,0,null,0)
	call Cun('I0EE',"十四天书","全属性",3,"福缘",6,null,0,null,0)
	call Cun('I01I',"星云戒指","医术",1,null,0,null,0,null,0)
	call Cun('I01A',"蓝魔项链","医术",1,null,0,null,0,null,0)
	call Cun('I01B',"北斗护符","福缘",1,null,0,null,0,null,0)
	call Cun('I01C',"梦蝶项链","根骨",1,null,0,null,0,null,0)
	call Cun('I01P',"七星戒指","经脉",1,null,0,null,0,null,0)
	call Cun('I010',"云海链","医术",2,null,0,null,0,null,0)
	call Cun('I00Y',"七情束","经脉",2,null,0,null,0,null,0)
	call Cun('I0CH',"郭靖戴过的环戒","根骨",1,null,0,null,0,null,0)
	call Cun('I0DO',"乔峰穿过的草鞋","胆魄",1,null,0,null,0,null,0)
	call Cun('I011',"影岚护符","悟性",2,"经脉",1,null,0,null,0)
	call Cun('I012',"玉修护符","根骨",1,"胆魄",2,null,0,null,0)
	call Cun('I00U',"云灭护符","根骨",2,"医术",1,null,0,null,0)
	call Cun('I00V',"抗魔护符","胆魄",1,"经脉",2,null,0,null,0)
	call Cun('I00W',"重生链","医术",3,null,0,null,0,null,0)
	call Cun('I00J',"神迹戒","福缘",4,null,0,null,0,null,0)
	call Cun('I00K',"如意戒","经脉",1,"胆魄",3,null,0,null,0)
	call Cun('I00L',"绿扳指","医术",1,"胆魄",1,"福缘",2,null,0)
	call Cun('I08W',"江湖·情","全属性",1,"绝学领悟",1,null,0,null,0)
	call Cun('I08X',"江湖·义","全属性",1,"绝学领悟",1,null,0,null,0)

	//攻击速度、暴击伤害、暴击率、杀怪回复、生命回复等等
	call Cun('I00C',"龙鳞剑","攻击速度",30,"暴击伤害",0.6,"暴击率",0.05,null,0)
	call Cun('I00B',"倚天剑","闪避",15,"法力回复",5,"杀怪回复",2000,"伤害回复",500)
	call Cun('I04F',"断肠","攻击速度",30,"暴击率",0.02,null,0,null,0)
	call Cun('I00P',"晶玉扇","攻击速度",25,"杀怪回复",1500,null,0,null,0)
	call Cun('I00Q',"紫金刀","暴击伤害",0.6,"暴击率",0.05,"杀怪回复",1500,null,0)
	call Cun('I01L',"精钢剑","攻击速度",20,"吸血",0.05,"暴击率",0.03,null,0)
	call Cun('I01N',"七星扇","法力回复",2,null,0,null,0,null,0)
	call Cun('I00X',"鸳鸯刀","攻击速度",20,null,0,null,0,null,0)
	call Cun('I097',"打狗棒","攻击速度",60,"暴击伤害",1.5,null,0,null,0)
	call Cun('I099',"君子剑","吸血",0.15,"法力回复",2,"杀怪回复",500,"生命回复",200)
	call Cun('I09B',"蛇杖","暴击伤害",0.9,"暴击率",0.5,null,0,null,0)
	call Cun('I09A',"淑女剑","闪避",15,"伤害回复",500,"暴击伤害",0.3,"暴击率",0.03)
	call Cun('I09C',"双剑合璧","吸血",0.15,"法力回复",5,"杀怪回复",2000,"生命回复",500)
	call Cun('I09C',"双剑合璧","闪避",15,"伤害回复",800,"暴击伤害",0.5,"暴击率",0.05)
	call Cun('I098',"血刀","攻击速度",60,"暴击伤害",0.8,"杀怪回复",10000,null,0)
	call Cun('I09D',"玉箫","法力回复",15,"杀怪回复",2000,"生命回复",1500,null,0)
	call Cun('I0DK',"真武剑","法力回复",10,"杀怪回复",2000,"生命回复",1500,null,0)
	call Cun('I0DU',"拂尘","法力回复",15,"杀怪回复",1000,"生命回复",3000,null,0)
	call Cun('I0DY',"镇岳尚方","攻击速度",60,"暴击伤害",0.5,"杀怪回复",10000,null,0)
	call Cun('I0EJ',"铁掌令","攻击速度",45,"暴击率",0.2,"伤害回复",2000,null,0)
	call Cun('I0DZ',"毒龙鞭","攻击速度",45,"暴击伤害",1,"杀怪回复",10000,null,0)
	call Cun('I0E0',"养吾剑","攻击速度",50,"暴击伤害",0.6,"杀怪回复",10000,null,0)
	call Cun('I0E2',"东灵铁剑","攻击速度",60,"暴击伤害",1.5,"杀怪回复",6000,null,0)
	call Cun('I08V',"江湖·忠","攻击速度",60,"暴击伤害",1,"暴击率",0.2,"杀怪回复",3000)
	call Cun('I02S',"镇妖+1","攻击速度",20,"暴击伤害",0.15,"杀怪回复",300,null,0)
	call Cun('I02M',"镇妖+2","攻击速度",30,"暴击伤害",0.3,"杀怪回复",600,null,0)
	call Cun('I02Q',"镇妖+3","攻击速度",40,"暴击伤害",0.45,"杀怪回复",900,null,0)
	call Cun('I02R',"镇妖+4","攻击速度",50,"暴击伤害",0.6,"杀怪回复",1200,null,0)
	call Cun('I02P',"镇妖+5","攻击速度",60,"暴击伤害",0.75,"杀怪回复",1500,null,0)
	call Cun('I01S',"开山斧","暴击伤害",0.15,"杀怪回复",300,null,0,null,0)
	call Cun('I020',"青铜刀","攻击速度",40,"杀怪回复",0,null,0,null,0)
	call Cun('I0CI',"张无忌用过的青铜刀","攻击速度",60,"杀怪回复",0,null,0,null,0)
	call Cun('I01E',"秋叶刃","攻击速度",15,"杀怪回复",500,null,0,null,0)
	call Cun('I021',"锁候枪","分裂",0.3,"暴击率",0.03,null,0,null,0)
	call Cun('I016',"宣花斧","吸血",0.15,null,0,null,0,null,0)
	call Cun('I013',"饮血枪","攻击速度",20,null,0,null,0,null,0)

	call Cun('I022',"布衣","气血",1000,"杀怪回复",30,"移动速度",30,null,0)
	call Cun('I01T',"彩衣","气血",3000,"伤害回复",70,null,0,null,0)
	call Cun('I01H',"虎皮衣","气血",3000,null,0,null,0,null,0)
	call Cun('I01G',"蛇皮裘","气血",5000,"伤害回复",100,"生命回复",250,null,0)
	call Cun('I017',"开阳衣","气血",10000,null,0,null,0,null,0)
	call Cun('I014',"烈火衣","气血",20000,"闪避",10,null,0,null,0)
	call Cun('I01O',"七星锦服","气血",7000,"攻击速度",30,"伤害回复",300,null,0)
	call Cun('I04E',"金蝉衣","气血",15000,"生命回复",700,"法力上限",20,"法力回复",5)
	call Cun('I00O',"软猬甲","气血",40000,"生命回复",1200,"法力上限",20,null,0)
	call Cun('I00F',"六合纵横","气血",100000,"伤害回复",500,null,0,null,0)
	call Cun('I00G',"破军无双","气血",100000,"生命回复",1500,"闪避",20,null,0)
	call Cun('I090',"决战·霸","气血",100000,"生命回复",2000,"暴击率",0.05,null,0)
	call Cun('I0AL',"少林袈裟","气血",50000,"伤害回复",2000,"暴击伤害",0.7,null,0)
	call Cun('I0DP',"七星道袍","气血",50000,"伤害回复",1500,"暴击伤害",0.7,"法力回复",10)
	call Cun('I09Z',"通神","气血",40000,null,0,null,0,null,0)

	call Cun('I01Q',"破军帽","气血",1500,"伤害回复",150,null,0,null,0)
	call Cun('I00M',"灭云冠","法力上限",40,"暴击伤害",0.2,null,0,null,0)
	call Cun('I08Z',"决战·恶","气血",50000,"攻击速度",50,"伤害回复",800,"法力上限",100)
	call Cun('I01R',"破军鞋","生命回复",150,"移动速度",70,null,0,null,0)
	call Cun('I0DO',"乔峰穿过的草鞋",null,0,"移动速度",100,null,0,null,0)
	call Cun('I00T',"神行鞋","气血",25000,"移动速度",160,"法力上限",25,"法力回复",10)
	call Cun('I00N',"踏风靴","移动速度",180,"杀怪回复",1000,"生命回复",500,"法力回复",4)
	call Cun('I08Y',"决战·魁","移动速度",200,"闪避",30,"伤害回复",600,"暴击伤害",0.8)

	call Cun('I01V',"苍蟒护腕","攻击速度",15,"暴击率",0.05,"特殊攻击",2,null,0)
	call Cun('I01U',"纱绒护腕","攻击速度",15,"暴击伤害",0.15,"特殊攻击",3,null,0)
	call Cun('I018',"彩云腕","生命回复",200,"特殊攻击",3,null,0,null,0)
	call Cun('I01D',"天璇护腕","攻击速度",20,"特殊攻击",5,"气血",6000,null,0)
	call Cun('I015',"霓云手套","吸血",0.03,"生命回复",300,"法力上限",20,"特殊攻击",10)
	call Cun('I01M',"精钢护腕","气血",2000,"特殊攻击",3,null,0,null,0)
	call Cun('I00Z',"追月手","攻击速度",25,"伤害回复",400,"法力回复",5,"特殊攻击",6)
	call Cun('I00R',"天玑毒掌","攻击速度",30,"伤害回复",400,"暴击伤害",0.3,"暴击率",0.02)
	call Cun('I00S',"无魅雷手","攻击速度",30,"杀怪回复",1500,"法力回复",5,"特殊攻击",7)
	call Cun('I00H',"魔影炎掌","攻击速度",40,"杀怪回复",2000,"特殊攻击",8,null,0)
	call Cun('I00I',"踏风冰手","攻击速度",40,"伤害回复",500,"暴击伤害",0.5,"暴击率",0.05)

	call Cun('I023',"护身符","伤害回复",40,null,0,null,0,null,0)
	call Cun('I024',"环戒","杀怪回复",100,"生命回复",50,null,0,null,0)
	call Cun('I0CH',"郭靖戴过的环戒","闪避",20,"杀怪回复",100,"生命回复",50,null,0)
	call Cun('I01W',"传家符","杀怪回复",150,"生命回复",300,null,0,null,0)
	call Cun('I01X',"琥珀项链","杀怪回复",250,"生命回复",150,null,0,null,0)
	call Cun('I01Y',"水碧护符","杀怪回复",200,"生命回复",120,"法力回复",3,"伤害回复",60)
	call Cun('I01Z',"闪避护符","杀怪回复",150,"闪避",10,"伤害回复",80,null,0)
	//call Cun('I01J',"七绝护符","攻击速度",30,"暴击率",0.02,null,0,null,0)
	call Cun('I01K',"青竹戒指","法力回复",3,null,0,null,0,null,0)
	call Cun('I01I',"星云戒指","杀怪回复",300,"暴击伤害",0.1,null,0,null,0)
	call Cun('I019',"白虎符","气血",5000,null,0,null,0,null,0)
	call Cun('I01A',"蓝魔项链","杀怪回复",800,"法力上限",40,"法力回复",5,null,0)
	call Cun('I01B',"北斗护符","移动速度",80,"生命回复",600,null,0,null,0)
	call Cun('I01C',"梦蝶项链",null,0,"攻击速度",15,"气血",8000,"伤害回复",100)
	call Cun('I01P',"七星戒指",null,0,"攻击速度",15,"生命回复",200,"暴击伤害",0.15)
	call Cun('I010',"云海链","气血",13000,"杀怪回复",500,"法力上限",25,"暴击伤害",0.2)
	call Cun('I00Y',"七情束","生命回复",400,"法力上限",20,"法力回复",5,"暴击率",0.02)
	call Cun('I011',"影岚护符","吸血",0.05,"攻击速度",20,"移动速度",100,"生命回复",400)
	call Cun('I012',"玉修护符","气血",25000,"杀怪回复",700,"生命回复",600,"暴击率",0.01)
	call Cun('I00U',"云灭护符","攻击速度",40,"杀怪回复",1000,"暴击伤害",0.3,null,0)
	call Cun('I00V',"抗魔护符","吸血",0.1,"气血",25000,"法力上限",15,"暴击伤害",0.4)
	call Cun('I00W',"重生链","吸血",0.05,"攻击速度",45,"生命回复",700,"暴击率",0.01)
	call Cun('I00J',"神迹戒","杀怪回复",1000,"伤害回复",500,"法力回复",8,null,0)
	call Cun('I00K',"如意戒","攻击速度",40,"伤害回复",400,"法力上限",50,null,0)
	call Cun('I00L',"绿扳指","攻击速度",50,"生命回复",500,"气血",20000,"暴击伤害",0.5)
	call Cun('I08W',"江湖·情","生命回复",1000,"法力回复",7,"暴击率",0.1,null,0)
	call Cun('I08X',"江湖·义","吸血",0.3,"攻击速度",0.5,"暴击伤害",1,"暴击率",0.05)

	call Cun('I0E8',"游侠印记","杀怪回复",250,"生命回复",150,"法力回复",3,null,0)
	call Cun('I0E9',"小侠印记","杀怪回复",250,"生命回复",150,"法力回复",5,null,0)
	call Cun('I0EA',"名侠印记","杀怪回复",350,"生命回复",200,"法力回复",8,null,0)
	call Cun('I0EB',"大侠印记","杀怪回复",550,"生命回复",500,"法力回复",8,null,0)
	call Cun('I0EC',"巨侠印记","杀怪回复",750,"生命回复",700,"法力回复",10,null,0)
	call Cun('I0ED',"虾米印记","杀怪回复",1000,"生命回复",1000,"法力回复",10,null,0)
	call Cun('I0EE',"十四天书","杀怪回复",2000,"生命回复",2000,"法力回复",20,"暴击伤害",1)

endfunction
