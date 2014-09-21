package com.shopping.beans;

/**
 * 
 * @author sai
 * 
 *         This is Manufacturer bean class
 */
public class Manufacturer {

	private int manufacturerId;
	private String productManufacturer;

	public Manufacturer(int manufacturerId, String productManufacturer) {
		super();
		this.manufacturerId = manufacturerId;
		this.productManufacturer = productManufacturer;
	}

	public int getManufacturerId() {
		return manufacturerId;
	}

	public void setManufacturerId(int manufacturerId) {
		this.manufacturerId = manufacturerId;
	}

	public String getProductManufacturer() {
		return productManufacturer;
	}

	public void setProductManufacturer(String productManufacturer) {
		this.productManufacturer = productManufacturer;
	}

}
