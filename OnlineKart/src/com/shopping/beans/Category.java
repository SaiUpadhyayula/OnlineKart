package com.shopping.beans;

/**
 * 
 * @author sai This is Category Bean Class
 */
public class Category {

	private int categoryid;
	private String productCategory;

	public Category(int categoryid, String productCategory) {
		super();
		this.categoryid = categoryid;
		this.productCategory = productCategory;
	}

	public Category() {
	}

	public Category(String productCategory) {
		// TODO Auto-generated constructor stub
		this.productCategory = productCategory;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

}
