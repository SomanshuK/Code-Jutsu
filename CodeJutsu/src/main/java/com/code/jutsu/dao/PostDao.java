package com.code.jutsu.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.code.jutsu.entities.Category;
import com.code.jutsu.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		
		this.con = con;
	}
	
	public ArrayList<Category> getCategories(){

		ArrayList<Category> lst = new ArrayList<>();
		
		try {
			String query ="select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(query);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid, name, description);
				lst.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	public boolean savePost(Post p) {
		boolean f =false;
		
		try {
			String query = "insert into posts(pTitle, pContent, pCode, pPic, cid, userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCid());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Post> getPosts(){
		List<Post> lst = new ArrayList<>();
		try {
			PreparedStatement p = con.prepareStatement("select * from posts");
			
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				int userID = set.getInt("userID");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userID); 
				lst.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lst;
		
	}
	public List<Post> getPostsByCid(int cid){
		List<Post> lst = new ArrayList<>();
		try {
			PreparedStatement p = con.prepareStatement("select * from posts where cid=?");
			p.setInt(1, cid);
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				
				int userID = set.getInt("userID");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userID); 
				lst.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lst;
		
	}
	
	public Post getPostByPostId(int postID) {
		
		Post post = null;
		String query = "select * from posts where pid=?";
		try {
			PreparedStatement p = this.con.prepareStatement(query);
			p.setInt(1, postID);
			ResultSet set = p.executeQuery();
			
			if(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				int userID = set.getInt("userID");
				
				post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userID); 
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return post;
		
	}
	
}
