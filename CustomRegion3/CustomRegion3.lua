-- Made by WideSteal321. Do not steal and upload as your own.

local Regions = { }
local RegionsFolder = Instance.new("Folder")
RegionsFolder.Name = "Regions__"
RegionsFolder.Parent = workspace

return {
	new = function(Vector_1, Vector_2, Orientation, CFrame_)
		local Region = Region3.new(Vector_1, Vector_2)

		local Part = Instance.new("Part")
		Part.Name = math.random(100,100000)
		Part.Anchored = true
		Part.Transparency = 1
		Part.CanCollide = false
		Part.Orientation = Orientation or Vector3.new(0,0,0)
		Part.CFrame = CFrame_ or Region.CFrame
		Part.Size = Region.Size
		Part.Position = Vector3.new(Part.Position.X, Part.Position.Y, Part.Position.Z - 10)
		Part.Parent = workspace.Regions__

		Regions[Part] = {
			instance = Part,
			CFrame = Part.CFrame,
			Size = Part.Size,
			GetParts = function(MaxParts, Ignore)
				local Parts = workspace:GetPartsInPart(Part, 
					OverlapParams.new { 
						MaxParts = MaxParts or 1000
					}
				)	
				pcall(function() Parts[Ignore] = nil end)
				
				return Parts
			end,
			Destroy = function()
				Part:Destroy()
				Regions[Part] = nil
			end,
		}
		
		return Regions[Part]
	end,
	FromParts = function(Part1, Part2, Orientation, CFrame_)
		local Region = Region3.new(Part1.Position, Part2.Position)

		local Part = Instance.new("Part")
		Part.Name = math.random(100,100000)
		Part.Anchored = true
		Part.Transparency = 1
		Part.CanCollide = false
		Part.Orientation = Orientation or Vector3.new(0,0,0)
		Part.CFrame = CFrame_ or Region.CFrame
		Part.Size = Region.Size
		Part.Position = Vector3.new(Part.Position.X, Part.Position.Y, Part.Position.Z - 10)
		Part.Parent = workspace.Regions__

		Regions[Part] = {
			instance = Part,
			CFrame = Part.CFrame,
			Size = Part.Size,
			GetParts = function(MaxParts, Ignore)
				local Parts = workspace:GetPartsInPart(Part, 
					OverlapParams.new { 
						MaxParts = MaxParts or 1000
					}
				)	
				pcall(function() Parts[Ignore] = nil end)

				return Parts
			end,
			Destroy = function()
				Part:Destroy()
				Regions[Part] = nil
			end,
		}

		return Regions[Part]		
	end,
}
