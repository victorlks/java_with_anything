package org.lks.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static final String DRIVERCLASS = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1/test?serverTimezone=UTC";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "19990821";
	
	private Connection conn = null; 
	
	public DatabaseConnection(){
		try {
			Class.forName(DRIVERCLASS);
			this.conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		return this.conn;
	}
	
	public void close(){
		try {
			if(this.conn != null){
				this.conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
