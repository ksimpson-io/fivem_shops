QBCore = exports["qb-core"]:GetCoreObject()
OxInv = exports.ox_inventory
PlayerData = {}
Interactions = {}
Peds = {}
Blips = {}
CurrentShop = {}
Payload = {}
CachedShops = Config.Shops

KillPayload = function()
    Payload = {}
    LocalPlayer.state:set("basicshops", false, true)
end

KillShop = function(id)
    Interactions[id] = nil
    CurrentShop = {}
    CurrentShop = {}
    KillPayload()
    DeleteEntity(Peds[id])
end

---@param shopID string
local GetShopCfg = function(shopID)
    CachedShops[shopID] = CachedShops[shopID] or lib.callback.await("frudy_shops:server:GetShop", false, shopID)

    return CachedShops[shopID]
end

--- @param coords vector3
--- @param shopCfg table
--- @param shopKey string
CreateShopBlip = function(coords, shopCfg, shopKey)
    local blipCfg = shopCfg.blip
    if (not blipCfg) or (blipCfg.disabled) then return end

    local shopBlip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(shopBlip, blipCfg.sprite)
    SetBlipScale(shopBlip, blipCfg.size or 0.6)
    SetBlipDisplay(shopBlip, 6)
    SetBlipColour(shopBlip, blipCfg.color)
    SetBlipAsShortRange(shopBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(shopCfg.label)
    EndTextCommandSetBlipName(shopBlip)

    Blips[shopKey] = shopBlip
end

--- @param coords vector3
--- @param pedCfg table | nil
CreateShopPed = function(coords, pedCfg)
    if (not Config.UsePeds) or (not pedCfg) or (pedCfg.disabled) or (not (pedCfg.models)) or (not next(pedCfg.models)) then return end

    local shopModel = pedCfg.models[math.random(1, #pedCfg.models)]
    local id = "frudy_shops_ped_" .. tostring(coords)
    local pedZone = BoxZone:Create(vec3(coords.x, coords.y, coords.z), 15.0, 15.0, {
        name = id,
        offset = {0.0, 0.0, 0.0},
        scale = {1.0, 1.0, 1.0},
        debugPoly = false,
    })

    pedZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            if (not Interactions[id]) then
                Interactions[id] = true
                lib.requestModel(shopModel)

                if (IsModelAPed(shopModel)) then
                    local shopPed = CreatePed(4, shopModel, coords.x, coords.y, coords.z - 1.03, coords.w or 0, false, true)
                    local randScene = Config.PedScenarios[math.random(1, #Config.PedScenarios)]

                    SetEntityHeading(shopPed, coords.w)
                    FreezeEntityPosition(shopPed, true)
                    TaskStartScenarioInPlace(shopPed, randScene, -1, true)
                    SetBlockingOfNonTemporaryEvents(shopPed, true)
                    SetEntityNoCollisionEntity(shopPed, PlayerPedId(), false)
                    SetEntityInvincible(shopPed, not pedCfg.killable)

                    Peds[id] = shopPed
                end
            end
        else
            if (Interactions[id]) then
                KillShop(id)
            end
        end
    end)
end

--- @param shopID string
--- @param locationID number
--- @param useTarget boolean
--- @param coords vector3
--- @param shopKey string
CreateShopInteraction = function(shopID, locationID, useTarget, coords, shopKey)
    local shopData = {
        shopID = shopID,
        locationID = locationID
    }
    if useTarget then
        exports.ox_target:addBoxZone({
            coords = vec3(coords.x, coords.y, coords.z),
            size = vec3(1, 1, 2),
            rotation = coords.w,
            debug = Config.Debug,
            options = {
                {
                    name = shopKey,
                    icon = "fas fa-certificate",
                    label = "Browse Shop",
                    onSelect = function() OpenShop(shopData) end,
                }
            }
        })
    else
        exports["mc9-interact"]:AddInteraction({
            coords = vec3(coords.x, coords.y, coords.z),
            distance = 5.0,
            interactDst = 2.0,
            id = shopKey,
            options = {
                {
                    label = "Browse Shop",
                    action = function() OpenShop(shopData) end,
                },
            }
        })
    end
end

--- @param requirements table
--- @param isShop? boolean
--- @param productName? string
--- @return boolean
MeetsReqs = function(requirements, isShop, productName)
    local isSelling = CurrentShop.cfg.mode and CurrentShop.cfg.mode == "sell"
    if (isSelling) and (productName) then
        if OxInv:GetItemCount(productName) <= 0 then
            return false
        end
    end
    if (not requirements) or (not next(requirements)) then return true end

    local auth = "access"
    for _, req in pairs(requirements) do
        if (req.job) or (req.gang) then
            auth = (req.job and "job") or (req.gang and "gang")

            if PlayerData[auth].name == req[auth] then
                if (not req.rank) then return true end

                if (PlayerData[auth].grade.level >= req.rank) then
                    return true
                end
            end
        end

        if req.licence then
            auth = "licence"
            if (PlayerData.metadata.licences[req.licence]) then
                if (not req.needItem) then return true end

                if (OxInv:GetItemCount(req.needItem) > 0) then
                    return true
                end
            end
        elseif (req.item) then
            auth = "item"
            if (OxInv:GetItemCount(req.item) > 0) then
                return true
            end
        end
    end

    if isShop then QBCore.Functions.Notify("Missing required " .. auth, "error") end
    return false
end

--- @param shopData table
ValidShop = function(shopData)
    local shopCfg = GetShopCfg(shopData.shopID)
    if (not shopCfg) then return false end

    if (not shopCfg) or (not next(shopCfg)) or (shopCfg.disabled) then return false end
    if (shopCfg.custom) then
        if (not shopCfg.products) or (not next(shopCfg.products)) then return false end
    else
        if (not shopCfg.coords) or (not next(shopCfg.coords)) or (not shopCfg.coords[shopData.locationID]) then return false end
        if (not shopCfg.productSet) or (not Config.Products[shopCfg.productSet]) then return false end
    end

    CurrentShop = {
        cfg = shopCfg,
        shopID = shopData.shopID,
        locationID = shopData.locationID,
        currencyIcon = "$",
    }
    Payload.locationID = shopData.locationID
    Payload.shopID = shopData.shopID
    Payload.custom = shopData.custom

    local shopProducts = (shopCfg.custom and shopCfg.products) or Config.Products[shopCfg.productSet]
    return shopProducts
end

--- @param shopData table | string
OpenShop = function(shopData)
    if type(shopData) == "string" then
        shopData = {
            shopID = shopData,
            locationID = 1
        }
    end

    local shopProducts = ValidShop(shopData)
    if (not CurrentShop) or (not shopProducts) then
        print("shops::OpenShop - Invalid Shop")
        return
    end

    local shopCfg = CachedShops[shopData.shopID]
    PlayerData = QBCore.Functions.GetPlayerData()

    if (not MeetsReqs(shopCfg.requirements, true)) then return end

    local shopItems = {}
    for productID = 1, #shopProducts do
        table.insert(shopItems, GetProduct(productID))
    end

    LocalPlayer.state:set("basicshops", true, true)
	SendNUIMessage({
		action = "market",
		items = shopItems,
        shopLabel = shopCfg.label,
		shopData = shopData,
		companyOrder = shopCfg.useBossFunds or false,
		-- orderType = orderType,
		token = lib.callback.await("mc9-basicshops:server:getToken", false)
	})

	SetNuiFocus(true, true)
end
exports("OpenShop", OpenShop)

--- @param productID number
GetProduct = function(productID)
    local isSelling = CurrentShop.cfg.mode and CurrentShop.cfg.mode == "sell"
    local product = (CurrentShop.cfg.custom and CurrentShop.cfg.products[productID]) or Config.Products[CurrentShop.cfg.productSet][productID]
    local invItem = OxInv:Items(product.name)
    if (not invItem) then
        print("shops::productOption - Can't find item '" .. product.name .. "'")
        return nil
    end

    local disabledProduct = not MeetsReqs(product.requirements, false, product.name)
    if (Config.HideRestrictedItems) and (disabledProduct) then
        return nil
    end

    local priceText = (product.price == 0 and "Free") or (CurrentShop.currencyIcon .. " " .. product.price)
    local weightText = (invItem.weight) .. "g"
    local amountText = (isSelling and "\nYour Amount: " .. OxInv:GetItemCount(product.name)) or product.amount
    local description = priceText .. weightText .. amountText
    local imagePath = (invItem.client and invItem.client.image) or ("nui://ox_inventory/web/images/" .. invItem.name .. ".png")

    return {
        productID = productID,
        label = invItem.label,
        name = product.name,
        weight = weightText,
        amount = amountText,
        price = product.price,
        priceText = priceText,
        description = description,
        image = imagePath,
        disabled = disabledProduct,
    }
end

RegisterNetEvent("QBCore:Client:UpdateObject", function()
    QBCore = exports["qb-core"]:GetCoreObject()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNUICallback("CloseShop", function()
    SetNuiFocus(false,false)
end)

RegisterNUICallback("ProcessTransaction", function(cart, cb)
	SetNuiFocus(false,false)

    Payload.method = cart.method
    Payload.price = cart.price
    Payload.cart = cart.cart

	ProcessTransaction()
end)

CreateThread(function()
    for shopID, shopCfg in pairs(CachedShops) do
        if (shopCfg.disabled) then goto skip end

        for locationID, coords in pairs(shopCfg.coords) do
            local shopKey = shopID..":"..locationID

            CreateShopBlip(coords, shopCfg, shopKey)
            CreateShopPed(coords, shopCfg.ped)
            CreateShopInteraction(shopID, locationID, shopCfg.useTarget, coords, shopKey)
        end

        ::skip::
    end
end)

mc9.script.onStop(function()
    for _, ped in pairs(Peds) do
        DeleteEntity(ped)
    end
    for _, blip in pairs(Blips) do
        RemoveBlip(blip)
    end
end)
