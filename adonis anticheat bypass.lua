for i,v in pairs(getgc(true)) do
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
    end
end

--[[
--in case adonis devs push this update:
--https://cdn.discordapp.com/attachments/1085709886509301941/1136467734599843920/image.png

--i did this whilst i was sleepy dont judge me
local shit = getrenv()

if not getgenv().thug  then
	getgenv().thug = true
	old = hookfunction(shit.debug.info, function(a, str)
		if str == 'slanf' then
			wait(9e9)
			return
		end
		return old(a, str)
	end)
	print 'thug'
end
print 'thug'
]]
