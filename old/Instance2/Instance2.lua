local Instance2 = { }
local DestroyedObjects = { }
local Objects = {["nil"] = nil}

Instance2.init = function()
	_G.Instance2 = function() return require(script.Parent) end

	local Instance2 = require(script.Parent)
	Instance.new("Folder", game.ReplicatedStorage).Name = "Unparented_Instances"
end


Instance2.new = function(Name: string, Type: string, Parent: Instance)	
	local Object = Instance.new(Type or "Part")
	Object.Parent = Parent or game.ReplicatedStorage.Unparented_Instances
	Object.Name = Name
	if Objects[Name] == nil then Objects[Name] = {} end
	if not DestroyedObjects[Name] then DestroyedObjects[Name] = {} end

	local i = #Objects[Name] + 1
	
	--if not Objects[Name][i] then
		Objects[Name][i] = {
			["Type"] = Type; 
			["Name"] = Name;
			["Instance"] = Object;

			Destroy = function(self, cache: boolean)
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

			Clone = function(self, Name_A: string, Parent_A: string)
				local Clone = Object:Clone()
				Clone.Name = Name_A or tostring(typeof(Object))
				Clone.Parent = Parent_A or game.ReplicatedStorage.Unparented_Instances

				return Clone
			end;

			WaitForDescendant = function(self, Parent, DescendantName, YieldLength)
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

			WaitForChild = function(self, ChildName, YieldLength)
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

	--end		
	return Objects[Name][i]["Instance"]
end
Instance2.old = function(Name: string,  n: number)
	return DestroyedObjects[Name][n or 1] 
end

Instance2.getAll = function()
	return Objects
end

Instance2.clearCache = function() 	
	if game.Players.LocalPlayer then return nil end
	Instance2.clearAll()
	Objects = {["nil"] = nil}
	DestroyedObjects = {} 
end

Instance2.get = function(Name: string, n: number)
	return Objects[Name][n or 1]
end

Instance2.getInstance = function(Name: string, n: number)
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
