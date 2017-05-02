package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.model.Advert;
import com.model.Comment;
import com.model.SearchParams;

public class AdvertDAO {

	public synchronized static void addAdvert(Advert advert) throws SQLException {
		
		String sql = "INSERT INTO adverts(mark, model, price, category, year, hp, mileage, color, user_id_fk, title,"
				+ " description, creation, transmission, fuel, bodytype, image, vip) VALUES ((SELECT mark_id FROM marks WHERE marks.mark = ? LIMIT 1),"
				+ "(SELECT model_id FROM models WHERE models.model = ? LIMIT 1),?,(SELECT category_id FROM categories WHERE categories.category = ? LIMIT 1)"
				+ ",?,?,?,?,?,?,?,?,?,?,(SELECT bodytype_id FROM bodytypes WHERE bodytypes.bodytype = ? LIMIT 1),?,?)";
		PreparedStatement ps;
		Date date = java.sql.Date.valueOf(advert.getCreationTime());
		System.out.println(advert.getCreationTime());
		ps = DBManager.getInstance().getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		ps.setString(1, advert.getMark());
		ps.setString(2, advert.getModel());
		ps.setInt(3, advert.getPrice());
		ps.setString(4, advert.getCategory());
		ps.setInt(5, advert.getYear());
		ps.setInt(6, advert.getHorsePower());
		ps.setInt(7, advert.getMileage());
		ps.setString(8, advert.getColor());
		ps.setInt(9, advert.getUserId());
		ps.setString(10, advert.getTitle());
		ps.setString(11, advert.getDescription());
		ps.setDate(12, date);
		ps.setString(13, advert.getTransmissionType());
		ps.setString(14, advert.getFuelType());
		ps.setString(15, advert.getBodyType());
		ps.setString(16, advert.getImage());
		ps.setBoolean(17, advert.isVip());
		try{
			ps.execute();
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally{
			if (ps != null) ps.close();
		}
		
	}
	
	public static void cleanOldAdverts() throws SQLException{
		String sql = "DELETE FROM adverts WHERE creation < NOW()- INTERVAL 30 DAY";
		Connection con = DBManager.getInstance().getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		try {
			ps.execute();
		} finally {
			if (ps != null) ps.close();
		}
	}

	public static ArrayList<Advert> getMatchedAdverts(SearchParams params) throws SQLException {
		ArrayList<Advert> adverts = new ArrayList<>();
		String sql = "SELECT advert_id, marks.mark, models.model, price, categories.category, year, hp, mileage, color, user_id_fk,"
				+ " title, description, creation, transmission, fuel, bodytypes.bodytype, image, vip FROM adverts JOIN categories ON"
				+ " adverts.category = categories.category_id JOIN marks ON adverts.mark = marks.mark_id JOIN models ON"
				+ " adverts.model = models.model_id JOIN bodytypes ON adverts.bodytype = bodytypes.bodytype_id "
				+ "WHERE adverts.mark = IFNULL((SELECT mark_id FROM marks WHERE marks.mark = ?),adverts.mark) AND"
				+ " adverts.model = IFNULL((SELECT model_id FROM models WHERE models.model = ?),adverts.model) AND"
				+ " price BETWEEN ? AND ? AND adverts.category = IFNULL((SELECT category_id FROM categories WHERE"
				+ " categories.category = ?),adverts.category) AND year BETWEEN ? AND ? AND hp BETWEEN ? AND ? AND"
				+ " mileage < ? AND color = IFNULL(?,color) AND transmission = IFNULL(?,transmission) AND"
				+ " fuel = IFNULL(?,fuel) AND adverts.bodytype = IFNULL((SELECT bodytype_id FROM bodytypes WHERE"
				+ " bodytypes.bodytype = ?),adverts.bodytype) ORDER BY ? LIMIT 4 OFFSET ?";
		Connection con = DBManager.getInstance().getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, params.getMark());
		ps.setString(2, params.getModel());
		ps.setInt(3, params.getPriceFrom());
		ps.setInt(4, params.getPriceTo());
		ps.setString(5, params.getCategory());
		ps.setInt(6, params.getYearFrom());
		ps.setInt(7, params.getYearTo());
		ps.setInt(8, params.getHpFrom());
		ps.setInt(9, params.getHpTo());
		ps.setInt(10, params.getMaxMileage());
		ps.setString(11, params.getColor());
		ps.setString(12, params.getTransmission());
		ps.setString(13, params.getFuelType());
		ps.setString(14, params.getBodyType());
		ps.setString(15, params.getSortBy());
		ps.setInt(16, (params.getPage()-1)*4);
		ResultSet rs = null;
		try{
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("advert_id");
				String mark = rs.getString("mark");
				String model = rs.getString("model");
				int price = rs.getInt("price");
				System.out.println(price);
				String category = rs.getString("category");
				int year = rs.getInt("year");
				int hp = rs.getInt("hp");
				int mileage = rs.getInt("mileage");
				String color = rs.getString("color");
				int userId = rs.getInt("user_id_fk");
				String title = rs.getString("title");
				String description = rs.getString("description");
				LocalDate date = rs.getDate("creation").toLocalDate();
				String transmission = rs.getString("transmission");
				String fuel = rs.getString("fuel");
				String bodyType = rs.getString("bodytype");
				String image = rs.getString("image");
				boolean vip = rs.getBoolean("vip");
				Advert advert = new Advert(mark, model, price, category, year, hp, mileage, color, userId, title,
						description, date, transmission, fuel, bodyType, image,vip);
				advert.setId(id);
				
				adverts.add(advert);
			}
		} finally{
			if (ps != null) ps.close();
			if (rs != null) rs.close();
		}
		switch (params.getSortBy()) {
		case "mark":
			Collections.sort(adverts, new SortByMark());
			break;
		case "price":
			Collections.sort(adverts, new SortByPrice());
			break;
		case "mileage":
			Collections.sort(adverts, new SortByMileage());
			break;
		case "year":
			Collections.sort(adverts, new SortByYear());
			break;
		case "creation":
			Collections.sort(adverts, new SortByNew());
			break;
		default:
			break;
		}
		return adverts;
	}
	
	static class SortByMark implements Comparator<Advert>{

		@Override
		public int compare(Advert o1, Advert o2) {
			return o1.getMark().compareTo(o2.getMark());
		}
		
	}
	
	static class SortByPrice implements Comparator<Advert>{

		@Override
		public int compare(Advert o1, Advert o2) {
			return o1.getPrice() - o2.getPrice();
		}
		
	}
	
	static class SortByMileage implements Comparator<Advert>{

		@Override
		public int compare(Advert o1, Advert o2) {
			return o1.getMileage() - o2.getMileage();
		}
		
	}

	static class SortByYear implements Comparator<Advert>{

		@Override
		public int compare(Advert o1, Advert o2) {
			return o1.getYear() - o2.getYear();
		}
		
	}

	static class SortByNew implements Comparator<Advert>{

		@Override
		public int compare(Advert o1, Advert o2) {
			return o1.getCreationTime().compareTo(o2.getCreationTime());
		}
		
	}
	
	public static Integer pageCount(SearchParams params) throws SQLException{
		
		String sql = "SELECT COUNT(*) FROM adverts JOIN categories ON adverts.category = categories.category_id JOIN"
				+ " marks ON adverts.mark = marks.mark_id JOIN models ON adverts.model = models.model_id JOIN bodytypes ON"
				+ " adverts.bodytype = bodytypes.bodytype_id WHERE adverts.mark = IFNULL((SELECT mark_id FROM marks WHERE"
				+ " marks.mark = ?),adverts.mark) AND adverts.model = IFNULL((SELECT model_id FROM models WHERE"
				+ " models.model = ?),adverts.model) AND price BETWEEN ? AND ? AND adverts.category = IFNULL"
				+ "((SELECT category_id FROM categories WHERE categories.category = ?),adverts.category) AND"
				+ " year BETWEEN ? AND ? AND hp BETWEEN ? AND ? AND mileage < ? AND color = IFNULL(?,color) AND"
				+ " transmission = IFNULL(?,transmission) AND fuel = IFNULL(?,fuel) AND adverts.bodytype = "
				+ "IFNULL((SELECT bodytype_id FROM bodytypes WHERE bodytypes.bodytype = ?),adverts.bodytype) ORDER BY ?";
		Integer pages;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setString(1, params.getMark());
			ps.setString(2, params.getModel());
			ps.setInt(3, params.getPriceFrom());
			ps.setInt(4, params.getPriceTo() < 0 ? 999999 : params.getPriceTo());
			ps.setString(5, params.getCategory());
			ps.setInt(6, params.getYearFrom());
			ps.setInt(7, params.getYearTo() < 0 ? 999999 : params.getYearTo());
			ps.setInt(8, params.getHpFrom());
			ps.setInt(9, params.getHpTo() < 0 ? 999999 : params.getHpTo());
			ps.setInt(10, params.getMaxMileage() < 0 ? 9999999 : params.getMaxMileage());
			ps.setString(11, params.getColor());
			ps.setString(12, params.getTransmission());
			ps.setString(13, params.getFuelType());
			ps.setString(14, params.getBodyType());
			ps.setString(15, params.getSortBy());
			rs = ps.executeQuery();
			rs.next();
			if (rs.getInt(1)<=4){
				pages = 1;
			}else {
				if(rs.getInt(1)%4==0){
					pages = (rs.getInt(1)/4);
				}
				else {
					pages = ((rs.getInt(1)/4)+1);
				}
			}
		} finally {
			if (ps != null) ps.close();
			if (rs != null) rs.close();
		}
		return pages;
	}
	
	public static ArrayList<Advert> getVipAdverts() throws SQLException {
		String sql = "SELECT advert_id, marks.mark, models.model, price, categories.category, year, hp, mileage,"
				+ " color, user_id_fk, title, description, creation, transmission, fuel, bodytypes.bodytype, image, vip FROM"
				+ " adverts JOIN categories ON adverts.category = categories.category_id JOIN marks ON adverts.mark ="
				+ " marks.mark_id JOIN models ON adverts.model = models.model_id JOIN bodytypes ON adverts.bodytype ="
				+ " bodytypes.bodytype_id WHERE vip = ?";
		ArrayList<Advert> adverts = new ArrayList<Advert>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setBoolean(1, true);
			rs = ps.executeQuery();
			while (rs.next()){
				int id = rs.getInt("advert_id");
				String mark = rs.getString("mark");
				String model = rs.getString("model");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int year = rs.getInt("year");
				int hp = rs.getInt("hp");
				int mileage = rs.getInt("mileage");
				String color = rs.getString("color");
				int userId = rs.getInt("user_id_fk");
				String title = rs.getString("title");
				String description = rs.getString("description");
				LocalDate date = rs.getDate("creation").toLocalDate();
				String transmission = rs.getString("transmission");
				String fuel = rs.getString("fuel");
				String bodyType = rs.getString("bodytype");
				String image = rs.getString("image");
				boolean vip = rs.getBoolean("vip");
				Advert advert = new Advert(mark, model, price, category, year, hp, mileage, color, userId, title,
						description, date, transmission, fuel, bodyType, image,vip);
				advert.setId(id);
	
				String sql2 = "SELECT text, user_id_fk FROM carmania.comments WHERE advert_id_fk = ?";
				PreparedStatement ps2 = DBManager.getInstance().getConnection().prepareStatement(sql2);
				ps2.setInt(1, id);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()){
					Comment comment = new Comment(rs2.getString("text"),UserDAO.getUser(rs2.getInt("user_id_fk")), id);
					advert.getComments().add(comment);
				}
				adverts.add(advert);
			}
		}
			finally {
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			}
		return adverts;
		
	}
	
	public static Advert getAdvert(int advertId) throws SQLException{
		String sql = "SELECT advert_id, marks.mark, models.model, price, categories.category, year, hp, mileage,"
				+ " color, user_id_fk, title, description, creation, transmission, fuel, bodytypes.bodytype, image, vip FROM"
				+ " adverts JOIN categories ON adverts.category = categories.category_id JOIN marks ON adverts.mark ="
				+ " marks.mark_id JOIN models ON adverts.model = models.model_id JOIN bodytypes ON adverts.bodytype ="
				+ " bodytypes.bodytype_id WHERE advert_id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, advertId);
			rs = ps.executeQuery();
			if (rs.next()){
				int id = rs.getInt("advert_id");
				String mark = rs.getString("mark");
				String model = rs.getString("model");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int year = rs.getInt("year");
				int hp = rs.getInt("hp");
				int mileage = rs.getInt("mileage");
				String color = rs.getString("color");
				int userId = rs.getInt("user_id_fk");
				String title = rs.getString("title");
				String description = rs.getString("description");
				LocalDate date = rs.getDate("creation").toLocalDate();
				String transmission = rs.getString("transmission");
				String fuel = rs.getString("fuel");
				String bodyType = rs.getString("bodytype");
				String image = rs.getString("image");
				boolean vip = rs.getBoolean("vip");
	
				Advert advert = new Advert(mark, model, price, category, year, hp, mileage, color, userId, title,
						description, date, transmission, fuel, bodyType, image,vip);
				advert.setId(id);
	
				String sql2 = "SELECT text, user_id_fk FROM carmania.comments WHERE advert_id_fk = ?";
				PreparedStatement ps2 = DBManager.getInstance().getConnection().prepareStatement(sql2);
				ps2.setInt(1, id);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()){
					Comment comment = new Comment(rs2.getString("text"),UserDAO.getUser(rs2.getInt("user_id_fk")), id);
					advert.getComments().add(comment);
				}
				ps2.close();
				ps.close();
				return advert;
			}
		} finally {
			if (ps != null) ps.close();
			if (rs != null) rs.close();
		}
		return null;
	}
	
	public synchronized static void addComment(Comment comment) throws SQLException{
		String sql = "INSERT INTO comments(advert_id_fk, user_id_fk, text) VALUES (?, ?, ?)";
		PreparedStatement ps = null;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, comment.getAdvertId());
			ps.setInt(2, UserDAO.getUserId(comment.getUser().getUsername()));
			ps.setString(3, comment.getText());
			ps.execute();
		} finally {
			if (ps != null) ps.close();
		}
	}

	public static ArrayList<Advert> getMyAdverts(String username) throws SQLException {
		String sql1 = "SELECT user_id FROM carmania.users WHERE username = ?";
		ResultSet rs = null;
		PreparedStatement ps1 = null;
		ResultSet rs2 = null;
		PreparedStatement ps2 = null;
		ArrayList<Advert> myAdverts = new ArrayList<>();
		Connection con = DBManager.getInstance().getConnection();
		try {
			con.setAutoCommit(false);
			ps1 = con.prepareStatement(sql1);
			ps1.setString(1, username);
			rs2 = ps1.executeQuery();
			rs2.next();
			int userId = rs2.getInt(1);
			
			String sql2 = "SELECT advert_id, marks.mark, models.model, price, categories.category, year, hp, mileage, color,"
					+ " user_id_fk, title, description, creation, transmission, fuel, bodytypes.bodytype, image, vip FROM adverts JOIN"
					+ " categories ON adverts.category = categories.category_id JOIN marks ON adverts.mark = marks.mark_id"
					+ " JOIN models ON adverts.model = models.model_id JOIN bodytypes ON adverts.bodytype = bodytypes.bodytype_id WHERE"
					+ " user_id_fk = ? ";
			ps2 = DBManager.getInstance().getConnection().prepareStatement(sql2);
			ps2.setInt(1, userId);
			rs = ps2.executeQuery();
			con.commit();
			while (rs.next()) {
				int id = rs.getInt("advert_id");
				String mark = rs.getString("mark");
				String model = rs.getString("model");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int year = rs.getInt("year");
				int hp = rs.getInt("hp");
				int mileage = rs.getInt("mileage");
				String color = rs.getString("color");
				int user_id = rs.getInt("user_id_fk");
				String title = rs.getString("title");
				String description = rs.getString("description");
				LocalDate date = rs.getDate("creation").toLocalDate();
				String transmission = rs.getString("transmission");
				String fuel = rs.getString("fuel");
				String bodyType = rs.getString("bodytype");
				String image = rs.getString("image");
				boolean vip = rs.getBoolean("vip");
	
				Advert advert = new Advert(mark, model, price, category, year, hp, mileage, color, user_id, title,
						description, date, transmission, fuel, bodyType, image, vip);
				advert.setId(id);
				
				myAdverts.add(advert);
			}
		} catch (SQLException e) {
			con.rollback();
			throw new SQLException("rolled back, something went wrong");
		} finally {
			if (ps1 != null) ps1.close();
			if (ps2 != null) ps2.close();
			if (rs != null) rs.close();
			if (rs2 != null) rs2.close();
			con.setAutoCommit(true);
		}
		return myAdverts;
	}

	public synchronized static void deleteAdvert(int id) throws SQLException {
		Connection con = DBManager.getInstance().getConnection();
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		try {
			con.setAutoCommit(false);
			String sql1 = "DELETE FROM adverts WHERE advert_id = ?";
			ps1 = con.prepareStatement(sql1);
			ps1.setInt(1, id);
			ps1.execute();
			
			String sql2 = "DELETE FROM comments WHERE advert_id_fk = ?";
			ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, id);
			ps2.execute();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			throw new SQLException("rolled back, something went wrong");
		} finally {
			if (ps1 != null) ps1.close();
			if (ps2 != null) ps2.close();
			con.setAutoCommit(true);
		}
	}
}
