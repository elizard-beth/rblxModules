local Instance2 = { }
local DestroyedObjects = { }
local Objects = {["nil"] = nil}
local Errors = {
	[001] = {["ERROR"] = true,["Code"] = 001, ["Help"] = "This feature is currently disabled/not functional",["Information"] = "This feature is currently disabled/not functional"};
	[002] = {["ERROR"] = true,["Code"] = 002, ["Help"] = "This error is UNKNOWN, we cannot provide support for it", ["Information"] = "This error is UNKNOWN"};
}


Instance2.new = function(Name, Type, Parent)	
	assert(type(Name) == "string")
	assert(type(Type) == "string")
	
	local Object = Instance.new(Type or "Part")
	Object.Parent = Parent or game.ReplicatedStorage.Unparented_Instances
	Object.Name = Name
	if Objects[Name] == nil then Objects[Name] = {} end
	if not DestroyedObjects[Name] then DestroyedObjects[Name] = {} end
	
	local i = #Objects[Name] + 1
	--for i = 1, 9e9 do wait()
	    if not Objects[Name][i] then
			Objects[Name][i] = {
				["Type"] = Type; 
				["Name"] = Name;
				["Instance"] = Object;

			Destroy = function(cache)
				if cache == true then
					DestroyedObjects[Name][i] = Objects[Name][i]
				end
					
				Objects[Name][i]["Instance"]:Destroy()
				Objects[Name][i] = nil
				return 
			end;

			ClearAllChildren = function()
				for _, v in pairs (Object:GetChildren()) do
					v:Destroy()
				end
				return 
			end;

			Clone = function(a,Name_A, Parent_A)
				local Clone = Object:Clone()
				Clone.Name = Name_A or tostring(typeof(Object))
				Clone.Parent = Parent_A or game.ReplicatedStorage.Unparented_Instances
	
				return Clone
			end;
				
			WaitForDescendant = function(Parent, DescendantName, YieldLength)
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
				end;	

		 WaitForChild = function(ChildName, YieldLength)
				if (YieldLength == nil) or (YieldLength < 0.2)  or (YieldLength > 500) then 
					YieldLength = 5;
				end
						
				if (Object:FindFirstChild(ChildName)) then return true; end

				for i = 0, math.huge, 0.3 do
					wait(0.3);
						
					if Object:FindFirstChild(ChildName) then 
						return true;
					elseif (i >= YieldLength) then
						return false;
					end
			   end
		  end
			}

	    end			
		return Objects[Name][i]["Instance"]
	--end
end
Instance2.old = function(Name,  n)
	assert(type(Name) == "string")
	return DestroyedObjects[Name][n or 1] or Errors[001]
end

Instance2.getAll = function()
	return Objects
end

Instance2.get = function(Name, n)
	assert(type(Name) == "string")
	return Objects[Name][n or 1]
end

Instance2.getInstance = function(Name, n)
	assert(type(Name) == "string")
	return Objects[Name][n or 1]["Instance"]
end

Instance2.getAllDestroyed = function()
	return DestroyedObjects
end

Instance2.clearAll = function()
	if game.Players.LocalPlayer then return nil end
	for _, v in pairs(Objects) do wait()
		for _, b in pairs(v) do wait()
			b:Destroy()
		end
	end
end

return Instance2
