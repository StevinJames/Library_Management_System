package com.spring.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserConnection {
	public static Connection getConnection() {
		Connection con = null;
		 try {
		      Class.forName("com.mysql.cj.jdbc.Driver");
		      
		       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata","root","zeroattacker");
		       System.out.println("Your server have been connected.");
		    } catch (ClassNotFoundException e) {
		      System.out.println("Driver error : "+e.getMessage());
		    }catch(SQLException e) {
		      System.out.println("Connection error : "+e.getMessage());
		    }
		return con;
	}
	

}
