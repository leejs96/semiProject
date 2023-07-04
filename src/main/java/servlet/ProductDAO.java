package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Date;

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
	
	public List<ProductVO> listProduct(){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM product";
			sql += " ORDER BY PDate DESC";
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
	
	
	public List<ProductVO> listProduct(String food, String snack){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {	
			con = dataFactory.getConnection();
			
			String sql = "SELECT * FROM product"
					+ " WHERE 1=1";
			
			if(food != null) {
				sql += " and category = '사료'";
			}
			
			if(snack != null) {
				sql += " and category = '간식'";
			}
			
			
			sql += " ORDER BY PDate DESC";
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
}
