package com.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public boolean verifyUser(String email,String password){
		conn = DBConnection.getConnecton();
		String sql = "select UserID from userdetails where Email=? AND Password=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				if(rs.getString("UserID")!=null){
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
