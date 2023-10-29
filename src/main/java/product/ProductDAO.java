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
			sql += " WHERE PDATE >= '" + date + "'"; // date 날짜 포함
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				int PCode = rs.getInt("PCODE");
				String PName = rs.getString("PNAME");
				int Price = rs.getInt("PRICE");
				int Stock = rs.getInt("STOCK");
				String Category = rs.getString("CATEGORY");
				float PKG = rs.getFloat("PKG");
				Date PDate = rs.getDate("PDATE");
				String PImg = rs.getString("PIMG");
				
				ProductVO product = new ProductVO();
				product.setPCODE(PCode);
				product.setPNAME(PName);
				product.setPRICE(Price);
				product.setSTOCK(Stock);
				product.setCATEGORY(Category);
				product.setPKG(PKG);
				product.setPDATE(PDate);
				product.setPIMG(PImg);
				
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
			sql += " WHERE CATEGORY='" + category + "' and ANIMAL = '" + animal +"'";
			sql += " ORDER BY PDATE DESC";
			sql += " LIMIT " + start + ", 9";
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				int PCode = rs.getInt("PCODE");
				String PName = rs.getString("PNAME");
				int Price = rs.getInt("PRICE");
				int Stock = rs.getInt("STOCK");
				String Category = rs.getString("CATEGORY");
				float PKG = rs.getFloat("PKG");
				Date PDate = rs.getDate("PDATE");
				String PImg = rs.getString("PIMG");
				
				ProductVO product = new ProductVO();
				product.setPCODE(PCode);
				product.setPNAME(PName);
				product.setPRICE(Price);
				product.setSTOCK(Stock);
				product.setCATEGORY(Category);
				product.setPKG(PKG);
				product.setPDATE(PDate);
				product.setPIMG(PImg);
				
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
			sql += " WHERE CATEGORY='" + category + "' and ANIMAL = '" + animal +"'";
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
			
			String sql = "SELECT * FROM product WHERE CATEGORY='" + category + "' and ANIMAL = '" + animal +"'";
			
			if(word.length() > 0) {
				sql += " and PNAME like '%" + word + "%'";
			}
			
			 if(category != null) {
				sql += " and CATEGORY = '"+ category +"'";
			}
			
			if(kg2 > 0) {
				sql += " and PKG between " + kg1 + " and " + kg2;
			}
			
			if(price2 > 0) {
				sql += " and PRICE between " + price1 + " and " + price2;
			}
			
			if(sub_category != null) {
				if(sub_category.length == 1) {
					sql += " and SUB_CATEGORY = '" + sub_category[0] +"'";
				} else if(sub_category.length > 1) {
					sql += " and (";
					for(int i = 0; i < sub_category.length; i++) {
						sql += "SUB_CATEGORY = '" + sub_category[i] + "'";
						if(i != sub_category.length-1) {
							sql += " or ";
						}
					}
					sql += ")";
				}
			}
			
			
			if(order == null || order.equals("recent")) {
				sql += " ORDER BY PDATE DESC";
			} else if(order.equals("Hprice")) {
				sql += " ORDER BY PRICE DESC";
			} else if(order.equals("Lprice")) {
				sql += " ORDER BY PRICE ASC";
			}
			
			sql += " LIMIT " + start + ", 9";
			
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				String PName = rs.getString("PNAME");
				int Price = rs.getInt("PRICE");
				String PImg = rs.getString("PIMG");
				
				ProductVO product = new ProductVO();
				product.setPNAME(PName);
				product.setPRICE(Price);
				product.setPIMG(PImg);
				
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
			
			String sql = "SELECT count(*) as cnt FROM product WHERE CATEGORY='" + category + "' and ANIMAL = '" + animal +"'";
			
			if(word != null) {
				sql += " and PNAME like '%" + word + "%'";
			}
			
			if(category != null) {
				sql += " and CATEGORY = '"+ category +"'";
			}
			
			if(kg2 > 0) {
				sql += " and PKG between " + kg1 + " and " + kg2;
			}

			if(price2 > 0) {
				sql += " and PRICE between " + price1 + " and " + price2;
			}

			if(sub_category != null) {
				if(sub_category.length == 1) {
					sql += " and SUB_CATEGORY = '" + sub_category[0] +"'";
				} else if(sub_category.length > 1) {
					sql += " and (";
					for(int i = 0; i < sub_category.length; i++) {
						sql += "SUB_CATEGORY = '" + sub_category[i] + "'";
						if(i != sub_category.length-1) {
							sql += " or ";
						}
					}
					sql += ")";
				}
			}
			
			if(order == null || order.equals("recent")) {
				sql += " ORDER BY PDATE DESC";
			} else if(order.equals("Hprice")) {
				sql += " ORDER BY PRICE DESC";
			} else if(order.equals("Lprice")) {
				sql += " ORDER BY PRICE ASC";
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
