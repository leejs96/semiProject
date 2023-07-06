package product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	
	public ProductDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<ProductVO> newProduct(Date date){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM product";
			sql += " WHERE PDate >= '" + date + "'"; // date 날짜 포함
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				int PCode = rs.getInt("PCode");
				String PName = rs.getString("PName");
				int Price = rs.getInt("price");
				int Stock = rs.getInt("stock");
				String Category = rs.getString("category");
				int PKG = rs.getInt("PKG");
				Date PDate = rs.getDate("PDate");
				String PImg = rs.getString("PImg");
				
				ProductVO product = new ProductVO();
				product.setPCode(PCode);
				product.setPName(PName);
				product.setPrice(Price);
				product.setStock(Stock);
				product.setCategory(Category);
				product.setPKG(PKG);
				product.setPDate(PDate);
				product.setPImg(PImg);
				
				list.add(product);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ProductVO> listProduct(int start, String category, String animal){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM product";
			sql += " WHERE category='" + category + "' and animal = '" + animal +"'";
			sql += " ORDER BY PDate DESC";
			sql += " LIMIT " + start + ", 9";
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				int PCode = rs.getInt("PCode");
				String PName = rs.getString("PName");
				int Price = rs.getInt("price");
				int Stock = rs.getInt("stock");
				String Category = rs.getString("category");
				int PKG = rs.getInt("PKG");
				Date PDate = rs.getDate("PDate");
				String PImg = rs.getString("PImg");
				
				ProductVO product = new ProductVO();
				product.setPCode(PCode);
				product.setPName(PName);
				product.setPrice(Price);
				product.setStock(Stock);
				product.setCategory(Category);
				product.setPKG(PKG);
				product.setPDate(PDate);
				product.setPImg(PImg);
				
				list.add(product);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int Count(String category, String animal) {
		int count = 0; 
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM product";
			sql += " WHERE category='" + category + "' and animal = '" + animal +"'";
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<ProductVO> listProduct(int start, String word, String category, String animal, String order, float kg1, float kg2, int price1, int price2, String[] sub_category){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {	
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM product WHERE category='" + category + "' and animal = '" + animal +"'";
			
			if(word.length() > 0) {
				sql += " and PName like '%" + word + "%'";
			}
			
			 if(category != null) {
				sql += " and category = '"+ category +"'";
			}
			
			if(kg2 > 0) {
				sql += " and PKG between " + kg1 + " and " + kg2;
			}
			
			if(price2 > 0) {
				sql += " and price between " + price1 + " and " + price2;
			}
			
			if(sub_category != null) {
				if(sub_category.length == 1) {
					sql += " and sub_category = '" + sub_category[0] +"'";
				} else if(sub_category.length > 1) {
					sql += " and (";
					for(int i = 0; i < sub_category.length; i++) {
						sql += "sub_category = '" + sub_category[i] + "'";
						if(i != sub_category.length-1) {
							sql += " or ";
						}
					}
					sql += ")";
				}
			}
			
			
			if(order == null || order.equals("recent")) {
				sql += " ORDER BY PDate DESC";
			} else if(order.equals("Hprice")) {
				sql += " ORDER BY price DESC";
			} else if(order.equals("Lprice")) {
				sql += " ORDER BY price ASC";
			}
			
			sql += " LIMIT " + start + ", 9";
			
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				int PCode = rs.getInt("PCode");
				String PName = rs.getString("PName");
				int Price = rs.getInt("price");
				int Stock = rs.getInt("stock");
				String Category = rs.getString("category");
				int PKG = rs.getInt("PKG");
				Date PDate = rs.getDate("PDate");
				String PImg = rs.getString("PImg");
				
				ProductVO product = new ProductVO();
				product.setPCode(PCode);
				product.setPName(PName);
				product.setPrice(Price);
				product.setStock(Stock);
				product.setCategory(Category);
				product.setPKG(PKG);
				product.setPDate(PDate);
				product.setPImg(PImg);
				
				list.add(product);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int SearchCount(String word, String category, String animal, String order, float kg1, float kg2, int price1, int price2, String[] sub_category) {
		int count = 0; 
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM product WHERE category='" + category + "' and animal = '" + animal +"'";
			
			if(word != null) {
				sql += " and PName like '%" + word + "%'";
			}
			
			if(category != null) {
				sql += " and category = '"+ category +"'";
			}
			
			if(kg2 > 0) {
				sql += " and PKG between " + kg1 + " and " + kg2;
			}

			if(price2 > 0) {
				sql += " and price between " + price1 + " and " + price2;
			}

			if(sub_category != null) {
				if(sub_category.length == 1) {
					sql += " and sub_category = '" + sub_category[0] +"'";
				} else if(sub_category.length > 1) {
					sql += " and (";
					for(int i = 0; i < sub_category.length; i++) {
						sql += "sub_category = '" + sub_category[i] + "'";
						if(i != sub_category.length-1) {
							sql += " or ";
						}
					}
					sql += ")";
				}
			}
			
			if(order == null || order.equals("recent")) {
				sql += " ORDER BY PDate DESC";
			} else if(order.equals("Hprice")) {
				sql += " ORDER BY price DESC";
			} else if(order.equals("Lprice")) {
				sql += " ORDER BY price ASC";
			}
			
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			System.out.println("cnt : " + count);
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
}
