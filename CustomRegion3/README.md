Made by WideSteal321. Do not steal and upload as your own.


To get set up, please use `local Region3_2 = require([wherever you 
	have placed the module])`.
	
Basic functions:	
- Region3_2.new(Vector_1: Vector3, Vector_2: Vector3, 
		Orientation: Vector3 (optional), CFrame_: CFrame (optional))
		
This function creates a new Region3_2 instance, represented as a part.
- Region3_2.FromParts(Part1: Part, Part2: Part,
		Orientation: Vector3 (optional), CFrame_: CFrame (optional))
		
This function creates a new Region3_2 instance from one part to another, represented as a part.


Region3_2 instance methods/properties:
- Region.instance

Returns the actual instance, should not be modified
- Region.CFrame 

Returns the CFrame of the instance, can be modified
- Region.Size

Returns the Size of the instance, can be modified
- Region:GetParts(MaxParts: number, Ignore: any)

Returns an array of all of the parts that are inside of the instance
- Region:Destroy()

Completely destroys the region.
		
Example: 
```lua
local Region3_2 = require(script.Parent.Region3_2)
local Region = Region3_2.new(Vector3.new(1,1,1),Vector3.new(12,2,2), 
	Vector3.new(1,1,1), nil)
print(Region:GetParts())
print(Region.CFrame)
Region:Destroy()
```
