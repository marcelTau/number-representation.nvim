if vim.g.loaded_number_represenation then
    return
end

vim.g.loaded_number_representation = 1

----- plugin code -----

local M = {}

local function removeLeadingUnderscore(str)
    if str:sub(1,1) == "_" then
        str = str:sub(2, #str)
    end
    return str
end

local function numberToBinStr(x)
	local ret=""
	while x~=1 and x~=0 do
		ret=tostring(x%2)..ret
		x=math.modf(x/2)
	end
	ret=tostring(x)..ret

    local s = string.reverse(ret)

    local new_ret = ""

    for i = 0, #s do
        if i % 4 == 0 and i ~= 0 then
            new_ret = new_ret .. "_"
        end
        new_ret = new_ret .. s:sub(i + 1, i + 1)
    end

    new_ret = removeLeadingUnderscore(new_ret)
    new_ret = string.reverse(new_ret)
    new_ret = removeLeadingUnderscore(new_ret)
    return new_ret
end

M.get_representation = function()
    local cursorword = vim.fn.expand "<cword>"
    local base_10_number = tonumber(cursorword, 10)
    if base_10_number == nil then
        print("error")
        return
    end
    local base_10 = tostring(base_10_number)
    print(string.format("%s:\n - base 2:  0b%s\n - base 10: %s\n - base 16: 0x%x\n",
          cursorword,
          numberToBinStr(base_10) or "-",
          base_10 or "-",
          base_10))
end

return M
