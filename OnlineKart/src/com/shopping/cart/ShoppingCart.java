package com.shopping.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import com.shopping.beans.Product;

public class ShoppingCart {

	private HashMap<Integer, ShoppingCartItem> itemsMap = null;
	private int numberOfItems;
	private final static Logger LOGGER = Logger.getLogger(ShoppingCart.class
			.getName());

	public ShoppingCart() {
		itemsMap = new HashMap<Integer, ShoppingCartItem>(1);
	}

	// Adds items to the shopping cart
	public synchronized void add(int productID, Product p) {
		// If the product is already in the cart
		// Increment the Quantity
		if (itemsMap.containsKey(productID)) {
			ShoppingCartItem scItem = itemsMap.get(productID);
			scItem.incrementQuantity();
			LOGGER.info("Quantity is :" + scItem.getQuantity());
		}
		// If the Product is not already in the cart
		// Create a ShoppingCart Item and put it in the cart
		else {
			ShoppingCartItem newItem = new ShoppingCartItem(p);
			itemsMap.put(productID, newItem);
			LOGGER.info("Quantity is :" + newItem.getQuantity());
		}
	}

	// Remove items from the shopping cart
	public synchronized void remove(Integer productID) {
		if (itemsMap.containsKey(productID)) {
			ShoppingCartItem scItem = itemsMap.get(productID);
			if (scItem.getQuantity() <= 0) {
				itemsMap.remove(productID);
			} else {
				scItem.decrementQuantity();
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
	public synchronized List<ShoppingCartItem> getAllItems() {
		List<ShoppingCartItem> listOfItems = new ArrayList<ShoppingCartItem>();
		listOfItems.addAll(this.itemsMap.values());
		return listOfItems;
	}

	// Get Number of Items in the Shopping Cart
	public synchronized int getNumberOfItems() {
		Iterator<ShoppingCartItem> scItemIterator = getAllItems().iterator();

		while (scItemIterator.hasNext()) {
			ShoppingCartItem items = scItemIterator.next();
			numberOfItems += items.getQuantity();
		}

		return numberOfItems;
	}

	// Get the Total Value of the Shopping Cart
	public synchronized double getTotal() {

		double amount = 0.0;
		Iterator<ShoppingCartItem> anotherSCItemIterator = getAllItems()
				.iterator();
		while (anotherSCItemIterator.hasNext()) {
			ShoppingCartItem anotherSCItem = anotherSCItemIterator.next();
			Product product = anotherSCItem.getProduct();
			amount += (anotherSCItem.getQuantity() * product.getProductPrice());
		}

		return amount;
	}
}
