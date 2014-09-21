<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShoppingKart</title>
<link href="bootstrap/css/shop-homepae.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<script src="bootstrap/scripts/jquery-1.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<!--Header-->
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-inner">
		<a class="brand" href="/">Shopping Kart</a> <a class="btn btn-navbar"
			data-toggle="collapse" data-target=".nav-collapse"> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>

		<div class="nav-collapse collapse">
			<ul class="nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Category 1</b>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">Sub Category 1</a></li>
						<li><a tabindex="-1" href="/">Sub Category 2</a></li>
						<li><a tabindex="-1" href="/">Sub Category 3</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Category 2</b>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">Sub Category 1</a></li>
						<li><a tabindex="-1" href="/">Sub Category 2</a></li>
						<li><a tabindex="-1" href="/">Sub Category 3</a></li>
					</ul></li>
			</ul>
			<ul class="nav pull-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">X Items <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="/">Checkout Cart</a></li>
						<li><a tabindex="-1" href="/">Clear Cart</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Welcome User <b class="caret"></b>
				</a>
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
		<div class="row">
			<div class="span12">
				<table
					class="table table-striped table-bordered table-hover table-condensed">
					<caption>
						<p class="lead">Items in your ShoppingKart</p>
					</caption>
					<thead>
						<tr>
							<th>Product</th>
							<th>Stock</th>
							<th>Add</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="">
									<img src="http://placehold.it/100x100" />
								</div>
								<div class="">
									<p>Product</p>
									<p>Price</p>
									<p>Manufacturer</p>
								</div>
							</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>