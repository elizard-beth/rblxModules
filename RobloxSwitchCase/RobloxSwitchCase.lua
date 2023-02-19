local aesthetic = {
	switch = function(n, array, str) 
		for _, v in ipairs(array) do 
			if v[1] == n then 
				v[2]()
				if v[3] and v[3] == "break" then 
					break
				end
			end 
		end
	end,

	case = function (a, b, c)
		return {a,b,c}
	end
}
local efficient = {
	switch = function(n, array)
		for i, v in pairs(array) do
			if i == n then 
				v()
				break
			end
		end 
	end
}
return {efficient,aesthetic}
