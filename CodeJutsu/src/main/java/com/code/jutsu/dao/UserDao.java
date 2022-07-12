package com.code.jutsu.dao;
import java.sql.*;

import com.code.jutsu.entities.User;
public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		
		boolean f= false;
		
		try {
			
			String query = " insert into user(name,email,password,about) values(?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			
			pstmt.execute();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByEmailandPassWord(String email, String password) {
		User user = null;
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				user = new User();
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setId(set.getInt("id"));
				user.setAbout(set.getString("about"));
				user.setReg_date(set.getTimestamp("reg_date"));
				user.setProfile(set.getString("profile"));
				user.setPassword(set.getString("password"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			String query="update user set name=?, password=?, about=?, profile=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getAbout());
			pstmt.setString(4, user.getProfile());
			pstmt.setInt(5, user.getId());
			
			pstmt.executeUpdate();
			f=true;
		
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	

}
