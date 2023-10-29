package member;

import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
	
			dataFactory = (DataSource) envContext.lookup("jdbc/pet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void joinMember(MemberVO memberVO) {
		try {
			con = dataFactory.getConnection();
	
			String id = memberVO.getID();
			String password = memberVO.getPASSWORD();
			String pet_name = memberVO.getPET_NAME();
			String gender = memberVO.getPET_GENDER();
			String pet_yy = memberVO.getPET_YY();
			int month = memberVO.getPET_MONTH();
			String user_phone = memberVO.getUSER_PHONE();
			String home_add = memberVO.getHOME_ADD();
			String user_email = memberVO.getUSER_EMAIL();
			
	
			String sql = "insert into pet_member";
			sql += " (ID, PASSWORD, PET_NAME, PET_GENDER, PET_YY, PET_MONTH, USER_PHONE, HOME_ADD, USER_EMAIL)";
					
			sql += " VALUES(?,?,?,?,?,?,?,?,?)";
			System.out.println("prepareStatement : " + sql);
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, pet_name);
			pstmt.setString(4, gender);
			pstmt.setString(5, pet_yy);
			pstmt.setInt(6, month);
			pstmt.setString(7, user_phone);
			pstmt.setString(8, home_add);
			pstmt.setString(9, user_email);
			
			pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


