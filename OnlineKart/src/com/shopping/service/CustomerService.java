package com.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.shopping.db.DBConnection;

public class CustomerService {

	private Connection conn;

	// This method is used to register customer
	public boolean registerCustomer(String email, String password) {

		try {
			conn = DBConnection.getConnecton();
			String sql = "insert into userdetails(Email,Password) values(?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			int result = ps.executeUpdate();

			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// This method is used to verify if the customer is registered
	// or not
	public boolean verifyUser(String email,String passwrod){
		conn = DBConnection.getConnecton();
		String sql = "select userid from userdetails where ";
		return false;
	}

}
