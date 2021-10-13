â ï¸ WARNINGâ ï¸
â ï¸ THIS MODULE HAS NOT BEEN CORRECTLY TESTED â ï¸

Created by WideSteal321/widesteal. Do not steal.

How to use this module:
This module first requires HTTP services to be enabled.
requiring this module returns an array of 4 functions, these are:
- GetAsyncProxy
- GetAsyncSearchProxy
- GetAsync
- GetAsyncSearch

*ALL OF WHICH MAKE HTTP GET REQUESTS*

As you can probably tell these are all very similar, but they all
do very different things. Let's look at them:

### GetAsyncProxy( Proxy: string, Location: string, Information: array )
Proxy is (obviously) the Proxy server you may want to use for 
the catalog API, the default is rprxy.deta.dev.
Information is an array of what comes after the link as "?x=x&y=y"
Location is the exact link, it starts at https://rprxy.deta.dev/catalog/v1/,
you may want to add to this.

### GetAsyncSearchProxy( Proxy: string, Information: array )
Proxy is (obviously) the Proxy server you may want to use for 
the catalog API, the default is rprxy.deta.dev.
Information is an array of what comes after the link as "?x=x&y=y"

### GetAsync( Information: array, Location: string )
Information is an array of what comes after the link as "?x=x&y=y"
Location is the exact link, it starts at https://catalog.roblox.com/v1/,
you may want to add to this.

### GetAsyncSearch( Information: array )
Information is an array of what comes after the link as "?x=x&y=y"
]]
