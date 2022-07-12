package com.code.jutsu.helper;
import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			if(con==null) {
				//loading driver class
				Class.forName("com.mysql.jdbc.Driver");
				
				//creating connection
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/codejutsu", "root", "Sunny30@sql");
				 
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
