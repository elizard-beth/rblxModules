function WaitForDescendant(Parent, DescendantName, YieldLength)
	assert(typeof(Parent) == "Instance", "Must be an instance");
	assert(type(DescendantName) == "string", "Must be a string");
	assert(type(YieldLength) == "number" or "nil", "Must be nil or a number");
	
	if (YieldLength == nil) or (YieldLength < 0.2)  or (YieldLength > 500) then 
		YieldLength = 5;
	end

	local function FindFirstDescendant(Parent, DescendantName2)
		for _, v in pairs(Parent:GetDescendants()) do
			pcall(function()
				if (v.Name == DescendantName2) then
					return true;
				end
			end)
		end
		return false;
	end

	if (FindFirstDescendant(Parent, DescendantName)) then return true; end

	for i = 0, math.huge, 0.3 do
		wait(0.3);

		if (FindFirstDescendant(Parent, DescendantName)) then 
			return true;
		elseif (i >= YieldLength) then
			return false;
		end
	end
end

return WaitForDescendant
