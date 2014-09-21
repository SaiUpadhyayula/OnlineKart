package com.shopping.beans;

import java.io.Serializable;

/**
 * 
 * @author Sai This is a product bean class
 */
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int productId;
	private String productName;
	private double productPrice;
	private String description;
	private String categoryName;
	private String subCategory;
	private String productManufacturer;

	public Product(int i, String productName, double productPrice,
			String description, String string, String subCategory,
			String productManufacturer) {
		super();
		this.productId = i;
		this.productName = productName;
		this.productPrice = productPrice;
		this.description = description;
		this.categoryName = string;
		this.subCategory = subCategory;
		this.productManufacturer = productManufacturer;
	}

	public Product() {
	}

	public Product(int i, String productName, double productPrice,
			String description, String string, String productManufacturer) {
		super();
		this.productId = i;
		this.productName = productName;
		this.productPrice = productPrice;
		this.description = description;
		this.categoryName = string;
		this.productManufacturer = productManufacturer;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return categoryName;
	}

	public void setCategory(String category) {
		this.categoryName = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getProductManufacturer() {
		return productManufacturer;
	}

	public void setProductManufacturer(String productManufacturer) {
		this.productManufacturer = productManufacturer;
	}

}
