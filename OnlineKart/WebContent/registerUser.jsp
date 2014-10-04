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
.paymentinfo ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.paymentinfo ul li {
	display: inline;
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
	</div>
	</nav> </header>

	<!-- Section -->
	<section>
	<div class="container">
		<div class="breadcrumbs">
			<ul class="breadcrumb">
				<li class="active"><a href="home.jsp">Home</a> <span
					class="divider">/</span></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
		<div class="loginsection">
			<h3>Please Login to complete the transaction.</h3>
			<hr class="soft" />
			<div class="row">
				<div class="span5">
					<div class="well">
						<h5>CREATE YOUR ACCOUNT</h5>
						</br>
						<p>Enter you e-mail address to create an account.</p>
						</br>
						<form action="registerUser.jsp" method="post">
							<div class="control-group">
								<label class="control-label" for="inputEmail">E-mail
									Address</label>
								<div class="controls">
									<input class="span3" type="text" id="inputEmail"
										placeholder="Enter you email" />
								</div>
							</div>
							<div class="controls">
								<button type="submit" class="btn btn-primary">Create
									Your Account</button>
							</div>
						</form>
					</div>
				</div>
				<div class="span1">&nbsp;</div>
			</div>
		</div>
		<hr class="soft" />
		<div class="review-payment">
			<h2>Review Your Order</h2>
		</div>
		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Product</td>
						<td class="description">Description</td>
						<td class="quantity">Quantity</td>
						<td class="total">Total</td>
						<td class="action"></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cart_products" items="${cart.items}">
						<c:set var="products" value="${cart_products.product}" />
						<tr>
							<td class="cart_product"><a href=""><img
									src="http://placehold.it/125x89" alt=""></a></td>
							<td class="cart_description">
								<h4>
									<c:url var="url" value="/product">
										<c:param name="productId" value="${products.productId}" />
									</c:url>
									<a href="${url}"><c:out value="${products.productName}" /></a>
								</h4>
								<p class="info">
									Category:
									<c:out value="${products.category}" />
								</p>
								<p class="info">
									Manufacturer:
									<c:out value="${products.productManufacturer}" />
								</p>
							</td>
							<td class="cart_quantity">
								<p class="info">
									<c:out value="${cart_products.quantity}" />
								</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
									<c:out value="${cart_products.total}" />
								</p>
							</td>
							<td class="cart_delete"><a role="button" href="/cart"
								class="btn btn-default" href="">Edit</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3">&nbsp;</td>
						<td colspan="2">
							<div class="well">
								<table class="table table-condensed total-result">
									<tr>
										<td>Cart Sub Total</td>
										<td>
											<p>
												Rs.
												<c:out value="${cart.total}" />
											</p>
										</td>
									</tr>
									<tr class="shipping-cost">
										<td>Shipping Cost</td>
										<td>Free</td>
									</tr>
									<tr>
										<td>Total</td>
										<td>
											<p>
												Rs.
												<c:out value="${cart.total}" />
											</p>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr class="soft" />
	</div>
	</section>
</body>
</html>