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
