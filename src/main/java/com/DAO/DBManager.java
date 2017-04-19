package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {

	public static final String DB_PASS = "root12345";
	private static DBManager instance;
	public static final String DB_IP = "127.0.0.1";
	public static final String DB_PORT = "3306";
	public static final String DB_NAME = "CarMania";
	public static final String DB_USER = "root";
	private Connection con = null;
	
	private DBManager() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("something wrong with driver class" + e.getMessage());
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://"+DB_IP+":"+DB_PORT+"/"+DB_NAME, DB_USER, DB_PASS);
		} catch (SQLException e) {
			System.out.println("problem with connection in DBManeger");
		}
	}
	
	public static DBManager getInstance() {
		if (instance == null){
			instance = new DBManager();
		}
		return instance;
	}
	
	public Connection getConnection() {
		return con;
	}
	
}
