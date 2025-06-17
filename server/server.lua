local QBCore = exports["qb-core"]:GetCoreObject()
local OxInv = exports["ox_inventory"]
local shopTokens = {}

local validCustomer = function(source)
    if (not source) then return nil end
    local customer = QBCore.Functions.GetPlayer(source)
    if (not customer) or (not Player(source).state.basicshops) then return nil end

    return customer
end

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
    if (type(payload) ~= "table") then return false, "invalid_payload" end
    if (type(payload.shopID) ~= "string") then return false, "invalid_shop" end
    if (type(payload.locationID) ~= "number") then return false, "invalid_location" end
    if (type(payload.cart) ~= "table") then return false, "invalid_items" end
    if (type(payload.price) ~= "number") then return false, "invalid_amount" end
    if (type(payload.method) ~= "string") then return false, "invalid_payment_type" end
    for _, item in pairs(payload.cart) do
        if (type(item) ~= "table") then return false, "invalid_item_table" end
        if (type(item.productID) ~= "number") then return false, "invalid_item_index" end
        if (type(item.count) ~= "number") then return false, "invalid_item_amount" end
    end

    return true
end

--- @param shopCfg table
--- @param products table
--- @param cart table
local validShop = function(shopCfg, products, cart)
    if (not shopCfg) then
        return false, "shop_not_found"
    end

    if (not products) or (not next(products)) then
        return false, "invalid_product_category"
    end

    for _, item in pairs(cart) do
        if (not item.count) then
            return false, "invalid_amount"
        end

        if (not item.productID) or (not products[item.productID]) then
            return false, "invalid_item_index"
        end

        local itemData = OxInv:Items(products[item.productID].name)
        if (not itemData) then
            return false, "item_not_found"
        end

        item.name = itemData.name
    end

    return true, nil, cart
end

--- @param cart table
--- @param products table
--- @param price number
local getTotalPrice = function(cart, products, price)
    local total = 0

    for _, item in pairs(cart) do
        total = total + (item.count * products[item.productID].price)
    end

    if (total ~= price) then -- BAN THEM
        DropPlayer(source, "mc9-basicshops::getTotalPrice mismatch")
    end

    return total
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
---@field PurchasePayload.cart number
---@field PurchasePayload.price number
---@field PurchasePayload.amount number
---@field PurchasePayload.method string
lib.callback.create("frudy_shops:server:ProcessTransaction", function(source, payload)
	local customer = validCustomer(source)
	if (not customer) then return false, "player_not_found" end

    local completed, errMsg = validPayload(payload)
    if (not completed) then
        return false, errMsg
    end

    local shopCfg = Config.Shops[payload.shopID]
    local isSelling = shopCfg.mode and (shopCfg.mode == "sell")
    local products = (shopCfg.custom and shopCfg.products) or Config.Products[shopCfg.productSet]

    completed, errMsg, payload.cart = validShop(shopCfg, products, payload.cart)
    if (not completed) then
        return false, errMsg
    end

    local totalCost = getTotalPrice(payload.cart, products, payload.price)
    if (not shopCfg.custom) then
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        local shopCoords = shopCfg.coords[payload.locationID]
        local distance = #(playerCoords - vec3(shopCoords.x, shopCoords.y, shopCoords.z))

        if (Config.DistanceCheck < distance) then
            return false, "too_far_away"
        end
    end

    if (not isSelling) then
        for _, product in pairs(payload.cart) do
            local canCarry = OxInv:CanCarryItem(source, product.name, product.count)
            if (not canCarry) then
                return false, "cannot_carry_item"
            end
        end

        if not canPay(customer, payload.method, totalCost) then
            return false, "not_enough_money"
        end

        for _, product in pairs(payload.cart) do
            completed, errMsg = OxInv:AddItem(source, product.name, product.count)
        end
    else
        for _, product in pairs(payload.cart) do
            if (OxInv:GetItemCount(source, product.name) <= 0) or (OxInv:GetItemCount(source, product.name) < product.count) then
                return false, "not_enough_items"
            end
        end

        finishSell(customer, payload.method, totalCost)
        for _, product in pairs(payload.cart) do
            completed, errMsg = OxInv:RemoveItem(source, product.name, product.count)
        end
    end

    if (completed) then
        local color = isSelling and "blue" or "green"
        local action = isSelling and "sold" or "bought"
        local direction = isSelling and "to" or "from"

        local itemLines = {}
        for _, item in pairs(payload.cart) do
            local product = products[item.productID]
            if product then
                table.insert(itemLines, string.format("- %dx %s", item.count, product.name))
            end
        end

        local logMsg = string.format(
            "**%s** (CitizenID: %s) %s the following items %s %s for $%d:\n%s",
            customer.PlayerData.name,
            customer.PlayerData.citizenid,
            action,
            direction,
            shopCfg.label,
            totalCost,
            table.concat(itemLines, "\n")
        )

        TriggerEvent("qb-log:server:CreateLog", "shops", "Shop Transaction", color, logMsg)

        errMsg = isSelling and "sell_success" or "purchase_success"
    end

    return completed, errMsg
end)

lib.callback.create('mc9-basicshops:server:getToken', function(source, job)
	local customer = validCustomer(source)
	if (not customer) then DropPlayer(source, "Bitch") return end

    local token = tostring(math.random(100000, 999999))
    shopTokens[source] = token

	return token
end)
