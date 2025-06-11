if ((GetResourceState("ox_inventory") ~= "starting") and (GetResourceState("ox_inventory") ~= "started")) then return end

local QBCore = exports["qb-core"]:GetCoreObject()
local OxInv = exports["ox_inventory"]

CreateThread(function()
    -- Apply ox_lib debug state based on app debug
    SetConvarReplicated("ox:printlevel:"..GetCurrentResourceName(), Config.Debug and "debug" or "false")
end)

---@param customer table
---@param method string
---@param amount number
local canPay = function(customer, method, amount)
    if (method == "standard") or (method == "premium") then
        return customer.Functions.RemoveTokens(method, amount, "Shop Purchase")
    end
    return customer.Functions.RemoveMoney(method, amount, "Shop Purchase")
end

---@param customer table
---@param method string
---@param amount number
local finishSell = function(customer, method, amount)
    if (method == "standard") or (method == "premium") then
        customer.Functions.AddTokens(method, amount, "Sold Item to Shop")
    else
        customer.Functions.AddMoney(method, amount, "Sold Item to Shop")
    end
end

--- @param payload table
local validPayload = function(payload)
    -- TODO: Callbacks dont support assertions, so we need to manually check the types
    -- core.assert.table(payload, "invalid_payload")
    -- core.assert.number(payload.price, "invalid_amount")
    -- core.assert.string(payload.method, "invalid_payment_type")
    -- core.assert.number(payload.productID, "invalid_item")
    -- core.assert.string(payload.shop, "invalid_shop")

    -- Temporary type checking until callbacks properly support assertions
    if (type(payload) ~= "table") then return false, "invalid_payload" end
    if (type(payload.shopID) ~= "string") then return false, "invalid_shop" end
    if (type(payload.locationID) ~= "number") then return false, "invalid_location" end
    if (type(payload.productID) ~= "number") then return false, "invalid_item_index" end
    if (type(payload.amount) ~= "number") then return false, "invalid_amount" end
    if (type(payload.price) ~= "number") then return false, "invalid_amount" end
    if (type(payload.method) ~= "string") then return false, "invalid_payment_type" end

    return true
end

--- @param shopCfg table
--- @param products table
--- @param product table
local validShop = function(shopCfg, products, product)
    if (not shopCfg) then
        return false, "shop_not_found"
    end

    if (not products) then
        return false, "invalid_product_category"
    end

    if (not product) then
        return false, "item_not_found"
    end

    return true
end

---@param product table
local convertProduct = function(product)
    local reqs = product.requirements or {}

    if (product.requiredJob) then
        if (type(product.requiredJob) == "string") then
            product.requiredJob = { product.requiredJob }
        end

        for _, job in pairs(product.requiredJob) do
            table.insert(reqs, { job = job })
        end
    end

    if (product.requiresLicense) then
        if (type(product.requiresLicense) == "string") then
            product.requiresLicense = { product.requiresLicense }
        end

        for _, licType in pairs(product.requiresLicense) do
            table.insert(reqs, { licence = licType })
        end
    end

    return {
        name = product.name,
        price = product.price,
        amount = product.amount,
        info = product.info or nil,
        type = (product.type ~= "item" and product.type) or nil,
        requirements = reqs
    }
end

local convertShop = function(shopCfg)
    local products = shopCfg.items
    local convertedProducts = {}

    for _, product in pairs(products) do
        local newProduct = convertProduct(product)

        table.insert(convertedProducts, newProduct)
    end

    return {
        label = shopCfg.label,
        products = convertedProducts,
    }
end

--- @param shopID string
--- @param shopCfg table
local registerShop = function(shopID, shopCfg)
    local basicShop = convertShop(shopCfg)

    if Config.Shops[shopID] then
        if (Config.Shops[shopID].label ~= basicShop.label) then
            print("frudy_shops::registerShop - Shop already registered with ID: "..shopID)
        end

        return
    end

    basicShop.custom = true

    Config.Shops[shopID] = basicShop
end
exports("RegisterShop", registerShop)

---@param shopID number
lib.callback.register("frudy_shops:server:GetShop", function(source, shopID)
    if (not shopID) then return end

    return Config.Shops[shopID]
end)

---@class PurchasePayload
---@field PurchasePayload.shopID string
---@field PurchasePayload.locationID number
---@field PurchasePayload.productID number
---@field PurchasePayload.price number
---@field PurchasePayload.amount number
---@field PurchasePayload.method string
lib.callback.register("frudy_shops:server:ProcessTransaction", function(source, payload)
    local src = source
    local completed, errMsg = validPayload(payload)

    if (not completed) then
        return false, errMsg
    end

    local shopCfg = Config.Shops[payload.shopID]
    local isSelling = shopCfg.mode and (shopCfg.mode == "sell")
    local products = (shopCfg.custom and shopCfg.products) or Config.Products[shopCfg.productSet]
    local product = products[payload.productID]
    local totalCost = product.price * payload.amount

    completed, errMsg = validShop(shopCfg, products, product)
    if (not completed) then
        return false, errMsg
    end

    if (not shopCfg.custom) then
        local playerCoords = GetEntityCoords(GetPlayerPed(src))
        local shopCoords = shopCfg.coords[payload.locationID]
        local distance = #(playerCoords - vec3(shopCoords.x, shopCoords.y, shopCoords.z))

        if (Config.DistanceCheck < distance) then
            return false, "too_far_away"
        end
    end

    local customer = QBCore.Functions.GetPlayer(src)
    if (not customer) then
        return false, "player_not_found"
    end

    local itemData = OxInv:Items(product.name)
    if (not itemData) then
        return false, "item_not_found"
    end

    if (not isSelling) then
        local canCarry = OxInv:CanCarryItem(src, product.name, payload.amount)
        if (not canCarry) then
            return false, "cannot_carry_item"
        end

        if not canPay(customer, payload.method, totalCost) then
            return false, "not_enough_money"
        end

        completed, errMsg = OxInv:AddItem(src, itemData.name, payload.amount)
    else
        if (OxInv:GetItemCount(src, itemData.name) <= 0) or (OxInv:GetItemCount(src, itemData.name) < payload.amount) then
            return false, "not_enough_items"
        end

        finishSell(customer, payload.method, totalCost)
        completed, errMsg = OxInv:RemoveItem(src, itemData.name, payload.amount)
    end

    if (completed) then
        local color = isSelling and "blue" or "green"
        local action = isSelling and "sold" or "bought"
        local direction = isSelling and "to" or "from"

        TriggerEvent("qb-log:server:CreateLog", "shops", "Shop Transaction", color, string.format(
            "**%s** (CitizenID: %s) %s %dx %s %s %s for $%d",
            customer.PlayerData.name,
            customer.PlayerData.citizenid,
            action,
            payload.amount,
            itemData.name,
            direction,
            shopCfg.label,
            totalCost
        ))

        errMsg = "success"
    end

    return completed, errMsg
end)
