package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.TreeMap;

public class PopulateDAO {

	private static PopulateDAO instance;

	//Category -> Mark -> Model
	private HashMap<String, TreeMap<String, ArrayList<String>>> catMarkModel;
	// Category -> BodyType
	private HashMap<String, ArrayList<String>> catBody;
	
	private PopulateDAO() throws SQLException {
		catMarkModel = new HashMap<>();
		catBody = new HashMap<>();
		Connection con = DBManager.getInstance().getConnection();
		String sql1 = "SELECT category FROM categories";
		PreparedStatement pStatement1 = con.prepareStatement(sql1);
		ResultSet rSet1 = pStatement1.executeQuery();
		while (rSet1.next()){
			String category = rSet1.getString(1);
			catMarkModel.put(category, new TreeMap<>());
			catBody.put(category, new ArrayList<>());
		}
		
		String sql2 = "SELECT c.category, m.mark FROM marks m JOIN category_mark cm ON m.mark_id = cm.mark_id JOIN categories c ON cm.category_id = c.category_id ORDER BY m.mark";
		PreparedStatement pStatement2 = con.prepareStatement(sql2);
		ResultSet rSet2 = pStatement2.executeQuery();
		while (rSet2.next()){
			String category = rSet2.getString(1);
			String mark = rSet2.getString(2);
			catMarkModel.get(category).put(mark, new ArrayList<>());
		}
		
		String sql3 = "SELECT c.category, m.mark, mm.model FROM categories c JOIN models mm ON mm.category_id = c.category_id JOIN marks m ON mm.mark_id = m.mark_id ORDER BY mm.model LIMIT 10000";
		PreparedStatement pStatement3 = con.prepareStatement(sql3);
		ResultSet rSet3 = pStatement3.executeQuery();
		while (rSet3.next()){
			String category = rSet3.getString(1);
			String mark = rSet3.getString(2);
			String model = rSet3.getString(3);
			catMarkModel.get(category).get(mark).add(model);
		}
		
		String sql4 = "SELECT category, bodytype FROM categories JOIN bodytypes ON categories.category_id = bodytypes.category_id ORDER BY bodytype";
		PreparedStatement pStatement4 = con.prepareStatement(sql4);
		ResultSet rSet4 = pStatement4.executeQuery();
		while (rSet4.next()){
			String category = rSet4.getString(1);
			String bodytype = rSet4.getString(2);
			catBody.get(category).add(bodytype);
		}
		
		for (TreeMap<String, ArrayList<String>> mark : catMarkModel.values()) {
			for (ArrayList<String> model : mark.values()) {
				model.sort(null);
			}
		}
		
		
	}
	public static PopulateDAO getInstance() throws SQLException{
		if (instance == null){
			instance = new PopulateDAO();
		}
		return instance;
	}
	
	public HashMap<String, TreeMap<String, ArrayList<String>>> getCatMarkModel() {
		return catMarkModel;
	}
	public HashMap<String, ArrayList<String>> getCatBody() {
		return catBody;
	}
	
}
