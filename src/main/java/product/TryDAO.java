package product;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TryDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	
	public TryDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addCart(TryVO vo) {
		try {
			con = dataFactory.getConnection();
			String img = vo.getImg();
			String name = vo.getName();
			
			String sql = "INSERT INTO try";
			sql += " (img, name)";
			sql += " VALUES(?,?)";
			System.out.println("prepareStatememt : " + sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, img);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
