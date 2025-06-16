let curShop
let allInfo = {}
let companyOrder = false
let orderType = false

const toggleCompanyButton = function() {
	if (companyOrder) {
		$(".bottom-btns").show();
	} else {
		$(".bottom-btns").hide();
	}
};

const showMarket = function(shopItems, shopLabel) {
	$(".shop-title").text(shopLabel);
	$("div.back-container").fadeIn(300, function() {
		let values = "";
		$("div.main-container").fadeIn(500);

		if (shopItems.length > 0) {
			for (let index = 0; index < shopItems.length; index++) {
				const element = shopItems[index];
				let itemName = element.label;
				let addButtonClass = element.amount === 0 ? 'disabled-button' : '';
				let disabledAttribute = element.disabled || element.amount === 0 ? 'disabled' : '';
				let info = JSON.stringify(element.info);
				allInfo[element.name] = info;

				let addButton = `<button
					class="addToCart ${addButtonClass}"
					data-name="${element.name}"
					data-label="${element.label}"
					data-img="${element.image}"
					data-price="${element.price}"
					data-productid="${element.productID}"
					data-info="${info}"
					${disabledAttribute}>${element.amount === 0 ? 'Out of Stock' : 'Add to Cart'}
				</button>`;

				values += `
					<div class="itemBox" value="other">
						<span class="item-amount" data-name="${element.name}">${element.amount}</span>
						<span class="item-weight">${element.weight}</span>
						<div class="img-box">
							<img src="${element.image}">
						</div>
						<div class="item-name">${itemName}</div>
						<div class="button-container">
							${addButton}
							<div class="priceofItem">${element.priceText}</div>
						</div>
					</div>`;
			}
			$(".item-body").html(values);
		}
	});
};

const displayCart = function() {
	let cartArray = shoppingCart.listCart();
	let output = "";
	for (let i in cartArray) {
		output += `<div class="shopItem">
			<div class="shopItem-left">
				<div class="shopItem-img">
					<img src="${cartArray[i].image}">
				</div>
				<div class="shopItem-info">
					<div class="shopItem-label">${cartArray[i].label}</div>
					<div class="shopItem-price">${cartArray[i].price}$</div>
				</div>
			</div>
			<div class="shopItem-right">
				<button class="countDown act-btn" data-name="${cartArray[i].name}" data-label="${cartArray[i].label}">-</button>
				<input type="number" class="currentCount" data-name="${cartArray[i].name}" value="${cartArray[i].count}" min="1">
				<button class="countUp act-btn" data-name="${cartArray[i].name}" data-label="${cartArray[i].label}">+</button>
			</div>
	</div>`};

	$('.shopcart').html(output);
	$('.total-price').html("$ " + shoppingCart.totalCart().toLocaleString());
};

let shoppingCart = (function() {
	cart = [];

	function Item(productID, name, label, price, count, img, info) {
		this.productID = productID;
		this.name = name;
		this.label = label;
		this.price = price;
		this.count = count;
		this.image = img,
		this.info = info
		console.log(this.productID)
	}

	function saveCart() {
		sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
	}

	function loadCart() {
		cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
	}

	if (sessionStorage.getItem("shoppingCart") != null) {
		loadCart();
	}

	let obj = {};
	obj.addItemToCart = function(productID, itemName, label, price, count, img, info) {
		for (let item in cart) {
			if (cart[item].name === itemName) {
				cart[item].count++;

				saveCart();
				return;
			}
		}

		let item = new Item(productID, itemName, label, price, count, img, info);
		cart.push(item);
		saveCart();
	};

	obj.setCountForItem = function(itemName, count) {
		for (let i in cart) {
			if (cart[i].name === itemName) {
				cart[i].count = count;
				break;
			}
		}
	};

	obj.removeItemFromCart = function(itemName) {
		for (let item in cart) {
			if (cart[item].name === itemName) {
				cart[item].count--;
				if (cart[item].count === 0) {
					cart.splice(item, 1);
				}
				break;
			}
		}
		saveCart();
	};

	obj.getCountByName = function(itemName) {
		for (let item in cart) {
			if (cart[item].name == itemName) {
				return cart[item].count
			}
		}
		return 0
	};

	obj.removeItemFromCartAll = function (itemName) {
		for (let item in cart) {
			if (cart[item].name === itemName) {
				cart.splice(item, 1);
				break;
			}
		}
		saveCart();
	};

	obj.clearCart = function() {
		allInfo = {};
		cart = [];
		saveCart();
	};

	obj.totalCount = function() {
		let totalCount = 0;
		for (let item in cart) {
			totalCount += cart[item].count;
		}
		return totalCount;
	};

	obj.totalCart = function() {
		let totalCart = 0;
		for (let item in cart) {
			totalCart += cart[item].price * cart[item].count;
		}
		return Number(totalCart.toFixed(2));
	};

	obj.listCart = function() {
		let cartCopy = [];
		for (i in cart) {
			item = cart[i];
			itemCopy = {};
			for (p in item) {
				itemCopy[p] = item[p];
			}

			itemCopy.total = Number(item.price * item.count).toFixed(2);
			cartCopy.push(itemCopy)
		}
		return cartCopy;
	};

	return obj;
})();

$(function() {
	$("body").on("keyup", function(e) {
		if (e.which == 27) {
			closeShop();
		};
	});
});

let closeShop = function() {
	$("div.back-container").fadeOut(300, function() {
		$("div.main-container").fadeOut(500, function() {
			shoppingCart.clearCart();
			displayCart();
		});
		$.post("https://mc9-basicshops/CloseShop");
	});
};

window.addEventListener("message", function(data) {
	let cfg = data.data
	if (cfg.action != "market") return;

	companyOrder = cfg.companyOrder
	curShop = cfg.shopData
	orderType = cfg.orderType
	token = cfg.token

	toggleCompanyButton()
	showMarket(cfg.items, cfg.shopLabel)
});

$(document).on("click", ".addToCart", function() {
	let itemName = $(this).data('name');
	let price = Number($(this).data('price'));
	let img = $(this).data("img");
	let label = $(this).data("label");
	let productID = $(this).data("productid");
	info = allInfo[itemName];

	shoppingCart.addItemToCart(productID, itemName, label, price, 1, img, info);
	displayCart();
});

$(document).on("click", ".pay", function() {
	let cartArray = shoppingCart.listCart();
	let cartData = cartArray.map(item => { return { productID: item.productID, count: item.count } });
	let paymentMethod = "cash";

	if ($(this).hasClass("paywithcard")) {
		paymentMethod = "bank";
	} else if ($(this).hasClass("paywithcompany")) {
		paymentMethod = "company";
	}

	$.post("https://mc9-basicshops/ProcessTransaction", JSON.stringify({
		cart: cartData,
		price: shoppingCart.totalCart(),
		method: paymentMethod,
		shopData: curShop,
		orderType: orderType,
		token: token
	}));

	shoppingCart.clearCart();
	displayCart();
	closeShop();
});

$(document).on("click", ".countDown", function(event) {
	let name = $(this).data('name')
	shoppingCart.removeItemFromCart(name);
	displayCart();
});

$(document).on("click", ".countUp", function(event) {
	let name = $(this).data('name');
	let originalAmount = parseInt($(".item-amount[data-name='" + name + "']").text());
	let currentCount = shoppingCart.getCountByName(name);
	if (currentCount < originalAmount) {
		shoppingCart.setCountForItem(name, currentCount + 1);
		displayCart();
	}
});

$(document).on("change", ".currentCount", function(event) {
	let name = $(this).data('name');
	let count = Number($(this).val());
	shoppingCart.setCountForItem(name, count);
	displayCart();
});

$(document).on("input", ".currentCount", function(event) {
	let name = $(this).data('name');
	let originalAmount = parseInt($(".item-amount[data-name='" + name + "']").text());
	let inputValue = parseInt($(this).val());

	if (inputValue > originalAmount) {
		$(this).val(originalAmount);
	}
	if (isNaN(inputValue) || inputValue < 1) {
		$(this).val(1);
	}
});

$(document).ready(function() {
	$('.searchBar-input').on('input', function() {
		const query = $(this).val().toLowerCase();

		$('.itemBox').each(function() {
			const itemName = $(this).find('.item-name').text().toLowerCase();

			if (itemName.includes(query)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});

	$('.action').on('click', function() {
		const target = $(this).data('target');

		if (target === 'all') {
			$('.itemBox').show();
		} else {
			$('.itemBox').each(function() {
				const value = $(this).attr('value');
				if (value === target) {
					$(this).show();
				} else {
					$(this).hide();
				}
			});
		}
		$(this).addClass('active').siblings().removeClass('active');
	});
});
