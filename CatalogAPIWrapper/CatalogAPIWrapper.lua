local HTTP = game:GetService("HttpService")
local InsertService = game:GetService("InsertService")

return {
	GetAsyncProxy = function(Proxy, Location, Information)
		if not Proxy then 
			Proxy = "https://rprxy.deta.dev/catalog/v1/"
		end
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Info = nil
			Proxy = Proxy .. (Location or "") .. "?" .. Information
		else
			Proxy = Proxy .. (Location or "") 
		end
		
		return HTTP:GetAsync(Proxy)
	end,

	GetAsyncSearchProxy = function(Proxy, Information)
		if not Proxy then 
			Proxy = "https://rprxy.deta.dev/catalog/v1/search/items/details"
		end
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Info = nil
			Proxy = Proxy .. "?" .. Information
		end
		
		return HTTP:GetAsync(Proxy)
	end,

	GetAsync = function(Information, Location)
		local Site;
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Info = nil
			Site = "https://catalog.roblox.com/v1/" .. (Location or "") .. "?" .. Information
		else
			Site = "https://catalog.roblox.com/v1/" .. (Location or "")
		end

		return HTTP:GetAsync(Site .. (Information or ""))
	end,

	GetAsyncSearch = function(Information)
		local Site;
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Info = nil
			Site = "https://catalog.roblox.com/v1/search/items/details?" .. Information
		else
			Site = "https://catalog.roblox.com/v1/search/items/details"
		end

		return HTTP:GetAsync(Site .. (Information or ""))
	end,
}
