local a = getgenv and getgenv()
if not a then
    return
end

-- Debounce diganti prefix n3 biar ga bentrok sama luxy lama
if a.n3_router_debounce and (tick() - a.n3_router_debounce) <= 5 then
    return
end
a.n3_router_debounce = tick()

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local b = {
    [107778070777162] = "N3-StealAnEgg.lua",
}
local c = b[game.PlaceId]
if not c then
    warn("N3 Hub: PlaceId tidak terdaftar!")
    return
end

pcall(function()
    if not loadstring then
        return
    end

    local d = tostring(math.random(10000, 99999))
    local e = "https://raw.githubusercontent.com/ZedFu3/N3-Hub/main/Games/" .. c .. "?nocache=" .. d

    local f = game:HttpGet(e)
    if f and f ~= "" then
        getgenv().N3_SECURE_LOAD = true
        loadstring(f)()
    else
        warn("N3 Hub Don't Loaded")
    end
end)
