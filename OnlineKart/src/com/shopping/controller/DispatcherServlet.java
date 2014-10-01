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
import com.shopping.cart.ShoppingCartItem;
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
	private HttpSession hs;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userPath = request.getServletPath();
		String getURL = "/" + userPath + ".jsp";

		// If user requested category page
		if (userPath.equals("/category")) {
			ProductService productService = new ProductService();
			String subCategory = request.getParameter("subcat");
			String catName = request.getParameter("categ");
			// If the user requested only products
			// of specific category
			if (catName != null) {
				List<Product> productsCategoryList = productService
						.getProductByCategory(catName);
				request.setAttribute("productByCategory", productsCategoryList);
			}

			// If the user requested only products
			// of specific subcategory
			if (subCategory != null) {
				List<Product> categoryProducts = productService
						.getProductBySubCategory(subCategory);
				String categoryName = productService
						.getCategoryBySubCategory(subCategory);
				getServletContext().setAttribute("categoryProducts",
						categoryProducts);
				getServletContext().setAttribute("catName", categoryName);
			}

			getServletContext().setAttribute("subCat", subCategory);
		}
		// If user requested cart page
		else if (userPath.equals("/cart")) {
			// Retrieve all the items available in the cart
			hs = request.getSession();
			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			if (cart != null) {
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher(getURL);
				rd.forward(request, response);
			}

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
			hs = request.getSession();
			hs.setAttribute("product", product);
			hs.setAttribute("productID", productId);
			// Set Product Category and SubCategory in the Context Attribute
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

			int prodID = Integer.parseInt((hs.getAttribute("productID")
					.toString()));
			Integer productID = new Integer(prodID);
			// Check whether the product id is not null
			// If not null then add the product to the cart

			if (productID != null) {
				ProductService service = new ProductService();
				Product p = service.getProductDetails(productID);

				cart.add(productID, p);
				response.sendRedirect("product.jsp");

			}
		}

		// If user request to update the products
		else if (userPath.equals("/update")) {
			String prod_id = request.getParameter("productid");
			int productid = Integer.parseInt(prod_id);
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			ProductService productService = new ProductService();
			Product product = (Product) productService
					.getProductDetails(productid);

			ShoppingCart cart = (ShoppingCart) hs.getAttribute("cart");

			if (cart != null) {
				cart.updateQuantity(productid, quantity, product);
			}
			response.sendRedirect("cart.jsp");
		}
		// If user request to purchase the products
		else if (userPath.equals("/purchase")) {
			// TODO: Add code to purchase products
		}

	}

}
