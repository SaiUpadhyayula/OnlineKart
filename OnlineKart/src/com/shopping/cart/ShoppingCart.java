package com.shopping.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.jsp.PageContext;

import com.shopping.beans.Product;

public class ShoppingCart {

	private static HashMap<Integer, ShoppingCartItem> itemsMap = null;
	private int numberOfItems = 0;
	private final static Logger LOGGER = Logger.getLogger(ShoppingCart.class
			.getName());

	public ShoppingCart() {
		itemsMap = new HashMap<Integer, ShoppingCartItem>();
	}

	// Adds items to the shopping cart
	public synchronized void add(int productID, Product p) {
		ShoppingCartItem newItem = new ShoppingCartItem(p);
		itemsMap.put(productID, newItem);
		LOGGER.info("Quantity is :" + newItem.getQuantity());
	}

	// Update items in the shopping cart
	public synchronized void updateQuantity(int productID, int quantity,
			Product p) {
		if (itemsMap.containsKey(productID)) {
			ShoppingCartItem scItem = (ShoppingCartItem) itemsMap
					.get(productID);
			scItem.setQuantity(quantity);
		}
	}

	// Remove items from the shopping cart
	public synchronized void remove(Integer productID) {
		if (itemsMap.containsKey(productID)) {
			ShoppingCartItem scItem = itemsMap.get(productID);
			if (scItem.getQuantity() <= 1) {
				itemsMap.remove(productID);
			}
			numberOfItems--;
		}
	}

	// Clear all items in the shopping cart
	public synchronized void clear() {
		LOGGER.info("Clearing the Shopping Cart");
		itemsMap.clear();
		numberOfItems = 0;
	}

	// Get All the Items in the Shopping Cart
	public synchronized List<ShoppingCartItem> getItems() {
		List<ShoppingCartItem> listOfItems = new ArrayList<ShoppingCartItem>();
		listOfItems.addAll(this.itemsMap.values());
		return listOfItems;
	}

	// Get Number of Items in the Shopping Cart
	public synchronized int getNumberOfItems() {
		numberOfItems = 0;
		Iterator<ShoppingCartItem> scItemIterator = getItems().iterator();

		while (scItemIterator.hasNext()) {
			ShoppingCartItem items = scItemIterator.next();
			numberOfItems += items.getQuantity();
		}

		return numberOfItems;
	}

	// Get the Total Value of the Shopping Cart
	public synchronized double getTotal() {

		double amount = 0.0;
		Iterator<ShoppingCartItem> anotherSCItemIterator = getItems()
				.iterator();
		while (anotherSCItemIterator.hasNext()) {
			ShoppingCartItem anotherSCItem = anotherSCItemIterator.next();
			Product product = anotherSCItem.getProduct();
			amount += (anotherSCItem.getQuantity() * product.getProductPrice());
		}

		return amount;
	}

	// Checks whether a particular product
	// is already present in the cart
	public static boolean checkProductInCart(PageContext pageContext) {
		int productID = (int) pageContext.findAttribute("productID");
		if (itemsMap == null)
			itemsMap = new HashMap<Integer, ShoppingCartItem>();
		if (itemsMap.containsKey(productID)) {
			LOGGER.info("Product already exists in the cart");
			return true;
		}
		return false;
	}
}
