local Currency = {
    cash = { label = "Cash", icon = "$", option = { label = "Cash", value = "cash" }, },
    bank = { label = "Bank", icon = "$", option = { label = "Bank", value = "bank" }, },
    standard = { label = "Standard Tokens", icon = "◎", option = { label = "Standard Tokens", value = "standard" }, },
    premium = { label = "Premium Tokens", icon = "◎", option = { label = "Premium Tokens", value = "premium" }, }
}

--- @param payment table | nil
--- @param product table
--- @param maxAmount number
local validPayment = function(payment, product, maxAmount)
    if (not payment) or (not next(payment)) then return end

    local amount, method = payment[1], payment[2]
    if (not amount) or (not method) then return false end
    if (amount <= 0) or (amount > maxAmount) then return false end

    local paymentData = {
        shopID = CurrentShop.shopID,
        amount = amount,
        method = method
    }
    Payload.method = method
    Payload.price = product.price
    Payload.amount = amount

    return paymentData
end

---@param productCurrency string | nil
---@param shopCurrency string | nil
local getCurrency = function(productCurrency, shopCurrency)
    local default = productCurrency or shopCurrency

    if default then
        return {
            currency = default,
            icon = Currency[default].icon,
            label = Currency[default].label,
            options = { Currency[default].option },
        }
    else
        default = "bank"
        return {
            currency = default,
            icon = Currency[default].icon,
            label = Currency[default].label,
            options = { Currency.cash.option, Currency[default].option },
        }
    end
end

---@param productID number
---@param product table
---@param invItem table
TransactionMenu = function(productID, product, invItem)
    local shopCfg = CurrentShop.cfg
    local isSelling = shopCfg.mode and (shopCfg.mode == "sell")
    local currencyCfg = getCurrency(product.currency, shopCfg.currency)
    local shopVerb = (isSelling and "Sell ") or ("Purchase ")
    local header = shopVerb .. invItem.label
    local costLabel = (isSelling and "Price") or ("Cost") .. " per item"
    local costText = ("%s%s"):format(currencyCfg.icon, product.price)
    local maxAmount = (isSelling and OxInv:GetItemCount(product.name)) or product.amount

    local inputs = {
        { type = "number", label = "Amount to " .. shopVerb, description = costLabel .. ": " .. costText, min = 0, max = maxAmount, default = 1 },
        { type = "select", label = "Payment Method", description = (isSelling and "Choose how to receive payment") or ("Choose how to pay"), default = currencyCfg.currency, options = currencyCfg.options },
    }

    local menu = lib.inputDialog(header, inputs)
    local payment = validPayment(menu, product, maxAmount)
    if (not payment) or (not menu) then KillPayload() return end

    Payload.productID = productID

    ProcessTransaction()
end

ProcessTransaction = function()
    local purchased, msg = lib.callback.await("frudy-shops:server:ProcessTransaction", false, Payload)
    local err = (purchased and "success") or "error"

    QBCore.Functions.Notify(Config.Locales[msg], err)
    KillPayload()

    if (not purchased) then return end
    lib.requestAnimDict("amb@prop_human_atm@male@enter")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_atm@male@enter", "enter", 1.0, -1.0, 1500, 1, 1, true, true, true)
end


-- RegisterNetEvent("frudy-shops:client:openExternalShop", function(shopID)
--     ShopMenu({shopID = shopID, locationID = 1})
-- end)
