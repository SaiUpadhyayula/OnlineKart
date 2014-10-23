<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://onlinekart.com/commonFunctions" prefix="f"%>
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
	background-color: white;
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
						<li><a tabindex="-1" href="cart">View Cart</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span id="welcome"
						class="btn btn-default btn-sm"><c:out
								value="Hello ${email}" /></span></a>
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
				<c:when test="${cart.numberOfItems == 0}">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<div class="hero-unit">
									<h3>The Shopping Cart is Empty</h3>
									<a href="home.jsp" class="btn btn-primary btn-large">Continue
										Shopping</a>
								</div>
							</tr>
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
							<c:forEach var="cart_products" items="${cart.items}">
								<c:set var="products" value="${cart_products.product}" />
								<tr>
									<td class="cart_product"><a href=""><img alt="${products.productName}"
											src="images/small/${products.productId}.jpg" /></a></td>
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
											<form action="update" method="POST">
												<input type="hidden" name="productid"
													value="<c:out value="${products.productId}"/>" /><input
													type="number" name="quantity" size="2" maxlength="2"
													class="input-mini" max="10" min="1"
													value="<c:out value="${cart_products.quantity}"/>" />
												<button class="update btn btn-primary">Update</button>
											</form>
										</div> <!--  										<div class="form-horizontal">
												<button class="increment btn btn-primary">+</button>
												<input class="input-mini" name="mini" type="text" value="1">
												<button class="decrement btn btn-primary">-</button>
												<button class="update btn btn-primary">Update</button>
										</div>
-->
									</td>
									<td class="cart_total">
										<p class="product_tot lead">
											Rs:
											<c:out value="${cart_products.total}" />
										</p>
									</td>
									<td class="cart_delete">
										<form action="remove" method="POST">
											<input type="hidden" name="pid"
												value="<c:out value="${product.productId}"/>" />
											<button type="submit"
												class="cart_quantity_delete btn btn-primary">
												<i class="fa fa-times" id="remove"></i>
											</button>
										</form>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td>&nbsp;</td>
								<td><a role="button" href="checkout_unreg.jsp"
									id="checkoutbutton" class="btn btn-primary">Proceed to
										Checkout
										</button></td>
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
		$(function updateTotal() {
			var $totprice = 0;
			$('table#product_table > tbody > tr').each(function() {
				if (!$(this).hasClass('.cart_sub_total')) {
					var $prodprice = $(this).find('p.product_tot').text();
					var $arr = $prodprice.split(':');
					var $prodtot = parseFloat($arr[1]);
					console.log($prodtot);
					$totprice = parseFloat($totprice) + parseFloat($prodtot);
					console.log($totprice);
				}
			});
			return false;
		});

		$('#remove').click(function() {
			var itemToRemove = $(this).attr("data-id");

		});

		function ajax(options, callback) {
			var defaults = {
				success : function(data) {
					if (!redirectIfNecessary($(data))) {
						var extraData = getExtraData($(data));
						callback(data, extraData);
					}
				}
			};

			$.extend(options, defaults);
			$.ajax(options);
		}

		function serializeObject($object) {
			var o = {};
			var a = $object.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		}
	</script>

</body>
</html>