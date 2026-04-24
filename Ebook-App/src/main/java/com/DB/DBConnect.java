package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	
	private static final String url = "jdbc:mysql://localhost:3306/ebook-app";
	private static final String user = "root";
	private static final String password = "#01TMKOCGoliGogiOG";
	
	private static Connection conn;
	public static Connection getConn() {
	    if (conn != null) {
	        try {
	            if (!conn.isClosed()) {
	                return conn;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(url, user, password);
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }

	    return conn;
	}

}
