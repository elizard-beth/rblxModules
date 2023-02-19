SwitchCase has two modes: efficient and aesethetic. 
Efficient is designed with pure efficiency in mind, 
while aesthetic is designed to look close to other
programming languages respsective switch cases.

Please place in ReplicatedStorage.

Efficient use example:
```lua
local a=require(game.ReplicatedStorage.SwitchCase)[1];local switch=a.switch;local case=a.case

switch(1, {
  [1] = function()
	print(1)
  end,

  [2] = function()
	print(2)
  end,
})
```

Aesthetic use example:
```lua
local a=require(game.ReplicatedStorage.SwitchCase)[2];local switch=a.switch;local case=a.case

switch(1, { 
	case(2, function() 
		print(2)
	end, 'break'),
	case(1, function()
		print(1)
	end, 'break')
}, 'break')
```
