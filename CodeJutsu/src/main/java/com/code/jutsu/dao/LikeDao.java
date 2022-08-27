package com.code.jutsu.dao;
import java.sql.*;
public class LikeDao {

	Connection con;
	
	
	
	public LikeDao(Connection con) {
		
		this.con = con;
	}



	public boolean insertLike(int pid, int uid) {

		
		boolean f= false;
		try {
			
			String query = "insert into liked(pid,uid) values(?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			
			f=true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
			
	}
	
	public int countLikeOnPost(int pid) {
		int count=0;
		String query = "select count(*) from liked where pid=?";
		try {
						
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, pid);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				count = set.getInt("count(*)");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		try {
			PreparedStatement pstmt = this.con.prepareStatement("select * from liked where pid=? and uid=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				f = true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		try {
			PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid=? and uid = ?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}
	
}
