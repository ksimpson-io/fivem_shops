if ((GetResourceState("ox_inventory") ~= "starting") and (GetResourceState("ox_inventory") ~= "started")) then return end

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
    if (not Config.UsePeds) or (not pedCfg) or (pedCfg.disabled) then return end

    local shopModel = pedCfg.models[math.random(1, #pedCfg.models)]
    local id = "mc9_shops_ped_" .. tostring(coords)
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
                Interactions[id] = nil
                CurrentShop = {}
                KillPayload()
                DeleteEntity(Peds[id])
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
                    onSelect = function() ShopMenu(shopData) end,
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
                    action = function() ShopMenu(shopData) end,
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
                return true
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
ShopMenu = function(shopData)
    if type(shopData) == "string" then
        shopData = {
            shopID = shopData,
            locationID = 1
        }
    end

    local shopProducts = ValidShop(shopData)
    if (not CurrentShop) or (not shopProducts) then
        print("shops::ShopMenu - Invalid Shop")
        return
    end

    local shopCfg = CachedShops[shopData.shopID]
    PlayerData = QBCore.Functions.GetPlayerData()

    if (not MeetsReqs(shopCfg.requirements, true)) then return end

    local menuOptions = {}
    for productID = 1, #shopProducts do
        local menuOption = ProductOption(productID)
        if menuOption then
            table.insert(menuOptions, menuOption)
        end
    end

    lib.registerContext({
        id = "frudy_shops::ShopMenu",
        title = CurrentShop.cfg.label,
        options = menuOptions,
    })

    return lib.showContext("frudy_shops::ShopMenu")
end
exports("OpenShopMenu", ShopMenu)

--- @param productID number
ProductOption = function(productID)
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

    local priceLabel = isSelling and "Sell Price: " or "Cost: "
    local priceText = (product.price == 0 and "Free") or (priceLabel .. CurrentShop.currencyIcon .. " " .. product.price)
    local weightText = (invItem.weight == 0 and "") or ("\nWeight: " .. (invItem.weight / 1000) .. "kg")
    local amountText = (isSelling and "\nYour Amount: " .. OxInv:GetItemCount(product.name)) or ("")
    local description = priceText .. weightText .. amountText
    local imagePath = invItem?.client?.image

    local menuOption = {
        title = invItem.label,
        description = description,
        icon = imagePath,
        disabled = disabledProduct,
        onSelect = function () TransactionMenu(productID, product, invItem) end,
    }

    return menuOption
end

RegisterNetEvent("QBCore:Client:UpdateObject", function()
    QBCore = exports["qb-core"]:GetCoreObject()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
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
