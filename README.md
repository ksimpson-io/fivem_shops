# frudy_shops 🛒
A modular and dynamic shop system for FiveM — written in Lua with a clean, gameplay-focused structure and full server-client separation.

This system supports configurable shop types (buy/sell), optional job restrictions, dynamic registration, and smooth integration with ox_inventory and ox_lib. Built for flexibility and designed to be easily extended across your server’s economy and interaction systems.

>⚠️ Originally developed for MC9 Gaming. This system was designed and built by me and has been adapted for independent use. No proprietary MC9 assets or systems are included.

---

## 🚀 Features

- 🧩 Modular Design — Fully dynamic shop registration from any resource
- 🛍️ Buy & Sell Modes — Configurable per shop instance
- 🧑‍💼 Job-Locked Support — Optional job or gang access restriction
- 🧠 Data-Driven — All shop data and product lists handled server-side
- 📦 ox_inventory Integration — Native item handling and validation
- 🖱️ ox_lib UI — Context and input menus
- 🔁 Reusable — Can be used by multiple scripts with zero duplication
- 🪝 Developer Hooks — Register or trigger shops from external scripts

---

## 🧱 Tech Stack

- **Lua** — Structured, modular server/client logic
- **QBCore** — Used for player data, framework utilities
- **ox_lib** — UI handling (context menus, inputs)
- **ox_inventory** — Integrated item and currency system
- **mc9-core** — Organization library used for interaction system and callback helpers *(private)*

---

## 🧩 Dependencies

| Resource     | Purpose                                |
|--------------|----------------------------------------|
| `ox_lib`     | Context and input menu UI              |
| `ox_inventory` | Item validation and transactions     |
| `mc9-core`   | Interaction system and callbacks *(private)* |
| `PolyZone`   | Zone detection (if used for targeting) |

---

## 📦 Installation

1. Download or clone this repository into your `resources` folder
2. Rename the folder to `frudy_shops` (optional, but recommended)
3. Add `ensure frudy_shops` to your `server.cfg`
4. Make sure the following resources are started before it:
   - `ox_lib`
   - `ox_inventory`

---

## ⚙️ Configuration

All shop definitions and product lists can be configured in:

- `shared/shopcfg.lua` – Shop definitions, job access, product lists
- `shared/config.lua` – General settings and reusable item configs

---

## 🧠 Developer Notes

- Shops are **registered on the server** and synced to clients
- Other scripts can trigger or register shops dynamically:
  ```lua
  TriggerEvent("frudy_shops:server:register", shopId, config)
  TriggerEvent("frudy_shops:server:openShop", source, shopId, mode) -- mode: "buy" or "sell"
