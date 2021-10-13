-- Services
local HTTP = game:GetService("HttpService")
--local InsertService = game:GetService("InsertService") // Possible future use

return {
	GetAsyncProxy = function(Proxy, Location, Information)
		-- Default proxy
		if not Proxy then 
			Proxy = "https://rprxy.deta.dev/catalog/v1/"
		end
		
		-- Handle information
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Info = nil
			Proxy ..= (Location or "") .. "?" .. Information
		else
			Proxy ..= (Location or "") 
		end
		
		-- Make and return request
		return HTTP:GetAsync(Proxy) or "HTTP 408/404"
	end,

	GetAsyncSearchProxy = function(Proxy, Information)
		-- Default proxy
		if not Proxy then 
			Proxy = "https://rprxy.deta.dev/catalog/v1/search/items/details"
		end
		
		-- Handle information
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
			Proxy ..= "?" .. Information
		end
		
		-- Make and return request
		return HTTP:GetAsync(Proxy) or "HTTP 408/404"
	end,

	GetAsync = function(Information, Location)
		-- Handle information
		local Site = "https://catalog.roblox.com/v1/" .. (Location or "")
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
		end

		-- Make and return request
		return HTTP:GetAsync(Site .. "?" .. (Information or "")) or "HTTP 408/404"
	end,

	GetAsyncSearch = function(Information)
		-- Handle information
		local Site = "https://catalog.roblox.com/v1/search/items/details"
		if Information then 
			local Info = ""
			for _, v in pairs(Information) do
				Info ..= "&" .. v
			end
			Information = Info 
		end

		-- Make and return request
		return HTTP:GetAsync(Site .. "?" .. (Information or "")) or "HTTP 408/404"
	end,
}
