package com.shopping.cart;

import java.io.Serializable;

import com.shopping.beans.Product;

public class ShoppingCartItem implements Serializable {

	private Product product;
	private int quantity;

	public ShoppingCartItem(Product p) {
		product = p;
		quantity = 1;
	}

	// Method to increase the quantity
	// of the product in the cart
	public void incrementQuantity() {
		quantity++;
	}

	// Method to decrease the quantity
	// of the product in the cart
	public void decrementQuantity() {
		--quantity;
	}

	/**
	 * 
	 * Beginning of Getters and Setters
	 */

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * 
	 * End of Getters and Setters
	 */

	public double getTotal() {
		double amount = 0;
		amount = (this.getQuantity() * product.getProductPrice());
		return amount;
	}

}
