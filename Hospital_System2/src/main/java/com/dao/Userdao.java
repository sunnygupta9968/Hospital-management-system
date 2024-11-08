package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;
public class Userdao {
	private Connection conn;
	public Userdao(Connection conn) {
		super();
		this.conn=conn;
	}
public User login(String email,String password){
	User u=null;
	
	try {
		String sql="select * from user_dlts where email=? and password=?";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			u=new User();
			u.setId(rs.getInt(1));
			u.setFullname(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPassword(rs.getString(4));
		}
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	return u;
}

public boolean register(User p) {
	boolean f=false;
	try {
		String sql="insert into user_dlts(full_name,email,password) values(?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1,p.getFullname());
		ps.setString(2,p.getEmail());
		ps.setString(3,p.getPassword());
		
		
		
		
		
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return f;
}
public int getUserCount() {
	int size=0;
	try {
		String query="select * from user_dlts";
		PreparedStatement ps=conn.prepareStatement(query);
		ResultSet doc=ps.executeQuery();
		while(doc.next()) {
			size++;
}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return size;
}

}
