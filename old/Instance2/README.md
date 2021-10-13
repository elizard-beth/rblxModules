
Example code

local Instance2 = _G.Instance2() --// require(workspace.Instance2) would be recommended 
Instance2.new("Main", "script", game.Workspace)

Version 0.1 , beta, expect bugs, unadded features, etc.

Features:
- "Caching" feature, if allowed, destroyed instances's information (properties, etc.) may
be kept within a dictionary, and can be fetched using Instance2.old()
- "Get" functions
- More than just Instance.new xdd
- and more.........


Example code:
```lua
local Instance2 = require(workspace.Instance2) or _G.Instance2() -- require the module
Instance2.new("scipt", "Script", workspace) -- create the object, along with its instance
Instance2.get("scipt",1):Destroy(true) -- destroy the object, along with its instance
print(Instance2.get("scipt")) -- get the object, as it does not exist it will --> nil
print(Instance2.old("scipt")) -- get the cached object, as it exists it will --> {...}
```

Functions:
### Instance2.new(Name, Type, Parent) --> create a new object and instance
### Instance2.old(Name, n) --> find a cached destroyed object
### Instance2.getAll() --> returns all objects
### Instance2.get(Name, n) --> returns an object
### Instance2.getInstance(Name, n) --> returns an objects instance
### Instance2.getAllDestroyed() --> returns all cached objects
### Instance2.clearAll() --| Server-sided ONLY --> destroys all objects created with Instance2



Updates:
First update in a while \\ 20/07/2021:
- Fixed clearAll()
