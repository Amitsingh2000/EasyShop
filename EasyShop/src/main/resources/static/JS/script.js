function add_to_cart(productId,productName,productPrice)
{
	let cart =localStorage.getItem("cart")
	if(cart==null)
	{
		let products=[];
		let product={productId:productId,productName:productName,stockQuantity:1,productPrice:productPrice}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("product is added for first time")
		showToast("Item is added to cart")
	}
	else
	{
		let pcart =JSON.parse(cart);
		let oldProduct = pcart.find((item)=>item.productId==productId)
		if(oldProduct)
		{
			//We have increase the quantity
			oldProduct.stockQuantity =oldProduct.stockQuantity+1;
			pcart.map((item)=>
			{
				if(item.productId==oldProduct.productId)
				{
					item.stockQuantity=oldProduct.stockQuantity;
				}	
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product is qunatity is increased")
			showToast(oldProduct.productName+" Quantity Increased")
		}
		else
		{
			//we have add the product
			let product={productId:productId,productName:productName,stockQuantity:1,productPrice:productPrice}
			pcart.push(product)
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product is added")
			showToast("Item is added to cart")
		}
	}
	updateCart()
}

//Update Cart 
function updateCart()
{
	let cartString =localStorage.getItem("cart");
	let cart =JSON.parse(cartString);
	if(cart==null || cart.length==0)
	{
		console.log("Cart is  empty !!");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h2>Cart Does Not Have Any Item</h2>");
		$(".checkout-btn").addClass("disabled");
	}
	else
	{
		$(".cart-items").html(`(${cart.length})`);
		let table=`
		<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th> Item Name </th>
					<th> Item Price </th>
					<th> Quantity </th>
					<th> Total Price </th>
					<th> Action </th>
				</tr>
			</thead>
		`;
		let totalPrice=0;
		cart.map((item)=>
		{
			table +=
			`<tr>
				<td>${item.productName}</td>
				<td>${item.productPrice}</td>
				<td>${item.stockQuantity}</td>
				<td>${item.stockQuantity*item.productPrice}</td>
				<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
			`
			totalPrice+=item.productPrice*item.stockQuantity;
		})
		
		table=table+`
		<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price  : ${totalPrice}</tr></td>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass("disabled");
	
	}
	
}
$(document).ready(function ()
{
	updateCart()
})

//delete Item
function deleteItemFromCart(productId)
{
	let cart =JSON.parse(localStorage.getItem('cart'))
	let  newcart =cart.filter((item)=> item.productId != productId)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart()
	showToast("Item is Remove from cart")

}
function showToast(content)
{
	$('#toast').addClass("display");
	$('#toast').html(content);
	setTimeout(()=>{
		$('#toast').removeClass("display");
	},2000)
}
function goToCheckout()
{
	window.location="checkout";
}
function checkout()
{
	var userId =document.getElementById('userId').value;
	 products = localStorage.getItem("cart");
	var requestData = 
	{
		 userId: userId,
		 products: JSON.parse(products)
	};
	$.ajax({
	  url: '/addOrders/'+userId,
	  method: 'POST',
	  contentType: 'application/json',
	  data: JSON.stringify(requestData.products),
	  success: function success()
	  {
			window.location="http://localhost:5555/userDashboard";
	  },
	  error: function(error) {
	    // Handle any errors that occur during the request
	  }
	});
	localStorage.clear();
	
	
}
function orderPlace()
{
	showToast("Order Place Successfully")	
	
}
