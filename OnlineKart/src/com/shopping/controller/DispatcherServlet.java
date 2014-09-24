package com.shopping.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.beans.Product;
import com.shopping.cart.ShoppingCart;
import com.shopping.service.ProductService;

/**
 * @author Sai
 * 
 *         Servlet implementation class DispatcherServlet This Servlet acts as a
 *         controller and routes the request from the client to appropriate
 *         Service Classes
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userPath = request.getServletPath();
		String getURL = "/" + userPath + ".jsp";

		// If user requested category page
		if (userPath.equals("/category")) {
			ProductService productService = new ProductService();
			String subCategory = request.getParameter("subcat");
			String catName = request.getParameter("categ");
			if (catName != null) {
				List<Product> productsCategoryList = productService
						.getProductByCategory(catName);
				request.setAttribute("productByCategory", productsCategoryList);
			}
			List<Product> categoryProducts = productService
					.getProductBySubCategory(subCategory);
			String categoryName = productService
					.getCategoryBySubCategory(subCategory);

			getServletContext().setAttribute("categoryProducts",
					categoryProducts);
			getServletContext().setAttribute("catName", categoryName);
			getServletContext().setAttribute("subCat", subCategory);
		}
		// If user requested cart page
		else if (userPath.equals("/cart")) {
			// TODO : Add code for cart page
		}
		// If user requested checkout page
		else if (userPath.equals("/checkout")) {
			// TODO : Add code for checkout page
		}
		// If user request home page
		else if (userPath.equals("/home")) {
			ProductService productService = new ProductService();
			List<Product> productsList = productService.getAllProducts();

			getServletContext().setAttribute("productsList", productsList);

		}
		// If user request product page
		else if (userPath.equals("/product")) {
			int productId = Integer.parseInt(request.getParameter("productId"));
			ProductService productService = new ProductService();
			Product product = (Product) productService
					.getProductDetails(productId);
			getServletContext().setAttribute("product", product);

			// Set Product Category and SubCategory in the Request Attribute
			getServletContext().setAttribute("productCategory",
					product.getCategory());
			getServletContext().setAttribute("productSubCategory",
					product.getSubCategory());
		}

		// Forward the request to appropriate
		// views (JSP's)
		RequestDispatcher rd = getServletContext().getRequestDispatcher(getURL);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userPath = request.getServletPath();
		String postURL = "/" + userPath + ".jsp";

		// If user request to add products
		// to shopping cart
		if (userPath.equals("/addProducts")) {

			// Request the Session
			HttpSession hs = request.getSession();
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			// Checks whether cart is available
			// If not, then will create a cart object
			if (cart == null) {
				cart = new ShoppingCart();
				hs.setAttribute("cart", cart);
			}

			int prodID = Integer.parseInt(request.getParameter("id"));
			Integer productID = new Integer(prodID);
			// Check whether the product id is not null
			// If not null then add the product to the cart

			if (productID != null) {
				ProductService service = new ProductService();
				Product p = service.getProductDetails(productID);

				cart.add(productID, p);

				System.out.println("Productid is " + prodID);
			}

		}
		// If user request to purchase the products
		else if (userPath.equals("/purchase")) {
			// TODO: Add code to purchase products
		}

	}

}
