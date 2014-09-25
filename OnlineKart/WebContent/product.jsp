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
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<style>
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
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-inner">
		<a class="brand" href="/home.jsp">OnlineKart</a> <a
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
							class="icon-shopping-cart icon-red"></i>0 Items in Cart <b
							class="caret"></b></span></a>
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
	</nav>

	<!-- Body -->
	<div class="container">
		<ul class="breadcrumb">
			<li class="active"><c:url var="url" value="/category">
					<c:param name="categ" value="${productCategory}" />
				</c:url> <a href="${url}">${productCategory}</a> <span class="divider">/</span></li>
			<li class="active"><a href="${url}">${productSubCategory}</a> <span
				class="divider">/</span></li>
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
					<p>Product - ${product.productName} is added to your Shopping
						Cart</p>
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
									<td><img src="http://placehold.it/125x89" /></td>
									<td><input class="input-mini" type="text" placeholder="1"></td>
									<td class="price">${product.productPrice}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<form method="post" class="addCartForm">
							<button class="btn btn-primary pull-left" id="addtocart">Add
								to Cart</button>
							<a href="#" class="btn" data-dismiss="modal">Continue
								Shopping</a> <a id="yesbutton" href="#" class="btn btn-primary">Proceed
								to Checkout</a>
						</form>
					</div>
				</div>
			</div>
			<div class="span6">
				<img src="http://placehold.it/250x405" />
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

	<script>
		var productPrice = "${product.productPrice}";
		var sessionVariable = "${numberOfItems}";
		var productId = "${productID}";
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

		// TODO
		$(function() {
			$('#addtocart').click(function(event) {
				$('#themodal').modal('toggle');
				alert(sessionVariable);
				$.ajax({
					method : 'POST',
					url : 'addProducts',
					data : productId,
					success : function(status, xhr) {
						if (sessionVariable == '1') {
							var cartData = sessionVariable + " Item in Cart";
						} else {
							var cartData = sessionVariable + " Items in Cart";
						}
						$('#itemcount').click(function() {
							var icon = $(this).children("i");
							$(this).text(cartData);
						});

					},
					error : function(xhr, status, error) {
						alert('Error Occured: ' + status);
					}
				});

			});
		});
	</script>
</body>
</html>