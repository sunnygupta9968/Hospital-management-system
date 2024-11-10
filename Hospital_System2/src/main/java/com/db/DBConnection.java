package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
	private static Connection conn;
	public static Connection getConn(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://mysql.railway.internal:3306/railway","root", "lDBWjsDZVquzIdIJOdiRdhoLVQwUHQsC");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
		
	}

}
