print'provavelmente trocaram de anti-cheat'
--[[
if getgenv().tarantulaveia then return end
getgenv().tarantulaveia = true

local Encrypt
local Remote
local eventData
local client
local Core
local old_fireServer
local old_FireServer

local AdonisRemote = game:GetService'ReplicatedStorage':FindFirstChild('__FUNCTION', true).Parent

local mt = getrawmetatable(game)
local namecall = mt.__namecall

setreadonly(mt, false)

for i, v in pairs(getnilinstances()) do
	if v:IsA'RemoteEvent' then
            local a
            local b

	    a = hookfunction(v.FireServer, function(...)
                if checkcaller() then
                    return a(...)
                end
                return wait(9e9)
            end)

	    b = hookfunction(v.fireServer, function(...)
                if checkcaller() then
                    return b(...)
                end
                return wait(9e9)
            end)
	end
end

for i, v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'Detected') then
        local f = rawget(v, 'Detected')
        if typeof(f) == 'function' and islclosure(f) then
            hookfunction(f, function(...)
                local args = {...}
                if args[1] == '_' and args[2] == '_' and args[3] == true then
                    return true
                end
                return false
            end)
        end
    elseif type(v) == 'table' and rawget(v, 'Encrypt') then
        if type(rawget(v, 'Encrypt')) == 'function' and islclosure(rawget(v, 'Encrypt')) then
            Remote = v
        end
    elseif type(v) == 'table' and rawget(v, 'DepsName') and rawget(v, 'RemoteName') then
        client = v
    elseif type(v) == 'table' and rawget(v, 'LastUpdate') and rawget(v, 'LoadCode') then
        Core = v
    elseif type(v) == 'table' and rawget(v, 'Object') and rawget(v, 'Function') and rawget(v, 'FireServer') and
        rawget(v, 'Events') then
        eventData = v
    end
end

mt.__namecall = function(this, ...)
	local args = {...}

	if tonumber(this.Name) then
		return wait(9e9)
	end

	return namecall(this, table.unpack(args))
end

Encrypt = rawget(Remote, 'Encrypt')

old_fireServer = hookfunction(AdonisRemote.fireServer, function(...)
    if checkcaller() then
        return old_fireServer(...)
    end
    return wait(9e9)
end)

old_FireServer = hookfunction(AdonisRemote.FireServer, function(...)
    if checkcaller() then
        return old_FireServer(...)
    end
    return wait(9e9)
end)

setreadonly(mt, true)

task.spawn(function()
    while true do
        --Core.LastUpdate = os.time()
        --vai tarantula goza
        AdonisRemote:FireServer({
            Mode = "Fire",
            Module = client.Module,
            Loader = client.Loader,
            Sent = Remote.Sent,
            Received = Remote.Received
        }, Encrypt("ClientCheck", Core.Key), {
            Sent = Remote.Sent or 0,
            Received = Remote.Received
        }, client.DepsName)
        task.wait '10'
    end
end)

]]
