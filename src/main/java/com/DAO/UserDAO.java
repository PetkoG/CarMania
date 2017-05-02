package com.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDAO {
	
	public static synchronized void addUser (User user) throws SQLException{
		String query = "INSERT INTO users(username, password, email, age) VALUES (?,?,?,?)";
		PreparedStatement ps;
		long id = 0;
		ps = DBManager.getInstance().getConnection().prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getEmail());
		ps.setInt(4, user.getAge());
		ps.execute();
		ResultSet rs = ps.getGeneratedKeys();
		rs.next();
		id = rs.getLong(1);
		ps.close();
		
		String query2 = "INSERT INTO phonenumbers(user_id_fk, phonenumber) VALUES (?,?)";
		for (int i=0;i<user.getPhoneNumbers().size();i++){
			PreparedStatement ps2 = DBManager.getInstance().getConnection().prepareStatement(query2);
			ps2.setLong(1, id);
			ps2.setString(2, user.getPhoneNumbers().get(i));
			ps2.execute();
			ps2.close();
		}
		
		
	}
	public static boolean validLogin(String username, String password) throws SQLException {
		String query = "SELECT user_id, username, password FROM carmania.users WHERE username = ? AND password = ?";
		PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query);
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		boolean valid = rs.next();
		ps.close();
		return valid;
		
	}
	public static String getUserByEmail(String email) throws SQLException {
		String query = "SELECT username FROM carmania.users WHERE email = ?";
		PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		String username = rs.getString(1);
		ps.close();
		return username;
	}

	public static User getUser(String username) throws SQLException {
		String query1 = "SELECT user_id, username, password, email, age FROM carmania.users WHERE username = ?";
		PreparedStatement ps1 = DBManager.getInstance().getConnection().prepareStatement(query1);
		ps1.setString(1, username);
		ResultSet rs1 = ps1.executeQuery();
		rs1.next();
		int id = rs1.getInt(1);
		String uname = rs1.getString(2);
		String password = rs1.getString(3);
		String email = rs1.getString(4);
		int age = rs1.getInt(5);
		User user = new User(uname, email, password, age);
		String query2 = "SELECT phonenumber FROM carmania.phonenumbers WHERE user_id_fk = ?";
		PreparedStatement ps2 = DBManager.getInstance().getConnection().prepareStatement(query2);
		ps2.setInt(1, id);
		ResultSet rs2 = ps2.executeQuery();
		while (rs2.next()){
			user.getPhoneNumbers().add(rs2.getString(1));
		}
		ps1.close();
		ps2.close();
		return user;
	}
	
	public static int getUserId(String username) throws SQLException{
		String query1 = "SELECT user_id FROM carmania.users WHERE username = ?";
		PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query1);
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int id = rs.getInt(1);
		ps.close();
		return id;
		
	}
	public static void changePass(int id,String password) throws SQLException{
		String query = "UPDATE carmania.users SET password = ?  WHERE user_id = ? ";
		PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query);
		ps.setString(1, password);
		ps.setInt(2, id);
		ps.executeUpdate();
		ps.close();
	}
	
	public static User getUser(int id) throws SQLException{
		String query1 = "SELECT user_id, username, password, email, age FROM carmania.users WHERE user_id = ?";
		PreparedStatement ps1 = DBManager.getInstance().getConnection().prepareStatement(query1);
		ps1.setInt(1, id);
		ResultSet rs1 = ps1.executeQuery();
		rs1.next();
		int user_id = rs1.getInt(1);
		String username = rs1.getString(2);
		String password = rs1.getString(3);
		String email = rs1.getString(4);
		int age = rs1.getInt(5);
		User user = new User(username, email, password, age);
		String query2 = "SELECT phonenumber FROM carmania.phonenumbers WHERE user_id_fk = ?";
		PreparedStatement ps2 = DBManager.getInstance().getConnection().prepareStatement(query2);
		ps2.setInt(1, user_id);
		ResultSet rs2 = ps2.executeQuery();
		while (rs2.next()){
			user.getPhoneNumbers().add(rs2.getString(1));
		}
		ps1.close();
		ps2.close();
		return user;
	}
}
