---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/06 11:47
---

local gamedifficulty = {}

local mt = {}
gamedifficulty.__index = mt

mt.type = 'gamedifficulty'
mt.name = ''

function gamedifficulty.init()
	local gamedifficulty_names={}
	for i = 1, #gamedifficulty_names do
		local ga = {}
		ga.name = gamedifficulty_names[i]
		setmetatable(ga, gamedifficulty)
		table.insert(gamedifficulty, ga)
	end
end

return gamedifficulty