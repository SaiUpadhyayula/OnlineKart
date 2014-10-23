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
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<style>
body {
	background-color: white;
}

#cartitem {
	display: inline;
}

#welcome {
	display: inline;
	height: 20px;
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
						<li><a tabindex="-1" href="checkout">Checkout Cart</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span id="welcome"
						class="btn btn-default btn-sm"> <c:choose>
								<c:when test="${empty email}">
									<c:out value="Hello Guest" />
								</c:when>
								<c:otherwise>
									<c:out value="Hello ${email}" />
								</c:otherwise>
							</c:choose>
					</span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">Account</a></li>
						<li><a tabindex="-1" href="/">Orders</a></li>
						<li><a tabindex="-1" href="/">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav> </header>

	<!-- Body -->
	<section>
	<div class="container">
		<ul class="breadcrumb">
			<li class="active"><c:url var="url" value="/category">
					<c:param name="categ" value="${productCategory}" />
				</c:url> <a href="${url}">${productCategory}</a> <span class="divider">/</span></li>
			<li class="active"><c:url var="url" value="/category">
					<c:param name="subcat" value="${productSubCategory}" />
				</c:url><a href="${url}">${productSubCategory}</a> <span class="divider">/</span></li>
			<li class="active">${product.productName}</li>
		</ul>
		<div class="row">
			<div class="span6">
				<input type="hidden" value="${productID}" name="id">
				<p class="lead">${product.productName}</p>
				<a href="#themodal" role="button" id="btn-buynow"
					class="btn btn-primary pull-right" data-toggle="modal">Buy Now</a>
				<p>${product.productPrice}</p>
				<p>${product.productManufacturer}</p>
				<br>
				<p>${product.description}</p>
			</div>
			<div id="themodal" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3>Add Item to the Cart</h3>
				</div>

				<div class="modal-body">
					<c:choose>
						<c:when test="${f:checkProductInCart(pageContext)}">
							<p class="text-warning">Product - ${product.productName} is
								already added to your Shopping Cart.</p>
						</c:when>
						<c:otherwise>
							<p class="text-success">Product - ${product.productName} will
								be added to your Shopping Cart.</p>
						</c:otherwise>
					</c:choose>

					<hr />
					<div>
						<table class="table table-condensed">
							<thead>
								<tr>
									<td>Product</td>
									<td>Quantity</td>
									<td>Price</td>
								</tr>
							</thead>
							<tbody>
								<tr class="active">
									<td><img src="images/small/${productID}.jpg" /></td>
									<td><input class="input-mini" type="text" placeholder="1"></td>
									<td class="price">${product.productPrice}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<form method="post" action="addProducts" class="addCartForm">
							<c:choose>
								<c:when test="${f:checkProductInCart(pageContext)}">
									<button class="btn btn-primary pull-left" id="disabledbutton"
										onload="disableButton">In Cart!</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-primary pull-left" id="addtocart">Add
										to Cart</button>
								</c:otherwise>
							</c:choose>

							<a href="#" class="btn" data-dismiss="modal">Continue
								Shopping</a> <a id="yesbutton" href="#" class="btn btn-primary">Place
								Order</a>
						</form>
					</div>
				</div>
			</div>
			<div class="span6">
				<img alt="${products.productName}"
					src="images/large/${productID}.jpg" />
				<div class="carousel-bounding-box">
					<div id="slidingcarousel" class="carousel slide"
						style="width: px; margin: 0 auto">
						<div class="carousel-inner">
							<div class="carousel-inner">
								<div class="active item" data-slide-number="0">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100">
								</div>
								<div class="item" data-slide-number="1">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100/technics/1">
								</div>
								<div class="item" data-slide-number="2">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100/business/1">
								</div>
								<div class="item" data-slide-number="3">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100/city">
								</div>
								<div class="item" data-slide-number="4">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100/city/1">
								</div>
								<div class="item" data-slide-number="5">
									<img class="img-rounded img-responsive"
										src="http://lorempixel.com/120/100">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
	<script>
		var productPrice = "${product.productPrice}";
		var productId = "${productID}";

		function updateHeaderCartItemsCount(newCount) {
			$('.headerCartItemsCount').html(newCount);
			$('.headerCartItemsCountWord').html(
					(newCount == 1) ? ' item' : ' items');
		}

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

		// This script is used to update the price
		// based on the provided quantity
		$(function() {
			$('input.input-mini').keyup(function(event) {
				var quantity = $('input.input-mini').val();
				var totalPrice = quantity * productPrice;

				var subTotal = totalPrice + ".0";
				if ($.isNumeric(quantity)) {
					$('td.price').text(subTotal);
				}
			});
		});
		// This script is used to update the price
		// when the quantity field is empty
		$(function() {
			$('input.input-mini').focusout(function() {
				var quant = $('input.input-mini').val();
				if (quant == '') {
					var totalPrice = productPrice;
					$('td.price').text(totalPrice);
				}
			});
		});
		var form = $('addCartForm');
		var itemRequest = serializeObject(form);
		var cartItems = "${cart.numberOfItems}";
		$(function() {
			$('#addtocart').click(function(event) {
				$('#themodal').modal('toggle');

				$.ajax({
					url : $form.attr('action'),
					type : "POST",
					success : function(data) {
						updateHeaderCartItemsCount(cartItems);
						alert(cartItems);
					}
				});
			});

		});

		// Disables a button
		$(function disableButton() {
			jQuery.fn.extend({
				disable : function(state) {
					return this.each(function() {
						this.disabled = state;
					});
				}
			});

			$('#disabledbutton').disable(true);
		});
	</script>
</body>
</html>