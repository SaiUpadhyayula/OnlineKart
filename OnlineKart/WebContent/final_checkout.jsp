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

#welcome {
	display: inline;
	height: 20px;
}

#Login {
	display: inline;
	height: 20px;
}

#itemcount {
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
				<li class="dropdown"><c:choose>
						<c:when test="${empty email}">
							<a href="login.jsp"><span id="Login"
								class="btn btn-default btn-sm">Login</span></a>
						</c:when>
						<c:otherwise>
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
								id="welcome" class="btn btn-default btn-sm"><c:out
										value="Hello ${email}" /><b class="caret"></b></span></a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="/">Account</a></li>
								<li><a tabindex="-1" href="/">Orders</a></li>
								<li><a tabindex="-1" href="/">Sign out</a></li>
							</ul>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
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
		<hr class="soft" />
		<c:choose>
			<c:when test="${empty cart}">
				<table class="table table-condensed">
					<tbody>
						<tr>
							<div class="hero-unit">
								<h3>No Items to Checkout!! Add Items to your shopping cart
									and comeback!! :)</h3>
								<a href="home.jsp" class="btn btn-primary btn-large">Continue
									Shopping</a>
							</div>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
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
											src="images/meluha-small.jpg" alt=""></a></td>
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
									<td class="cart_delete"><a role="button" href="cart"
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
				<div class="paymentinfo">
					<p class="lead">Payment Information</p>
					<div class="span6">
						<div class="well">
							<ul id="payment-methods">
								<li><img src="images/mastercard.png" alt="Master Card"></li>
								<li><img src="images/visa.png" alt="Visa Express"></li>
								<li><img src="images/paypal.png" alt="Paypal"></li>
								<li><img src="images/AEx.png" alt="American Express"></li>
								<li><img src="images/discover.png" alt="Discover"></li>
							</ul>
							</br>
							<form action="purchase" method="post">
								<fieldset>
									<div class="control-group">
										<label for="cardType">Select your Card</label> <select
											id="cardType_SelectedValue" name="cardType.SelectedValue">
											<option>Master Card</option>
											<option>Visa Express</option>
											<option>American Express</option>
											<option>Discover</option>
										</select>
									</div>
									<div class="control-group">
										<label id="cardnumber" for="cardNumber">Credit Card
											Number</label>
										<div class="controls">
											<input class="span3" id="cardNumber" name="cardnumber"
												type="text" placeholder="">
										</div>
									</div>
									<div class="control-group">
										<label id="expire" for="expireDate">Expiry Date</label>
										<div class="controls">
											<input type="text" class="input-mini" size="1" maxlength="2"
												placeholder="MM"> <span class="divider">/</span> <input
												type="text" class="input-mini" size="2" maxlength="4"
												placeholder="YYYY">
										</div>
										<label id="expire" for="expireDate">Expiry Date</label>
										<div class="controls">
											<input type="text" class="input-mini" maxlength="3"
												placeholder="CVV" />
										</div>
										<div class="controls">
											<button role="submit" class="btn btn-primary">Purchase</button>
											<button role="reset" class="btn btn-primray">Reset</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	</section>
</body>
</html>