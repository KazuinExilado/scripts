--bypass no anti-cheat do adonis
local adonisremote
local detectfunc
local hook = hookfunction or replaceclosure

for i,v in pairs(getgc(true)) do
	if type(v) == 'table' and rawget(v, 'Detected') then
		local f = rawget(v, 'Detected')

		if typeof(f) == 'function' and islclosure(f) then
			detectfunc = f
		end
	elseif type(v) == 'table' and rawget(v, 'Object')
		and rawget(v, 'Function')
		and rawget(v, 'FireServer')
		and rawget(v, 'Events') then
       		adonisremote = rawget(v, 'Object')
	end
end

hook(detectfunc, function(...)
	local args = {...}
	if args[1] == '_' and args[2] == '_' and args[3] == true then
		return true
	end
	return false
end)

--bypass no anti-cheat do cda
local mt = getrawmetatable(game)
local namecall = mt.__namecall
setreadonly(mt, false)

function infiniteyield(this, ...)
	return wait(9e9)
end

for i, v in pairs(getnilinstances()) do
	if v:IsA'RemoteEvent' and v ~= adonisremote then
		hook(v.FireServer, infiniteyield)
		hook(v.fireServer, infiniteyield)
	end
end

mt.__namecall = function(this, ...)
	local args = {...}

	if tonumber(this.Name) then
		return wait(9e9)
	end

	return namecall(this, table.unpack(args))
end

setreadonly(mt, true)
