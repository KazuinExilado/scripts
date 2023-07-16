--bypass no anti-cheat do adonis
loadstring(game:HttpGet'https://raw.githubusercontent.com/KazuinExilado/scripts/main/adonis%20anticheat%20bypass.lua')()

--bypass no anti-cheat do cda
local mt = getrawmetatable(game)
local namecall = mt.__namecall
local hook = hookfunction or replaceclosure
setreadonly(mt, false)

function infiniteyield(this, ...)
    return wait(9e9)
end

for i, v in pairs(getnilinstances()) do
    if v:IsA'RemoteEvent' then
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
