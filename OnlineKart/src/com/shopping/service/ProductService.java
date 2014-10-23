package com.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.beans.Category;
import com.shopping.beans.Product;
import com.shopping.db.DBConnection;

public class ProductService {

	private List<Product> products = null;
	private List<Category> categories = null;
	private List<String> subCategories = null;
	private String categoryName;

	// Method to get all products available
	public List<Product> getAllProducts() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select * from products";
		products = new ArrayList<Product>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("productID"),
						rs.getString("productName"),
						rs.getDouble("productPrice"),
						rs.getString("productSummary"),
						rs.getString("productCategory"),
						rs.getString("productSubCategory"),
						rs.getString("productManufacturer"));
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
	

		}

		return products;

	}

	// Method to get the required Product Details
	public Product getProductDetails(int productId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		Product p = new Product();
		sql = "select productName,productPrice,productSummary,productCategory,productSubCategory,productManufacturer from products where productId=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				p.setProductId(productId);
				p.setProductName(rs.getString(1));
				p.setProductPrice(rs.getDouble(2));
				p.setDescription(rs.getString(3));
				p.setCategory(rs.getString(4));
				p.setSubCategory(rs.getString(5));
				p.setProductManufacturer(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}


		}
		return p;
	}

	// Method to get all the available Categories
	public List<Category> getAllCategories() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productCategory from category";
		categories = new ArrayList<Category>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs.getString("productCategory"));
				categories.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

	
		}
		return categories;
	}

	// Method to get all the available Subcategories under a Category
	public List<String> getSubCategory(Category category) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "SELECT productSubCategory FROM subcategory s where s.productCategory = ? ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, category.getProductCategory());
			rs = ps.executeQuery();
			subCategories = new ArrayList<String>();
			while (rs.next()) {
				subCategories.add(rs.getString("productSubCategory"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return subCategories;
	}

	// Method to get all the Products based on specified SubCategory
	public List<Product> getProductBySubCategory(String subCategory) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productID,productName,productPrice,productSummary,productCategory,productManufacturer from products where productSubCategory=?";
		products = new ArrayList<Product>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subCategory);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2),
						rs.getDouble(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
				products.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return products;
	}

	// Method to get all the Products based on specified SubCategory
	public List<Product> getProductByCategory(String category) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productID,productName,productPrice,productSummary,productCategory,productManufacturer from products where productCategory=?";
		products = new ArrayList<Product>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2),
						rs.getDouble(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
				products.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		}
		return products;
	}

	// Method to get Product Category
	// based on Sub Category
	public String getCategoryBySubCategory(String subCategory) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = DBConnection.getConnecton();
		sql = "select productCategory from subcategory where productSubCategory=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subCategory);
			rs = ps.executeQuery();
			while (rs.next()) {
				categoryName = rs.getString("productCategory");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return categoryName;
	}
}
