package cart;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import product.ProductVO;

public class CartDAO {

	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	
	public CartDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int checkCart(String id, int PCode) {
		int count = 0;
		try {
			con = dataFactory.getConnection();
			String sql = "SELECT count(*) as cnt FROM cart";
			sql += " WHERE ID='" + id + "' AND PCODE =" + PCode;
			System.out.println("prepareStatememt : " + sql);
			pstmt = con.prepareStatement(sql);
			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.err.println(count);
		return count;
	}
	
//	public List<CartVO> CartList(String id){
//		List<CartVO> list = new ArrayList<CartVO>();
//		try {
//			con = dataFactory.getConnection();
//			
//			String sql = "SELECT PCODE FROM cart";
//			sql += " where id = ?";
//			System.out.println("preparedStatement : " + sql);
//			
//			pstmt = con.prepareStatement(sql);
//			ResultSet rs = pstmt.executeQuery(sql);
//			while(rs.next()) {
//				int PCode = rs.getInt("PCODE");
//				
//				CartVO cart = new CartVO();
//				cart.setPCODE(PCode);
//				
//				list.add(cart);
//			}
//			
//			rs.close();
//			pstmt.close();
//			con.close();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	
	public void addCart(CartVO cartVO) {
		try {
			con = dataFactory.getConnection();
			int PCode = cartVO.getPCODE();
			String id = cartVO.getID();
			int quantity = cartVO.getQUANTITY();
			
			String sql = "INSERT INTO cart";
			sql += " (PCODE, ID,QUANTITY)";
			sql += " VALUES(?,?,?)";
			System.out.println("prepareStatememt : " + sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, PCode);
			pstmt.setString(2, id);
			pstmt.setInt(3, quantity);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	public void deleteCart(CartVO cartVO) {
//		try {
//			con = dataFactory.getConnection();
//			int PCode = cartVO.getPCODE();
//			String id = cartVO.getID();
//			
//			String sql = "delete from cart" + " where PCODE=? and ID = ?";
//			System.out.println("prepareStatement : " + sql);
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, PCode);
//			pstmt.setString(1, id);
//			pstmt.executeUpdate();
//			pstmt.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}
