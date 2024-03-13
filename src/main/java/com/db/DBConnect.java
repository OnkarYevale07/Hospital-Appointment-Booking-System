
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;
	
	public static Connection getConn() {
		try {
	        String url = "jdbc:mysql://localhost:3306/";
	        String userName = "root";
	        String password = "";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url+"hospital",userName,password);
			System.out.println(conn);
			System.out.println("Connected Successfully");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
