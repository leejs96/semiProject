package member;

import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs = null;
	
	public LoginDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
	
			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		public boolean login(String id, String password) {
			int count = 0;
			
			try {
				con = dataFactory.getConnection();
				
				String sql = "SELECT count(*) as cnt FROM pet_member";
				sql += " WHERE ID = '" + id + "' AND PASSWORD = '" + password + "'";
				
				System.out.println("prepareStatement : " + sql);
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery(sql);

				while(rs.next()) {
					count = rs.getInt("cnt");
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(count == 1) {
				return true;
			} else {
				return false;
			}
	}

}
