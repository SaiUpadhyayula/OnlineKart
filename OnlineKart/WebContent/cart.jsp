<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShoppingKart</title>
<link href="bootstrap/css/shop-homepae.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<style>
body {
	background-color: #ddddcc;
}

.input-mini {
	diplay: inline;
}

#cartitem {
	display: inline;
}

#welcome {
	display: inline;
	height: 20px;
}

#cartitems.cart_table {
	border: 1px solid #E6E4DF;
	margin-bottom: 50px
}

#cart_items .cart_table .cart_menu {
	background: #000;
	color: #fff;
	font-size: 16px;
	font-family: 'Roboto', sans-serif;
	font-weight: normal;
}

#cart_items .cart_table .table.table-condensed thead tr {
	height: 51px;
}

#cart_items .cart_table .table.table-condensed tr {
	border-bottom: 1px solid #F7F7F0
}

#cart_items .cart_table .table.table-condensed tr:last-child {
	border-bottom: 0
}

.cart_table table tr td {
	border-top: 0 none;
	vertical-align: inherit;
}

#cart_items .cart_table .image {
	padding-left: 30px;
}

#cart_items .cart_table .cart_description h4 {
	padding-left: 50px;
	margin-bottom: 0
}

#cart_items .cart_table .cart_description h4 a {
	font-family: 'Roboto', sans-serif;
	font-size: 20px;
	font-weight: normal;
}

#cart_items .cart_table .cart_description p {
	padding-left: 50px;
	color: #696763
}

#cart_items .cart_table .cart_price p {
	color: #696763;
	font-size: 18px
}

#subtotal_cart {
	float: right;
	padding-left: 30px;
}

#cart_items .cart_table .cart_total_price {
	color: #FE980F;
	font-size: 24px;
}

#cart_items .cart_table .checkoutbutton {
	padding-right: 70px;
}

.cart_product {
	display: block;
	margin: 15px -70px 10px 25px;
}

.cart_quantity_button a {
	background: #F0F0E9;
	color: #696763;
	display: inline-block;
	font-size: 16px;
	height: 28px;
	overflow: hidden;
	text-align: center;
	width: 35px;
	float: left;
}

.input-mini {
	color: #696763;
	float: middle;
	font-size: 16px;
	text-align: center;
	font-family: 'Roboto', sans-serif;
}

.btn save_btn {
	vertical-align: inherit;
}

.cart_delete {
	display: block;
	margin-right: -12px;
	overflow: hidden;
}

.cart_delete a {
	background: #33C;
	color: #FFFFFF;
	padding: 7px 9px;
	font-size: 16px
}

.cart_delete a:hover {
	background: #000;
}
</style>
</head>
<body>
	<!--Header-->
	<header> <nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-inner">
		<a class="brand" href="home.jsp">OnlineKart</a> <a
			class="btn btn-navbar" data-toggle="collapse"
			data-target=".nav-collapse"> <span class="icon-bar"></span> <span
			class="icon-bar"></span> <span class="icon-bar"></span>
		</a>

		<div class="nav-collapse collapse">
			<ul class="nav">
				<c:forEach var="categories" items="${categories}">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <c:out
								value="${categories.key}" /></b>
					</a>

						<ul class="dropdown-menu">
							<c:forEach var="subcategories" items="${categories.value}">
								<c:url var="url" value="/category">
									<c:param name="subcat" value="${subcategories}" />
									<c:param name="categ" value="${categories.key}" />
								</c:url>
								<li><a tabindex="-1" href="${url}"><c:out
											value="${subcategories}" /></a></li>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
			<ul class="nav pull-right">
				<li class="dropdown"><a id="cartitem" class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span id="itemcount"
						class="btn btn-default btn-sm"><i
							class="icon-shopping-cart icon-red"></i> <c:set var="cartItems"
								scope="session" value="${cart.numberOfItems}" /> <span
							class="headerCartItemsCount"> <c:choose>
									<c:when test="${empty cartItems}">0
							</c:when>
									<c:otherwise>
										<c:out value="${cartItems}" />
									</c:otherwise>
								</c:choose>
						</span> <span class="headerCartItemsCountWord"><c:out
									value="${cartItems==1?'item':'items'}" /></span> <b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">View Cart</a></li>
						<li><a tabindex="-1" href="/">Checkout Cart</a></li>
						<li><a tabindex="-1" href="/">Clear Cart</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span id="welcome"
						class="btn btn-default btn-sm">User Name<b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">Account</a></li>
						<li><a tabindex="-1" href="/">Orders</a></li>
						<li><a tabindex="-1" href="/">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav> </header>

	<!-- Section -->
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ul class="breadcrumb">
				<li class="active"><a href="home.jsp">Home</a> <span
					class="divider">/</span></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
		<div class="table-responsive cart_table">
			<c:choose>
				<c:when test="${cart.numberOfItems == 0 ? true:false}">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description"></td>
								<td class="quantity">Quantity</td>
								<td class="price">Price</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr></tr>
							<tr></tr>
							<p>The Shopping Cart is Empty</p>
							<tr></tr>
							<tr></tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<table id="product_table" class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product</td>
								<td class="description"></td>
								<td class="quantity">Quantity</td>
								<td class="price">Price</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart_products" items="${scProductList}">
								<c:set var="products" value="${cart_products.product}" />
								<tr>
									<td class="cart_product"><a href=""><img alt=""
											src="http://placehold.it/125x89"></a></td>
									<td class="cart_description">
										<h4>
											<a href=""><c:out value="${products.productName}" /></a>
										</h4> </br>
										<p class="info">
											Category :
											<c:out value="${products.category}" />
										</p>
										<p class="info">
											Manufacturer:
											<c:out value="${products.productManufacturer}" />
										</p>
									</td>
									<td class="cart_quantity">
										<div class="form-horizontal">
											<button class="increment btn btn-primary">+</button>
											<input class="input-mini" name="mini" type="text" value="1">
											<button class="decrement btn btn-primary">-</button>
											<button class="update btn btn-primary">Update</button>
										</div>
									</td>
									<td class="cart_total">
										<p class="product_tot lead">
											Rs:
											<c:out value="${products.productPrice}" />
										</p>
									</td>
									<td class="cart_delete"><a class="cart_quantity_delete"
										href=""><i class="fa fa-times"></i></a></td>
								</tr>
							</c:forEach>
							<tr>
								<td>&nbsp;</td>
								<td><button id="checkoutbutton" class="btn btn-primary">Proceed
										to Checkout</button></td>
								<td><button id="continueshopping" id="continuebutton"
										class="btn btn-primary pull-left">Continue Shopping</button>
									<p id="subtotal_cart" class="lead">Total:</p></td>
								<td class="cart_sub_total">
									<p class="lead">
										Rs.
										<c:out value="${cart.total}" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</section>
	<script>
		$(document).ready(function() {
			$(".increment").on('click', function() {
				var $incdec = $(this).closest("td").find(".input-mini");
				if ($incdec.val() < 10) {
					$incdec.val(parseInt($incdec.val()) + 1);
				}
			});

			$(".decrement").on('click', function() {
				var $incdec = $(this).closest("td").find(".input-mini");
				if ($incdec.val() > 1) {
					$incdec.val(parseInt($incdec.val()) - 1);
				}
			});
		});

		$('.update').on('click', function() {
			// Find the active row
			var $update = $(this).closest('tr');

			// Find the Product Total Element in the present row
			var $carttot = $update.find('p.product_tot').text();

			// Find the Quantity of the Product
			var $quantity = $(this).closest('td').find('.input-mini').val();

			// Split the text and update the value
			var $arr = $carttot.split(':');
			var $prodtot = parseFloat($arr[1]) * $quantity;
			$update.find('p.product_tot').text("Rs: " + ($prodtot) + ".0");
			
			updateTotal();
		});
		
		$(function updateTotal(){
			$('table#product_table > tbody > tr').each(function(){
				var $prodprice = $(this).find('p.product_tot').text();
			});
		});
	</script>

</body>
</html>