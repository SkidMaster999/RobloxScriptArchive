local blacklist = {
    "discord.com",
    "discordapp.com",
    "webhook",
    "grabify",
    "webhook.site",
    "ip-api",
    "geoip"
}
local function isBlocked(url)
    url = tostring(url):lower()
    for _, bad in ipairs(blacklist) do
        if string.find(url, bad, 1, true) then
            return true
        end
    end
    return false
end
local function hookHttpFunction(funcName)
    local oldFunc = nil
    if syn and syn[funcName] then
        oldFunc = syn[funcName]
        syn[funcName] = function(...)
            local url = select(1, ...)
            if isBlocked(url) then
                return nil
            end
            return oldFunc(...)
        end
    elseif http and http[funcName] then
        oldFunc = http[funcName]
        http[funcName] = function(...)
            local url = select(1, ...)
            if isBlocked(url) then
                return nil
            end
            return oldFunc(...)
        end
    elseif _G and _G[funcName] then
        oldFunc = _G[funcName]
        _G[funcName] = function(...)
            local url = select(1, ...)
            if isBlocked(url) then
                return nil
            end
            return oldFunc(...)
        end
    else
        if type(_G[funcName]) == "function" then
            oldFunc = _G[funcName]
            _G[funcName] = function(...)
                local url = select(1, ...)
                if isBlocked(url) then
                    return nil
                end
                return oldFunc(...)
            end
        end
    end
end
local funcsToHook = {
    "HttpGet",
    "HttpPost",
    "HttpGetAsync",
    "HttpPostAsync",
    "request",
    "httprequest",
    "requestAsync"
}
for _, funcName in ipairs(funcsToHook) do
    hookHttpFunction(funcName)
end
local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldNamecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if (method == "HttpGet" or method == "HttpPost" or method == "HttpGetAsync" or method == "HttpPostAsync") then
        local url = tostring(...)
        if isBlocked(url) then
            return nil
        end
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)
