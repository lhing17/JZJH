---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/1 13:28
---

local common_util = require('jass.util.common_util')
local location = {}

local mt = {}
location.__index = mt

mt.type = 'location'
mt.x = 0
mt.y = 0

function mt:get_x()
    return self.x
end

function mt:get_y()
    return self.y
end

function mt:move_to(x, y)
    self.x = x
    self.y = y
end

function mt:remove()
    location[self.handle_id] = nil
end

function location.create(x, y)
    local l = {}
    setmetatable(l, location)
    l.x = x
    l.y = y
    l.handle_id = common_util.generate_handle_id()
    location[l.handle_id] = l
    return l
end

return location